package it.net.sky.login.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.login.vo.LoginVo;
@Repository(value = "loginDao")
public class LoginDaoImpl implements LoginDao {
	@Autowired
	SqlSessionTemplate service;
	
	@Override
	public LoginVo loginCheckID(LoginVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return service.selectOne("login.checkId", vo);
	}
	@Override
	public LoginVo checkPW(LoginVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return service.selectOne("login.checkPW", vo);
	}
	@Override
	public String profileImg(String id) throws SQLException {
		return service.selectOne("login.profileImg", id);
	}

}
