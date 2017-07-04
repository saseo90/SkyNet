package it.net.sky.notice.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import it.net.sky.notice.service.NoticeService;
import it.net.sky.notice.vo.NoticeVo;

@Controller
public class InsertController {

	@Resource(name="noticeService")
	private NoticeService service;
	/**
	 * form:form 의 command name 
	 * @return
	 */
	@ModelAttribute("notice")
	public NoticeVo noticeObj(){
		NoticeVo vo = new NoticeVo();
		vo.setNotice_state("N");
		return vo;
	}
	/**
	 * 공지사항 글 작성 폼으로 이동
	 * @return
	 */
	@RequestMapping(value="notice/insert")
	public String form() {
		return "notice/insert";
	}
	/**
	 * 공지사항 글 작성
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="notice/insert", method=RequestMethod.POST)
	public String insert(@ModelAttribute("notice") NoticeVo vo) {
		
		int cnt = service.insertNotice(vo);
		
		return "redirect:/notice/list";
	}
}
