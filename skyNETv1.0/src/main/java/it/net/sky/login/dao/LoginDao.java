package it.net.sky.login.dao;

import java.sql.SQLException;

import it.net.sky.login.vo.LoginVo;

public interface LoginDao {
	public LoginVo loginCheckID(LoginVo vo) throws SQLException;
	
	public LoginVo checkPW(LoginVo vo) throws SQLException;
	
	// 로그인한 회원 사진 파일 이름 가져오는 코드
	public String profileImg(String id) throws SQLException;
	
}
