package it.net.sky.login.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.net.sky.login.dao.LoginDao;
import it.net.sky.login.vo.LoginVo;
@Service(value="loginService")
public class LoginserviceImpl implements LoginService {
	@Resource(name="loginDao")
	LoginDao dao;
	@Override
	public LoginVo loginCheckID(LoginVo vo) {
		// TODO Auto-generated method stub
		LoginVo selectvo=null;
		try {
			selectvo = dao.loginCheckID(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selectvo;
	}
	@Override
	public LoginVo checkPW(LoginVo vo) {
		
		LoginVo vo1 = null;
		
		try {
			vo1 = dao.checkPW(vo1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo1;
	}
	
	@Override
	public String profileImg(String id) {
		String profileImg = null;
		
		try {
			profileImg = dao.profileImg(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return profileImg;
	}

}
