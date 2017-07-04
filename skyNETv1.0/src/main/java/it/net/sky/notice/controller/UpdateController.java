package it.net.sky.notice.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.net.sky.notice.service.NoticeService;
import it.net.sky.notice.vo.NoticeVo;

@Controller
public class UpdateController {

	@Resource(name="noticeService")
	private NoticeService service;
	
	@ModelAttribute("notice")
	public NoticeVo noticeObj(){
		return new NoticeVo();
	}
	
	/**
	 * 해당 공지사항 게시글 작성폼으로 이동
	 * @param notice_num
	 * @param model
	 * @return
	 */
	@RequestMapping("notice/update/{notice_num}")
	public String form(@PathVariable int notice_num, Model model) {
		
		NoticeVo vo = service.selectNotice(notice_num);
		model.addAttribute("notice", vo);
		return "notice/insert";
	}
	
	/**
	 * 해당 공지사항 게시글 수정
	 * @param notice_num
	 * @param vo
	 * @return
	 */
	@RequestMapping(value="notice/update/{notice_num}", method=RequestMethod.POST)
	public String update(@PathVariable int notice_num, NoticeVo vo) {
		
		service.updateNotice(vo);
		
		return "redirect:/notice/detail/"+notice_num;
	}
}
