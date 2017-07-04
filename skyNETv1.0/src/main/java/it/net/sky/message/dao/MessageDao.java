package it.net.sky.message.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import it.net.sky.message.vo.MessageVo;
import it.net.sky.message.vo.MyMsgCount;

public interface MessageDao {
	/**
	 * 메시지 발송
	 * 파라미터 : 발신사원번호, 수신사원번호 ,메시지내용 ,발송일
	 * 
	 */
	public int sendMessage(MessageVo messageVo) throws SQLException;
	
	/**
	 * 메시지 읽음
	 * 파라미터 : 메시지번호 , 받는 사원번호
	 */
	public int leadMessage(MessageVo messageVo) throws SQLException;
	/**
	 * 장기보관 적용
	 * 파라미터 : 메시지번호, 받은 사원번호
	 */
	public int modSaveMessage(MessageVo messageVo) throws SQLException;
	
	/**
	 * 장기보관 해제
	 * 파라미터 : 메시지번호, 받은 사원번호
	 */
	public int modClearMesage(MessageVo messageVo) throws SQLException;
	/**
	 * 내가 받은 메시지 전체
	 * 파라미터 : 내 사원번호
	 */
	public List<MessageVo> allMyMessage(String myNum) throws SQLException;
	/**
	 * 알림 : 읽지 않은 내가 받은 메시지
	 * 파라미터 : 내 사원번호
	 */
	public List<MessageVo> alarmMessage(String myNum) throws SQLException;
	/**
	 * 삭제 : 자동삭제
	 * 삭제예정일인 메시지 삭제
	 */
	public int deleteTimeMessage() throws SQLException;
	/**
	 * 삭제 : 개인삭제
	 * 파라미터 : 개인사원번호 ,메시지번호
	 */
	public int deleteMyMessage(MessageVo messageVo) throws SQLException;
	/**
	 * 맴버이름 조회
	 * 파라미터 : 사원번호
	 */
	public String selectMemName(Map<String,String> memberNo) throws SQLException;
	/**
	 * 메시지 위젯용 통계
	 * 파라미터 : 사원번호
	 */
	public MyMsgCount selectMyMsgCount(Map<String,String> memberNo) throws SQLException;

}
