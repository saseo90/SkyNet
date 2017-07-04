package it.net.sky.join.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.join.vo.JoinVo;

@Repository(value="joinDao")
public class JoinDaoImpl implements JoinDao {

	@Autowired
	SqlSessionTemplate client;
	
	// 회원가입
	@Override
	public void insertMember(JoinVo vo) throws SQLException {
		client.insert("join.insertMember", vo);
	}

	@Override
	public List<JoinVo> allMember() throws SQLException {
		return client.selectList("");
	}

}
