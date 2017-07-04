package it.net.sky.stats.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import it.net.sky.stats.service.StatsService;
import it.net.sky.stats.vo.StatsVo;

@Controller
public class StatsContorller {
	
	@Resource(name="statsService")
	StatsService service;
	
	@RequestMapping(value="/stats")
	public String stats(Model model)
	{
		List<StatsVo> listA = service.listACount();
		List<StatsVo> listB = service.listBCount();
		
		model.addAttribute("listA",listA);
		model.addAttribute("listB",listB);
		
		return "stats";
	}
}
