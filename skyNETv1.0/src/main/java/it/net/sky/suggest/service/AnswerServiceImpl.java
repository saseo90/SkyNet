package it.net.sky.suggest.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.suggest.dao.AnswerDao;
import it.net.sky.suggest.vo.AnswerVo;

@Service("answerService")
public class AnswerServiceImpl implements AnswerService{

	@Resource(name="answerDao")
	AnswerDao dao;
	
	@Override
	public int insertAnswer(AnswerVo vo) {
		int a = 0;
		try {
			a= dao.insertAnswer(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public int updateAnswer(AnswerVo vo) {
		int a = 0;
		try {
			a = dao.updateAnswer(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return a;
	}

	@Override
	public int deleteAnswer(int ans_no) {
		int a = 0;
		try {
			a = dao.deleteAnswer(ans_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public List<AnswerVo> selectAnswer(int ans_sugnum) {
		List<AnswerVo> list = null;
		try {
			list = dao.selectAnswer(ans_sugnum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int deleteNum(int ans_sugnum) {
		int a = 0;
		try {
			a = dao.deleteNum(ans_sugnum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

}
