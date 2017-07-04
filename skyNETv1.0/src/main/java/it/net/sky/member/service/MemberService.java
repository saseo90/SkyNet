package it.net.sky.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import it.net.sky.member.vo.MemberVo;

public interface MemberService{

	//멤버 전체목록보기
	public List<MemberVo> listAll()  ;
	
	//부서별 멤버조회
	public List<MemberVo> listDepart(String member_department);
	
	//멤버 상세보기
	public MemberVo detailMember(String member_enum)  ;
	
	//프로필 수정하기 (본인)
	public int updateMember(MemberVo vo);
	
	//e-mail
	public String getEmail(String member_enum);
	
	public List<String> getEmails(Map<String, Object> array);
}
