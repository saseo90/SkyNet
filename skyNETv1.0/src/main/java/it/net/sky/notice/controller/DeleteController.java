package it.net.sky.notice.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import it.net.sky.notice.service.NoticeService;
import it.net.sky.notice.vo.NoticeVo;

@Controller
public class DeleteController {

	@Resource(name="noticeService")
	private NoticeService service;
	/**
	 * 해당 공지사항 글 삭제
	 * @param notice_num
	 * @return
	 */
	@RequestMapping("notice/delete/{notice_num}")
	public String delete(@PathVariable int notice_num) {
		
		NoticeVo vo = service.selectNotice(notice_num);
		vo.setNotice_state("Y");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notice_num", vo.getNotice_num());
		map.put("notice_type", vo.getNotice_state());
		
		service.deleteNotice(map);
		
		return "redirect:/notice/list";
	}
}
