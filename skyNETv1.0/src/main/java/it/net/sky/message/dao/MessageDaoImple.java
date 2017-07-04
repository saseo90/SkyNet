package it.net.sky.message.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import it.net.sky.message.vo.MessageVo;
import it.net.sky.message.vo.MyMsgCount;

@Repository(value="messageDao")
public class MessageDaoImple implements MessageDao{
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public int sendMessage(MessageVo messageVo) throws SQLException {
		return session.insert("sendMessage", messageVo);
	}

	@Override
	public int leadMessage(MessageVo messageVo) throws SQLException {
		return session.update("leadMessage", messageVo);
	}

	@Override
	public int modSaveMessage(MessageVo messageVo) throws SQLException {
		return session.update("modSaveMessage", messageVo);
	}

	@Override
	public int modClearMesage(MessageVo messageVo) throws SQLException {
		return session.update("modClearMesage", messageVo);
	}

	@Override
	public List<MessageVo> allMyMessage(String myNum) throws SQLException {
		return session.selectList("allMyMessage", myNum);
	}

	@Override
	public List<MessageVo> alarmMessage(String myNum) throws SQLException {
		System.out.println("ss"+myNum);
		return session.selectList("alarmMessage", myNum);
	}

	@Override
	public int deleteTimeMessage() throws SQLException {
		return session.delete("deleteTimeMessage");
	}

	@Override
	public int deleteMyMessage(MessageVo messageVo) throws SQLException {
		return session.delete("deleteMyMessage",messageVo);
	}

	@Override
	public String selectMemName(Map<String,String> memberNo) throws SQLException {
		return (String)session.selectOne("alarmmemName", memberNo);
	}

	@Override
	public MyMsgCount selectMyMsgCount(Map<String, String> memberNo) throws SQLException {
		return session.selectOne("message.selectMyMsgCount", memberNo);
	}

}
