package it.net.sky.survey.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import it.net.sky.survey.vo.SurveyChkVo;
import it.net.sky.survey.vo.SurveyInfoVo;
import it.net.sky.survey.vo.SurveyVo;

public interface SurveyDao {

   /**설문 목록 */
   public List<SurveyVo> getSurveyList() throws SQLException; 
   /**선택지 목록 */
   public List<SurveyChkVo> getChkList(int survey_num) throws SQLException; 
   /**info 목록 */
   public List<SurveyInfoVo> getInfoList(int survey_num) throws SQLException; 
   /**main List 목록 */
   public List<SurveyVo> getMainList(String surveyinfo_member) throws SQLException;
   
   /**설문 등록*/
   public int insertSurvey(SurveyVo survey) throws SQLException; 
   /**선택지 등록*/
   public int insertChk(Map<String, Object> map) throws SQLException; 
   /**info 등록*/
   public int insertInfo(SurveyInfoVo surveyInfo) throws SQLException; 
   
   /**상세보기*/
   public SurveyVo getSurvey(int survey_num) throws SQLException;
   /**투표결과 업데이트*/
   public int updateCount(int survey_num) throws SQLException;
   /**투표결과 업데이트*/
   public int updateChk(Map<String, Object> map) throws SQLException;
   
   /**투표한 사원 확인*/
   public List<SurveyInfoVo> getVoteMember(int survey_num) throws SQLException;
   /**설문조사 상태 목록*/
   public List<String> getEndDate() throws SQLException; 
   /**설문 상태 업데이트 : 마감일이 지나 완료*/
   public int updateState() throws SQLException;
   /**설문 상태 업데이트 : 관리자가 완료시킴*/
   public int updateState2(int survey_num) throws SQLException;
   
   /**설문지 삭제*/
   public int deleteSurvey(int survey_num) throws SQLException;
}