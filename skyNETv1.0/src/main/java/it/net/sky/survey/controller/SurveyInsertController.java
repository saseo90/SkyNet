package it.net.sky.survey.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import it.net.sky.survey.service.SurveyService;
import it.net.sky.survey.vo.SurveyInfoVo;
import it.net.sky.survey.vo.SurveyVo;
import it.net.sky.util.session.SessionUtil;

@Controller
public class SurveyInsertController {

   @Resource(name="surveyService")
   private SurveyService service;
   
   /***
    * 작성 폼으로 이동 
    * @param model
    * @return
    */
   @RequestMapping("survey/insert")
   public String insertForm(Model model) {
      try {
         model.addAttribute("writer",SessionUtil.getAttribute("id"));
      } catch (Exception e) {
         e.printStackTrace();
      }      
      return "survey/surveyform";
   }
   
   /**
    * 설문지 등록
    * @param survey
    * @return
    */
   @RequestMapping(value="survey/insertSurvey", method=RequestMethod.POST)
   public String insertsurvey(SurveyVo survey){
	   
	   try {
		   service.insertSurvey(survey);
	   } catch (Exception e) {
		   e.printStackTrace();
	   }
	   
	   return "redirect:/survey/surveyList";
   }
   
   /**
    * 설문 응답 등록
    * @param selectChk
    * @param survey_gnum
    * @return
    */
   @RequestMapping(value="survey/insert/{selectChk}/{survey_gnum}")
   public String insertChk(@PathVariable int selectChk
                     ,@PathVariable int survey_gnum) {
      
      SurveyInfoVo info = new SurveyInfoVo();
      try {
         info.setSurveyinfo_gnum(survey_gnum);
         info.setSurveyinfo_member((String)SessionUtil.getAttribute("id"));
         info.setSurveyinfo_chk(selectChk);
         service.insertInfo(info);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      
      return "redirect:/survey/surveyList";
   }
}