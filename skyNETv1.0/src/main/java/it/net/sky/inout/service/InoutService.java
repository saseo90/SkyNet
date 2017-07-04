package it.net.sky.inout.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import it.net.sky.inout.vo.InoutVo;

public interface InoutService {

		//출근시간
		public int insertIntime(String inout_member);  
		
		//퇴근시간-update
		public int insertOuttime(String inout_member); 
		
		//사원별 조회
		public List<InoutVo> listMember(String inout_member); 
		
		//사원별 월 기록조회
		public List<InoutVo> listMonth(String inout_member) ;
		
		//사원별 오늘 기록
		public InoutVo searchToday(Map<String, Object> map);
		
		//오늘 지각 상태 변경
		public int updateState(InoutVo vo);
		
		//오늘 초과근무 적용
		public int updateOver(InoutVo vo)  ;
		
		//오늘 조퇴 확인
		public int updateEarly(InoutVo vo)  ;
		
		//결석 상태등록
		public int noInCheck(String inout_member);
	
}
