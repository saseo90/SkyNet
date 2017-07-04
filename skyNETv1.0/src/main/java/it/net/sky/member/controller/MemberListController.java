package it.net.sky.member.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import it.net.sky.member.service.MemberService;
import it.net.sky.member.vo.MemberVo;

@Controller
public class MemberListController {
	@Resource(name="memberService")
	MemberService service;
	
	@RequestMapping(value="member/list")
	public String memberList(Model model){
		
		List<MemberVo> list =  service.listAll();
		
		model.addAttribute("list", list);
		
		
		return "memberList";
	}
	/**
	 * 사원목록 excel view 로 이동
	 * @param model
	 * @return
	 */
	@RequestMapping(value="member/excel")
	public String memberExcel (Model model) {
		List<MemberVo> list =  service.listAll();
		model.addAttribute("list", list);
		
		if(!model.asMap().containsKey("list")) {
			throw new NullPointerException();
		}
		return "memberExcel";
	}
	/**
	 * 사원목록 pdf view 로 이동
	 * @param model
	 * @return
	 */
	@RequestMapping(value="member/pdf")
	public String memberPdf(Model model) {
		List<MemberVo> list =  service.listAll();
		model.addAttribute("list", list);
		
		if(!model.asMap().containsKey("list")) {
			throw new NullPointerException();
		}
		return "memberPdf";
	}
	
}
