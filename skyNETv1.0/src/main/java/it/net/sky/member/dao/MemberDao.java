package it.net.sky.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import it.net.sky.member.vo.MemberVo;

/**
 * 
 * @author pc07
 *
 */
public interface MemberDao {

	//멤버 전체목록보기
	public List<MemberVo> listAll() throws SQLException;
	public List<MemberVo> listAll(Map<String, Object> params) throws SQLException; 
	
	
	//부서별 멤버조회
	public List<MemberVo> listDepart(String member_department) throws SQLException;
	
	//멤버 전체수 세기
	public int listCount(Map<String,Object> map) throws SQLException;
	
	//멤버 상세보기
	public MemberVo detailMember(String member_enum) throws SQLException;
	
	//이메일 보내기 
	public String getEmail(String member_enum) throws SQLException;
	public List<String> getEmails(Map<String, Object> array) throws SQLException;
	
	//본인 프로필 수정
	public int updateMember(MemberVo vo) throws SQLException;
	
}
