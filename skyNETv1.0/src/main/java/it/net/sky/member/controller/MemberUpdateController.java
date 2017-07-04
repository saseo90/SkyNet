package it.net.sky.member.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.net.sky.login.service.LoginService;
import it.net.sky.login.vo.LoginVo;
import it.net.sky.member.service.MemberService;
import it.net.sky.member.vo.MemberVo;
import it.net.sky.util.commons.codec.CodecUtil;

@Controller
public class MemberUpdateController {
	
	@Resource(name="memberService")
	MemberService service;
	
	@Resource(name="loginService")
	LoginService lService;
	
	@ModelAttribute("myProfile")
	public MemberVo formValue(){
		return new MemberVo();
	}
	
	@ModelAttribute("checkcheck")
	public LoginVo formValue1(){
		return new LoginVo();
	}
	
	@RequestMapping(value="checkPassword")
	public String checkPassword(){
		return "checkPW";
	}
	
	@RequestMapping(value="checkPassword",method=RequestMethod.POST)
	public String checkPassword(LoginVo vo ,Model model){
		try {
			CodecUtil cu= new CodecUtil();
			String encode = cu.aesEncode(vo.getMember_pass()); // 인코딩
			vo.setMember_pass(encode);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		LoginVo vo1 = null;
		vo1 =lService.loginCheckID(vo);
		String mem_enum = vo.getMember_enum();
		
		if (vo1==null) {
			
			return "redirect:checkPassword";
		}
		return "redirect:/my/"+mem_enum;
	}

	@RequestMapping(value="/my/{member_enum}")
	public String memberMy(@PathVariable String member_enum, Model model){
		
		MemberVo vo = service.detailMember(member_enum);
		
		model.addAttribute("member", vo);
		
		return "profile";
	}
	
	
	
	@RequestMapping(value="/my/{member_enum}", method=RequestMethod.POST)
	public String updateMember(@ModelAttribute("myProfile") MemberVo vo){
		try {
			CodecUtil cu= new CodecUtil();
			String encode = cu.aesEncode(vo.getMember_pass()); // 인코딩
			vo.setMember_pass(encode);
		} catch (Exception e) {
			e.printStackTrace();
		} 		
		
		int a = service.updateMember(vo);
		
		return "redirect:/my/{member_enum}";
	}
}
