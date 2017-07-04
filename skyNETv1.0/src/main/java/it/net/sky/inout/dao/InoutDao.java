package it.net.sky.inout.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import it.net.sky.inout.vo.InoutVo;

public interface InoutDao {
	
	//출근시간
	public int insertIntime(String inout_member) throws SQLException; 
	
	//퇴근시간-update
	public int insertOuttime(String inout_member) throws SQLException;
	
	//사원별 조회
	public List<InoutVo> listMember(String inout_member) throws SQLException;
	
	//사원별 월 기록 조회
	public List<InoutVo> listMonth(String inout_member) throws SQLException;
	
	//오늘날짜조회
	public InoutVo searchToday(Map<String, Object> map) throws SQLException;
	
	//오늘 지각 상태
	public int updateState(InoutVo vo) throws SQLException;
	
	//오늘 초과근무 적용
	public int updateOver(InoutVo vo) throws SQLException;
	
	//오늘 조퇴 확인
	public int updateEarly(InoutVo vo) throws SQLException;
	
	//결석 등록
	public int noInCheck(String inout_member) throws SQLException;
	
}
