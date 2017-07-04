package it.net.sky.suggest.dao;

import java.sql.SQLException;
import java.util.List;

import it.net.sky.suggest.vo.AnswerVo;

public interface AnswerDao {

	public int insertAnswer(AnswerVo vo ) throws SQLException;
	
	public int updateAnswer(AnswerVo vo ) throws SQLException;
	
	public int deleteAnswer(int ans_no) throws SQLException;
	
	public List<AnswerVo> selectAnswer(int ans_sugnum) throws SQLException;
	
	public int deleteNum(int ans_sugnum) throws SQLException;
	
	
}
