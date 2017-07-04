package it.net.sky.notice.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import it.net.sky.notice.service.NoticeService;
import it.net.sky.notice.vo.NoticeVo;
import it.net.sky.util.session.SessionUtil;

@Controller
public class DetailController {

	@Resource(name="noticeService")
	private NoticeService service;
	/***
	 * 공지사항 게시글 상세보기
	 * @param notice_num
	 * @param model
	 * @return
	 */
	@RequestMapping(value="notice/detail/{notice_num}")
	public String detail(@PathVariable int notice_num, Model model) {
	
		
		NoticeVo vo = service.selectNotice(notice_num);
		service.updateReadCnt(notice_num);
		
		model.addAttribute("notice", vo);
		
		try {	// 관리자일 경우 true, model에 담아서 넘기자!
			if (SessionUtil.getAttribute("id").equals("admin"))
				model.addAttribute("admin", SessionUtil.getAttribute("id"));
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		
		return "notice/detail";
	}
}
