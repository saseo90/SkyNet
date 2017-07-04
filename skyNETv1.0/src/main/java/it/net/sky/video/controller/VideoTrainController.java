package it.net.sky.video.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
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
import it.net.sky.video.vo.VideoBoardVo;
import it.net.sky.video.vo.VideoCategoryVo;
import it.net.sky.video.vo.VideoInfoVo;



@Controller
@RequestMapping(value="videoTraining")
public class VideoTrainController {
	
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
	
	
	@ModelAttribute("videoboard")
	public VideoBoardVo formValue(){
		return new VideoBoardVo();
	}
	
	
	
	
	@RequestMapping(value="/main")
	public String videomain(Model model){
	 List<VideoBoardVo> list;
	 List<VideoCategoryVo> listcategory;
	 
	 
	try {
		list = service.selectvideo((String) SessionUtil.getAttribute("id"));
		listcategory = service4.selecttypecategory();
		model.addAttribute("list", list);
		model.addAttribute("listcategory", listcategory);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
			 	
		
		return "video/videomain";
	}
	
	@RequestMapping("/videoupload")
	public String videoupload(Model model){
	
	/*	vo.setCategory("없음");
		model.addAttribute("videoboard",vo);*/
		
		List<VideoCategoryVo> list  = service4.selecttypecategory();
		
						
		List<String> categories = new ArrayList<>();
			
		
		for(VideoCategoryVo v : list){
			categories.add(v.getTypecategory());
		}
		
		/*List<String> categories2 = new ArrayList<>();
			for(DepartmentVo d : listdep){
				categories2.add(d.getDep_name());
				
			}*/
		
		
		
		//model.addAttribute("categories", categories);
		
		model.addAttribute("categories", categories);
		
		
		return "video/videoupload";
	}
	
		
	
	@RequestMapping("/videowatch")
	public String videotest2(){
		
		
		return "video/video";
	}
	

	
	
	
	@Transactional(isolation=Isolation.DEFAULT,
	  propagation=Propagation.REQUIRED)	
	@RequestMapping(value="/videoupload",method=RequestMethod.POST)
	public String videoupload(@Valid @ModelAttribute("videoboard") VideoBoardVo vo,BindingResult result,Model model){
		
		if(result.hasErrors()){
			
			List<VideoCategoryVo> list  = service4.selecttypecategory();
			
			
			List<String> categories = new ArrayList<>();
				
			
			for(VideoCategoryVo v : list){
				categories.add(v.getTypecategory());
			}
			
						
			model.addAttribute("categories", categories);
						
			return "video/videoupload";
		}
		
		
		MultipartFile vfile = vo.getVfile();
		
		
		service.insertvideo(vo);
		
		
		
		
		
		VideoInfoVo infovo = null;
		//int bnum = vo.getBnum();
		
		if(vfile.getSize() != 0){
					
			infovo = new VideoInfoVo();
			
			File file = new File(saveFolder,vfile.getOriginalFilename());
			
			
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
		
	
		
		
		//String filename = this.uploadProcess(vo.getVideotitle(),vo.getVideofile());
		//model.addAttribute("result", filename); 
		//model안써도 vo가 넘어간다 reportvVo.뭐뭐 로 
					
				
				
		
		return "redirect:/videoTraining/main";
	}
	
	
	
	@RequestMapping(value="/selectbytype/{categoryName}")
	public String videomain2(Model model,@PathVariable String categoryName){
		
	 List<VideoBoardVo> list;
	 List<VideoCategoryVo> listcategory;
	 
	 Map<String,String> map = new HashMap<>();
	 
	 try {
		map.put("id", (String) SessionUtil.getAttribute("id"));
		map.put("category", categoryName);
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	 
	 list = service.selectbytype(map);	 
	 
	
	listcategory = service4.selecttypecategory();
	
	/*for(VideoCategoryVo v : listcategory){
		if(v.getTypecategory()==categoryName){
			
			model.addAttribute("selected", "selected='selected'");
			
		}
	}*/
	model.addAttribute("selectedCategory", categoryName);
	model.addAttribute("list", list);
	model.addAttribute("listcategory", listcategory);

			 	
		
		return "video/videomain";
	}
	
			
	
	
	
	
	
	
}
