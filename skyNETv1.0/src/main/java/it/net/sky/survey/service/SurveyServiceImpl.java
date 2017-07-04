package it.net.sky.survey.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.net.sky.survey.dao.SurveyDao;
import it.net.sky.survey.vo.SurveyChkVo;
import it.net.sky.survey.vo.SurveyInfoVo;
import it.net.sky.survey.vo.SurveyVo;

@Service("surveyService")
public class SurveyServiceImpl implements SurveyService {

	@Resource(name = "surveyDao")
	private SurveyDao dao;

	@Override
	public List<SurveyVo> getSurveyList() {
		List<SurveyVo> surveyList = null;
		try {
			surveyList = dao.getSurveyList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return surveyList;
	}

	@Override
	public List<SurveyChkVo> getChkList(int survey_num) {
		List<SurveyChkVo> chkList = null;
		try {
			chkList = dao.getChkList(survey_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chkList;
	}

	@Override
	public List<SurveyInfoVo> getInfoList(int num) {
		List<SurveyInfoVo> infoList = null;
		try {
			infoList = dao.getInfoList(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return infoList;
	}

	@Override
	public List<SurveyVo> getMainList(String surveyinfo_member) {
		List<SurveyVo> mainList = null;
		try {
			mainList = dao.getMainList(surveyinfo_member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mainList;
	}

	@Transactional
	@Override
	public int insertSurvey(SurveyVo survey) throws Exception {

		dao.insertSurvey(survey);
		String[] chkList = survey.getChkList();
		List<SurveyChkVo> list = new ArrayList<>();
		int anum = 1;
		for (String chk : chkList) {
			SurveyChkVo vo = new SurveyChkVo();
			vo.setSurveychk_gnum(survey.getSurvey_num());
			vo.setSurveychk_qnum(1);
			vo.setSurveychk_qcontent(survey.getQuestion());
			vo.setSurveychk_anum(anum);
			vo.setSurveychk_acontent(chk);
			list.add(vo);
			anum++;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		
		dao.insertChk(map);
		
		return 0;
	}

	@Transactional
	@Override
	public int insertInfo(SurveyInfoVo surveyInfo) {
		int chk = surveyInfo.getSurveyinfo_chk(); // 체크된 라디오 값
		int gnum = surveyInfo.getSurveyinfo_gnum(); // 그룹넘버
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("surveychk_gnum", gnum);
		map.put("surveychk_anum", chk);

		try {
			dao.insertInfo(surveyInfo);
			dao.updateCount(gnum);
			dao.updateChk(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public SurveyVo getSurvey(int survey_num) {
		SurveyVo vo = null;
		try {
			vo = dao.getSurvey(survey_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public List<SurveyInfoVo> getVoteMember(int survey_num) {
		List<SurveyInfoVo> voteMember = null;
		
		try {
			voteMember = dao.getVoteMember(survey_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return voteMember;
	}

	@Override
	public List<String> getEndDate() {
		List<String> stateList = null;
		
		try {
			stateList = dao.getEndDate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return stateList;
	}

	@Override
	public int updateState() {
		int cnt = 0 ;
		
		try {
			cnt = dao.updateState();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return cnt;
	}

	@Override
	public int deleteSurvey(int survey_num) {
		int cnt = 0;
		try {
			cnt = dao.deleteSurvey(survey_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateState2(int survey_num) {
		int cnt = 0;
		try {
			cnt = dao.updateState2(survey_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}