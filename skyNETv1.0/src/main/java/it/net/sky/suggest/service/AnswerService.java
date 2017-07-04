package it.net.sky.suggest.service;

import java.util.List;

import it.net.sky.suggest.vo.AnswerVo;

public interface AnswerService {

	public int insertAnswer(AnswerVo vo )  ;
	
	public int updateAnswer(AnswerVo vo )  ;
	
	public int deleteAnswer(int ans_no) ;
	
	public List<AnswerVo> selectAnswer(int ans_sugnum)  ;
	
	public int deleteNum(int ans_sugnum) ;
	
	
}
