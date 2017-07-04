package it.net.sky.join.dao;

import java.sql.SQLException;
import java.util.List;

import it.net.sky.join.vo.JoinVo;

public interface JoinDao {

	// 회원 가입
	public void insertMember(JoinVo vo) throws SQLException;
	
	// 회원 조회
	public List<JoinVo> allMember() throws SQLException;
}
