package it.net.sky.join.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.join.dao.JoinDao;
import it.net.sky.join.vo.JoinVo;

@Service(value="joinService")
public class JoinServiceImpl implements JoinService{

	@Resource(name="joinDao")
	JoinDao dao;
	
	@Override
	public void insertMember(JoinVo vo) {
		try {
			dao.insertMember(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<JoinVo> allMember() {

		return null;
	}

}
