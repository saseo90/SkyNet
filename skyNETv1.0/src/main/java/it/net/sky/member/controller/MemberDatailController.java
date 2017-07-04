package it.net.sky.member.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import it.net.sky.member.service.MemberService;
import it.net.sky.member.vo.MemberVo;

@Controller
public class MemberDatailController {

	@Resource(name="memberService")
	MemberService service;
	
	@RequestMapping(value="member/detail/{member_enum}")
	public String memberDetail(@PathVariable String member_enum, Model model){
		
		MemberVo vo = service.detailMember(member_enum);
		
		model.addAttribute("member", vo);
		
		return "memberDetail";
	}
	
	


	
	
}
