package it.net.sky.survey.service;

import java.util.List;

import it.net.sky.survey.vo.SurveyChkVo;
import it.net.sky.survey.vo.SurveyInfoVo;
import it.net.sky.survey.vo.SurveyVo;

public interface SurveyService {

   /**설문 목록*/
   public List<SurveyVo> getSurveyList(); 
   /**선택지 목록*/
   public List<SurveyChkVo> getChkList(int survey_num); 
   /**info 목록*/
   public List<SurveyInfoVo> getInfoList(int num); 
   /**main List 목록 */
   public List<SurveyVo> getMainList(String surveyinfo_member);
   
   /**설문 등록*/
   public int insertSurvey(SurveyVo survey) throws Exception; 
   /**info 등록*/
   public int insertInfo(SurveyInfoVo surveyInfo);
   
   /**상세보기*/
   public SurveyVo getSurvey(int survey_num);
   
   /**투표한 사원 확인*/
   public List<SurveyInfoVo> getVoteMember(int survey_num);
   /**설문상태 목록*/
   public List<String> getEndDate();
   /**설문상태 업데이트 : 마감일이 지나 완료*/
   public int updateState();
   /**설문 상태 업데이트 : 관리자가 완료시킴*/
   public int updateState2(int survey_num);
   
   /**설문지 삭제*/
   public int deleteSurvey(int survey_num); 
}