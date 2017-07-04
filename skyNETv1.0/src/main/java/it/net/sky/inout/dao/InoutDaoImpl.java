package it.net.sky.inout.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.inout.vo.InoutVo;

@Repository("inoutDao")
public class InoutDaoImpl implements InoutDao {

	
	@Autowired
	SqlSessionTemplate client;
	
	@Override
	public int insertIntime(String inout_member) throws SQLException {
		
		return client.insert("inout.insertIntime", inout_member);
	}

	@Override
	public int insertOuttime(String inout_member) throws SQLException {
		// TODO Auto-generated method stub
		return client.insert("inout.insertOuttime", inout_member);
	}

	@Override
	public List<InoutVo> listMember(String inout_member) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("inout.listMember", inout_member);
	}

	@Override
	public List<InoutVo> listMonth(String inout_member) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("inout.listMonth", inout_member);
	}

	@Override
	public InoutVo searchToday(Map<String, Object> map) throws SQLException {
		return client.selectOne("inout.searchToday", map);
	}

	@Override
	public int updateState(InoutVo vo) throws SQLException {
		return client.update("inout.updateState", vo);
	}

	@Override
	public int updateOver(InoutVo vo) throws SQLException {
		return client.update("inout.updateOver", vo);
	}

	@Override
	public int updateEarly(InoutVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return client.update("inout.updateEarly", vo);
	}

	@Override
	public int noInCheck(String inout_member) throws SQLException {
		// TODO Auto-generated method stub
		return client.update("inout.noInCheck", inout_member);
	}

}
