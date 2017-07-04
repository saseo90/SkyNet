package it.net.sky.suggest.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.suggest.vo.AnswerVo;

@Repository("answerDao")
public class AnswerDaoImpl implements AnswerDao{

	@Autowired
	SqlSessionTemplate client;
	
	@Override
	public int insertAnswer(AnswerVo vo) throws SQLException {
		return client.insert("answer.writeAnswer", vo);
	}

	@Override
	public int updateAnswer(AnswerVo vo) throws SQLException {
		return client.insert("answer.updateAnswer", vo);
	}

	@Override
	public int deleteAnswer(int ans_no) throws SQLException {
		return client.delete("answer.deleteAnswer", ans_no);
	}

	@Override
	public List<AnswerVo> selectAnswer(int ans_sugnum) throws SQLException {
		return client.selectList("answer.selectAnswer", ans_sugnum);
	}

	@Override
	public int deleteNum(int ans_sugnum) throws SQLException {
		return client.delete("answer.deleteNum", ans_sugnum);
	}
	
	
}
