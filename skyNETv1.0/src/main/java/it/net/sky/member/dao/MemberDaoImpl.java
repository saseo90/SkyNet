package it.net.sky.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.member.vo.MemberVo;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	SqlSessionTemplate client;

	@Override
	public List<MemberVo> listAll() throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("member.listAll");
	}

	@Override
	public List<MemberVo> listAll(Map<String, Object> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listCount(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVo detailMember(String member_enum) throws SQLException {
		return (MemberVo) client.selectOne("member.detailMember", member_enum);
	}
	
	@Override
	public String getEmail(String member_enum) throws SQLException {
		return client.selectOne("member.getEmail", member_enum);
	}

	@Override
	public List<String> getEmails(Map<String, Object> array) throws SQLException {
		return client.selectList("member.getEmails", array);
	}

	@Override
	public int updateMember(MemberVo vo) throws SQLException {
		return client.update("member.updateMember", vo);
	}

	@Override
	public List<MemberVo> listDepart(String member_department) throws SQLException {
		// TODO Auto-generated method stub
		return client.selectList("member.listDepart", member_department);
	}



}
