package it.net.sky.video.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import it.net.sky.video.service.VideoConnectService;
import it.net.sky.video.service.VideoInfoService;
import it.net.sky.video.service.VideoTrainService;
@Controller
@RequestMapping(value="videoTraining")
public class VideoDeleteController {
	
	@Resource(name="videoTrainService")
	VideoTrainService service;
	
	@Resource(name="videoInfoService")
	VideoInfoService service2;
	
	@Resource(name="videoConnectService")
	VideoConnectService service3;
	
	
	@RequestMapping(value="/delete/{bnum}")
	public String videoeditform(Model model,@PathVariable int bnum){
		
		service3.deletevideocomplete(bnum);
		service2.updateinfo(bnum);
		service.deletevideo(bnum);
		
		
		return "redirect:/videoTraining/main";
	}
}
