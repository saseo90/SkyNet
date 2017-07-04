package it.net.sky.suggest.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.net.sky.login.vo.LoginVo;
import it.net.sky.member.service.MemberService;
import it.net.sky.suggest.service.AnswerService;
import it.net.sky.suggest.service.SuggestService;
import it.net.sky.suggest.vo.AnswerVo;
import it.net.sky.suggest.vo.SuggestVo;
import it.net.sky.util.session.SessionUtil;

@Controller
@RequestMapping(value="suggest")
public class SuggestController {

	
	@Resource(name="suggestService")
	SuggestService service;
	
	@Resource(name="answerService")
	AnswerService anservice;
	
	@Resource(name="memberService")
	MemberService mservice;
	
	
	@ModelAttribute("answerf")
	public AnswerVo formValue(){
		return new AnswerVo();
	}
	
	
	@ModelAttribute("suggestboard")
	public SuggestVo formValue1(){
		return new SuggestVo();
	}
		
	/**
	 * 1. 건의사항 게시판 목록 조회
	 * */
	@RequestMapping(value="/suggestList")
	public String suggestList(Model model){
		LoginVo vo = null;
		try {
			model.addAttribute("session",SessionUtil.getAttribute("login"));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		List<SuggestVo> list = service.listAll();
		model.addAttribute("list", list);
		model.addAttribute("session", vo);
		
		return "suggestlist";
	}
	
	/**
	 * 2. 건의사항 입력 Form 띄우기
	 * */
	@RequestMapping(value="/writeSuggest")
	public String SuggestForm(Model model){
		
		return "/suggest/suggestForm";
	}
	
	/**
	 * 3. 건의사항 글 등록
	 * */
	@RequestMapping(value="/writeSuggest", method=RequestMethod.POST)
	public String writeSuggest(@ModelAttribute("suggestboard") SuggestVo vo){
		service.writeSuggest(vo);
		
		return "redirect:/suggest/suggestList";
	}
	
	
	/**
	 * 4. 건의사항 글 상세보기
	 * */
	@RequestMapping(value="/detailSuggest/{sug_num}", method=RequestMethod.GET)
	public String detailSuggest(@PathVariable int sug_num, Model model){
		try {
			model.addAttribute("session",SessionUtil.getAttribute("login"));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}		
		List<AnswerVo> answer = anservice.selectAnswer(sug_num);
		SuggestVo vo =  service.detailSuggest(sug_num);
		service.countUp(sug_num);
		model.addAttribute("vo" , vo);
		model.addAttribute("answer", answer);
		
		return "/suggest/suggestDetail";
	}
	
	/**
	 * 5. 건의사항 글 삭제
	 * */
	@RequestMapping(value="/deleteSuggest/{sug_num}", method=RequestMethod.GET)
	public String deleteSuggest(@PathVariable int sug_num, Model model){
		try {
			model.addAttribute("session",SessionUtil.getAttribute("login"));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}		
		service.deleteSuggest(sug_num);
		anservice.deleteNum(sug_num);
		
		return "redirect:/suggest/suggestList";
	}
	
	/**
	 * 6. 건의사항 글 수정 폼
	 * */
	@RequestMapping(value="/updateSuggest/{sug_num}", method=RequestMethod.GET)
	public String updateSuggest(@PathVariable int sug_num, Model model){
		try {
			model.addAttribute("session",SessionUtil.getAttribute("login"));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}		
		SuggestVo vo = service.detailSuggest(sug_num);
		model.addAttribute("vo", vo);
		
		return "/suggest/suggestForm";
	}	
	
	
	/**
	 * 7. 건의사항 글 수정 등록
	 * */
	@RequestMapping(value="/updateSuggest/{sug_num}", method=RequestMethod.POST)
	public String updateSuggest(@ModelAttribute("suggest") SuggestVo vo){
		System.out.println("오는거냐 ?");
		service.updateSuggest(vo);
		
		return "redirect:/suggest/suggestList";
	}		
	
	/**
	 * 8. 건의사항 계층 답글 폼
	 * */
	@RequestMapping(value="/suggestRewrite/{sug_num}", method=RequestMethod.GET)
	public String subwriteSuggest(@PathVariable int sug_num, Model model){
		try {
			model.addAttribute("session",SessionUtil.getAttribute("login"));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}	
		SuggestVo vo = service.detailSuggest(sug_num);
		model.addAttribute("vo", vo);
		
		return "/suggest/suggestForm";
		
	}		
	
	
	/**
	 * 9. 건의사항 계층 답글 전송 등록
	 * */
	@RequestMapping(value="/suggestRewrite/{sug_num}", method=RequestMethod.POST)
	public String subwriteSuggest(@ModelAttribute("suggest") SuggestVo vo, @PathVariable int sug_num, Model model){
		try {
			model.addAttribute("session",SessionUtil.getAttribute("login"));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}	
		SuggestVo mainVo = service.detailSuggest(sug_num);
		System.out.println(mainVo.toString());
		
		vo.setSug_nested(mainVo.getSug_nested()+1);
		vo.setSug_onum(mainVo.getSug_onum()+1);
		vo.setSug_gnum(mainVo.getSug_gnum());
		
		System.out.println(vo.toString());
		service.insertReply(vo);
		
		return "redirect:/suggest/suggestList";
	}
	
	/**
	 *  10. 건의사항 댓글 등록
	 */
	@RequestMapping(value="/detailSuggest/{ans_sugnum}", method=RequestMethod.POST)
	public String writeAnswer(AnswerVo vo, @PathVariable int ans_sugnum, Model model){
		System.out.println("들어오니");
		int a = anservice.insertAnswer(vo);
		System.out.println(a);
		return "redirect:/suggest/detailSuggest/"+ans_sugnum;
	}
	
	/**
	 *  11. 건의사항 댓글 삭제
	 */
	@RequestMapping(value="/answer/delete/{ans_sugnum}/{ans_no}", method=RequestMethod.GET)
	public String deleteAnswer(@PathVariable int ans_no, @PathVariable int ans_sugnum){
		anservice.deleteAnswer(ans_no);
		
		return "redirect:/suggest/detailSuggest/"+ans_sugnum;
	}
	
	/**
	 *  12. 건의사항 댓글 수정
	 */
	@RequestMapping(value="/answer/update/{ans_sugnum}/{ans_no}", method=RequestMethod.GET)
	public String updateAnswer(@PathVariable int ans_sugnum, int ans_no){
		
		anservice.deleteNum(ans_no);
		
		return "redirect:/detailSuggest/"+ans_sugnum;
	}	
}
