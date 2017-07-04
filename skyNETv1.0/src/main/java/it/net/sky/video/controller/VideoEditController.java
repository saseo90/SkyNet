package it.net.sky.video.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import it.net.sky.util.session.SessionUtil;
import it.net.sky.video.service.VideoCategoryService;
import it.net.sky.video.service.VideoConnectService;
import it.net.sky.video.service.VideoInfoService;
import it.net.sky.video.service.VideoTrainService;
import it.net.sky.video.vo.ConnectVideoVo;
import it.net.sky.video.vo.VideoBoardVo;
import it.net.sky.video.vo.VideoCategoryVo;
import it.net.sky.video.vo.VideoInfoVo;

@Controller
@RequestMapping(value="videoTraining")
public class VideoEditController {
	@Resource(name="videoTrainService")
	VideoTrainService service;
	
	@Resource(name="videoInfoService")
	VideoInfoService service2;
	
	@Resource(name="videoConnectService")
	VideoConnectService service3;
	
	@Resource(name="videoCategoryService")
	VideoCategoryService service4;
	
	@Value("#{videoProp.savePath}")
	File saveFolder;
	
	
	
	@RequestMapping(value="/edit/{bnum}")
	public String videoeditform(Model model,@PathVariable int bnum){
		
		
		List<VideoCategoryVo> list  = service4.selecttypecategory();
		
				
		
		List<String> categories = new ArrayList<>();
			
		
		for(VideoCategoryVo v : list){
			categories.add(v.getTypecategory());
		}
		
		
		
		model.addAttribute("categories", categories);
		
		
		
		
		
		
		
		
		VideoBoardVo vo = service.selectbnum(bnum);
		
		model.addAttribute("videoboard", vo);
		
		
		return "video/videoupload";
	}
	
	
	@RequestMapping(value="/edit/{bnum}",method=RequestMethod.POST)
	public String videoedit(@Valid @ModelAttribute("videoboard")VideoBoardVo vo,BindingResult result, @PathVariable int bnum,Model model){
		
		if(result.hasErrors()){
			
			List<VideoCategoryVo> list  = service4.selecttypecategory();
			
			
			List<String> categories = new ArrayList<>();
				
			
			for(VideoCategoryVo v : list){
				categories.add(v.getTypecategory());
			}
			
						
			model.addAttribute("categories", categories);
						
			
			return "video/videoupload";
		}
		
		
		vo.setBnum(bnum);
		service.updatevideo(vo);
		service2.updateinfo(bnum);
		
		MultipartFile vfile = vo.getVfile();
		
//		ConnectVideoVo v3 = new ConnectVideoVo();
//		v3.setBnum(varbnum);
//		v3.setMember_enum(loginId);
		String loginId = "";
		try {
			 loginId =  (String) SessionUtil.getAttribute("id");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ConnectVideoVo v3 = new ConnectVideoVo();
		v3.setBnum(vo.getBnum());
		v3.setMember_enum(loginId);
		ConnectVideoVo vv = new ConnectVideoVo();
		vv = service3.selectvideocomplete(v3);
		
		if(vv!= null){
			//전체회원이 본 것을 시청전으로돌리기때문에 세션 아이디 넣어주면 안됨.
			vv.setComplete("시청전");
			vv.setWatchinfo(0);
			service3.updateAllvideocomplete(vv);
		}
			
		
		//vv.getMember_enum() != loginId
		
		VideoInfoVo infovo = null;
		//int bnum = vo.getBnum();
		
		if(vfile.getSize() != 0){
					
			infovo = new VideoInfoVo();
			
			File file = new File(saveFolder,vfile.getOriginalFilename());
			
			infovo.setBnum(bnum);
			infovo.setVsize(vfile.getSize());
			infovo.setOriname(vfile.getOriginalFilename());
			infovo.setStoredname(System.currentTimeMillis() + "_" + vfile.getOriginalFilename());
			
			try {
				vfile.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
			service2.insertvideoinfo(infovo);
		return "redirect:/videoTraining/main";
	}
}
