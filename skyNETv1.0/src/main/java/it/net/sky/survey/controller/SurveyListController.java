package it.net.sky.survey.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import it.net.sky.survey.service.SurveyService;
import it.net.sky.survey.vo.SurveyVo;
import it.net.sky.util.session.SessionUtil;

@Controller
public class SurveyListController {

	@Resource(name="surveyService")
	private SurveyService service;
	
	/**
	 * 설문조사 전체 목록 
	 * @param model
	 * @return
	 */
	@RequestMapping("survey/surveyList")
	public String surveyList(Model model){
		
		service.updateState();	//설문 상태 업데이트 !! 마감일 지났을경우 '완료'로 바꾸자!
		List<SurveyVo> list = service.getSurveyList();
		
		model.addAttribute("surveyList", list);
		
		try {
			if(SessionUtil.getAttribute("id").equals("admin"))
				model.addAttribute("admin", SessionUtil.getAttribute("id"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "survey/surveyList";
	}
}
