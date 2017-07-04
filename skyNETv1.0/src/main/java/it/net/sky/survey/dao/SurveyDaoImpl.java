package it.net.sky.survey.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.survey.vo.SurveyChkVo;
import it.net.sky.survey.vo.SurveyInfoVo;
import it.net.sky.survey.vo.SurveyVo;

@Repository("surveyDao")
public class SurveyDaoImpl implements SurveyDao {

	@Autowired
	SqlSessionTemplate client;

	@Override
	public List<SurveyVo> getSurveyList() throws SQLException {
		return client.selectList("survey.getSurveyList");
	}

	@Override
	public List<SurveyChkVo> getChkList(int survey_num) throws SQLException {
		return client.selectList("survey.getChkList", survey_num);
	}

	@Override
	public List<SurveyInfoVo> getInfoList(int survey_num) throws SQLException {
		return client.selectList("survey.getInfoList", survey_num);
	}
	
	@Override
	public List<SurveyVo> getMainList(String surveyinfo_member) throws SQLException {
		return client.selectList("survey.getMainList", surveyinfo_member);
	}

	@Override
	public int insertSurvey(SurveyVo survey) throws SQLException {
		return client.insert("survey.insertSurvey", survey);
	}

	@Override
	public int insertChk(Map<String, Object> map) throws SQLException {
		return client.insert("survey.insertChk", map);
	}

	@Override
	public int insertInfo(SurveyInfoVo surveyInfo) throws SQLException {
		return client.insert("survey.insertInfo", surveyInfo);
	}

	@Override
	public SurveyVo getSurvey(int survey_num) throws SQLException {
		return client.selectOne("survey.getSurvey", survey_num);
	}

	@Override
	public int updateCount(int survey_num) throws SQLException {
		return client.update("survey.updateCount", survey_num);
	}

	@Override
	public int updateChk(Map<String, Object> map) throws SQLException {
		return client.update("survey.updateChk", map);
	}

	@Override
	public List<SurveyInfoVo> getVoteMember(int survey_num) throws SQLException {
		return client.selectList("survey.getVoteMember", survey_num);
	}

	@Override
	public List<String> getEndDate() throws SQLException {
		return client.selectList("survey.getEndDate");
	}

	@Override
	public int updateState() throws SQLException {
		return client.update("survey.updateState");
	}

	@Override
	public int deleteSurvey(int survey_num) throws SQLException {
		return client.update("survey.deleteSurvey", survey_num);
	}

	@Override
	public int updateState2(int survey_num) throws SQLException {
		return client.update("survey.updateState2", survey_num);
	}


}