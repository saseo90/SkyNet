package it.net.sky.notice.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import it.net.sky.notice.service.NoticeService;
import it.net.sky.notice.vo.NoticeVo;
import it.net.sky.util.session.SessionUtil;

@Controller
public class ListController {

	@Resource(name="noticeService")
	private NoticeService service;
	/**
	 * 공지사항 글 목록
	 * @param model
	 * @return
	 */
	@RequestMapping("notice/list")
	public String listForm(Model model){
		
		List<NoticeVo> list = service.getNoticeList();
		model.addAttribute("list", list);
		
		try {	// 관리자일 경우 true, model에 담아서 넘기자!
			if (SessionUtil.getAttribute("id").equals("admin"))
				model.addAttribute("admin", SessionUtil.getAttribute("id"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "notice/list";
	}
}
