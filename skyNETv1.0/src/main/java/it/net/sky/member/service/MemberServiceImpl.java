package it.net.sky.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import it.net.sky.member.dao.MemberDao;
import it.net.sky.member.vo.MemberVo;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource(name="memberDao")
	MemberDao dao;
	
	@Override
	public List<MemberVo> listAll() {
		
		List<MemberVo> list = null;
		try {
			list = dao.listAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return list;
	}

	@Override
	public MemberVo detailMember(String member_enum) {
		
		MemberVo vo = null;
		
		try {
			vo = dao.detailMember(member_enum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return vo;
	}

	@Override
	public String getEmail(String member_enum) {
		
		String email = "";
	
		try {
			email = dao.getEmail(member_enum);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return email;
	}

	@Override
	public List<String> getEmails(Map<String, Object> array) {
		
		List<String> emailList = null;
		
		try {
			emailList  =  dao.getEmails(array);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return emailList;
	}

	@Override
	public int updateMember(MemberVo vo) {
		int a = 0;
		
		try {
			a = dao.updateMember(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return a;
	}

	@Override
	public List<MemberVo> listDepart(String member_department) {
		
		List<MemberVo> list = null;
		try {
			list = dao.listDepart(member_department);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}



}
