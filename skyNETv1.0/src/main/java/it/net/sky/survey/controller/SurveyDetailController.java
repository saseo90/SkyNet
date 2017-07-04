package it.net.sky.survey.controller;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import it.net.sky.survey.service.SurveyService;
import it.net.sky.survey.vo.SurveyChkVo;
import it.net.sky.survey.vo.SurveyInfoVo;
import it.net.sky.survey.vo.SurveyVo;
import it.net.sky.util.session.SessionUtil;

@Controller
public class SurveyDetailController {

	@Resource(name = "surveyService")
	private SurveyService service;

	/**
	 * 상세보기로 이동 !
	 * @param survey_num	설문게시글 번호
	 * @param model			
	 * @return
	 */
	@RequestMapping(value = "survey/detail/{survey_num}")
	public String detailForm(@PathVariable int survey_num, Model model) {
		
		SurveyVo vo = service.getSurvey(survey_num);	// 해당 설문지 가져오기 
		List<SurveyInfoVo> voteMember = service.getVoteMember(survey_num);	// 설문응답정보 가져오기
		try {
			if(SessionUtil.getAttribute("id").equals("admin")){	// 관리자가 로그인 한 경우
				model.addAttribute("admin", "admin");
			} else if (!voteMember.isEmpty()) {	// 투표한 사람이 있다면
				for (SurveyInfoVo info : voteMember) {	
					String member = info.getSurveyinfo_member();	
					if (member.equals(SessionUtil.getAttribute("id"))) {	// 현재 로그인된 아이디와 비교
						model.addAttribute("voteMember", "vote");
					} 
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<SurveyChkVo> chkList = service.getChkList(survey_num);		// 해당 설문지의 질문지 가져오기
		List<SurveyInfoVo> infoList = service.getInfoList(survey_num);	// 해당 설문지의 응답정보 가져오기
			
		model.addAttribute("survey", vo);
		model.addAttribute("chkList", chkList);
		model.addAttribute("infoList", infoList);
		
		if (vo.getSurvey_state().equals("완료")) {	// 해당 설문지가 '완료'상태일 경우
			return "survey/surveyResult";	// 결과 페이지로 이동
		}

		return "survey/surveyDetail";
	}
}
