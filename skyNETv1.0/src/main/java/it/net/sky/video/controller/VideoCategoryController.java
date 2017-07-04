package it.net.sky.video.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import it.net.sky.video.service.VideoCategoryService;

import it.net.sky.video.vo.VideoCategoryVo;

@Controller
@RequestMapping(value="videoTraining")
public class VideoCategoryController {

	@Resource(name="videoCategoryService")
	VideoCategoryService service;
	
	
	
	
	
	@RequestMapping(value="/selecttypecategory",method=RequestMethod.POST)
	public @ResponseBody List<VideoCategoryVo> selecttypecategory(Model model){
		
		List<VideoCategoryVo> list = new ArrayList<>();
		
		list = service.selecttypecategory();
		
		
		
		return list;
	}
	
	
	
	@RequestMapping(value="/deletecategory",method=RequestMethod.POST)
	public @ResponseBody String deleteca(Model model,@RequestParam String input){
		
		
		service.deletevideocategory(input);
		
	
		return "성공";
	}
	
	
	
	
	@RequestMapping(value="/insertcategory",method=RequestMethod.POST)
	public @ResponseBody String insertca(Model model,@RequestParam String input){
		
		VideoCategoryVo vo = new VideoCategoryVo();
		
		vo.setTypecategory(input);
		
		
		service.insertcategory(vo);
		
		
		
//		service3.deletevideocomplete(bnum);
//		service2.updateinfo(bnum);
//		service.deletevideo(bnum);
		
		
		return "성공";
	}
	
		
	
	
	@RequestMapping(value="/typedistinct",method=RequestMethod.POST)
	public @ResponseBody String typedistinct(Model model,@RequestParam String input){
		
	
		String tp = service.typedistinct(input);
		
		if(tp != null){
			return "존재";
		}else{
			return "무존재";
		}

		
				
	}
	
	
	
	
	
}
