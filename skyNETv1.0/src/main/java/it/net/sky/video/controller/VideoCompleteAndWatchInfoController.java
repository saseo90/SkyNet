package it.net.sky.video.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.net.sky.util.session.SessionUtil;
import it.net.sky.video.service.VideoConnectService;
import it.net.sky.video.vo.ConnectVideoVo;

@Controller
@RequestMapping(value="videoTraining")
public class VideoCompleteAndWatchInfoController {
	
	
	@Resource(name="videoConnectService")
	VideoConnectService service;
	
		
	@RequestMapping(value="/videocomplete")
	public String videoeditform(Model model,@RequestParam int varbnum){
		String loginId = "";
		try {
			 loginId =  (String) SessionUtil.getAttribute("id");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		ConnectVideoVo v3 = new ConnectVideoVo();
		v3.setBnum(varbnum);
		v3.setMember_enum(loginId);
		ConnectVideoVo vv = new ConnectVideoVo();
		
		
		
		vv = service.selectvideocomplete(v3);
		
		
		
		if(vv==null){
			
			
			ConnectVideoVo vo = new ConnectVideoVo();
			
			vo.setMember_enum(loginId);
			vo.setBnum(varbnum);
			vo.setComplete("시청완료");
							
			
					
			service.insertvideocomplete(vo);
		}else{
			
			vv.setMember_enum(loginId);
			vv.setComplete("시청완료");
			vv.setWatchinfo(0);
			service.updatevideocomplete(vv);
			
		}
		
				
			
		
		return "redirect:/videoTraining/main";
	}
	

	
	
	@RequestMapping(value="/halt")
	public String videoeditform(Model model,@RequestParam int varbnum,@RequestParam int varwatch,@RequestParam int vartotallength){
	
		int resultPercent  = (int) (((float)varwatch / (float)vartotallength) * 100);  
		String loginId = "";
		
		try {
			loginId = (String) SessionUtil.getAttribute("id");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ConnectVideoVo v3 = new ConnectVideoVo();
		v3.setBnum(varbnum);
		v3.setMember_enum(loginId);
		
		ConnectVideoVo vv = new ConnectVideoVo();
		
		vv = service.selectvideocomplete(v3);
	
		
		
		
		
		if(vv==null){
		
					
			ConnectVideoVo vo = new ConnectVideoVo();
			
			vo.setMember_enum(loginId);
			vo.setBnum(varbnum);
			vo.setComplete("시청중"+" ("+resultPercent+"%)");
			vo.setWatchinfo(varwatch);
			service.insertvideocomplete(vo);
					
			
		}else{
		
			vv.setMember_enum(loginId);
			vv.setComplete("시청중"+" ("+resultPercent+"%)");
			vv.setWatchinfo(varwatch);
			
			service.updatevideocomplete(vv);
			
		}
		
		
			
		
		
		return "redirect:/videoTraining/main";
	}
	
	
	
}
