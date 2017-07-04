package it.net.sky.survey.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import it.net.sky.survey.service.SurveyService;

@Controller
public class SurveyUpdateController {

	@Resource(name = "surveyService")
	private SurveyService service;

	/**
	 * 설문지 삭제 : survey_state = '삭제'
	 * @param survey_num
	 * @return
	 */
	@RequestMapping("survey/delete/{survey_gnum}")
	public String deleteSurvey(@PathVariable int survey_gnum) {
		
		service.deleteSurvey(survey_gnum);
		
		return "redirect:/survey/surveyList";
	}
	
	/**
	 * 설문 상태 업데이트 : 관리자가 완료시킴
	 * @return
	 */
	@RequestMapping("survey/update/{survey_num}")
	public String updateState2(@PathVariable int survey_num) {
		
		service.updateState2(survey_num);
		
		return "redirect:/survey/surveyList";
	}
}
