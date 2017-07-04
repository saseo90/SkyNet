package it.net.sky.message.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.net.sky.message.dao.MessageDao;
import it.net.sky.message.vo.MessageVo;
import it.net.sky.message.vo.MyMsgCount;
import it.net.sky.util.session.SessionUtil;
@Transactional
@Service(value="messageService")
public class MessageServiceImple implements MessageService {

	@Resource(name="messageDao")
	MessageDao dao;

	@Override
	public int sendMessage(MessageVo messageVo) {
		int result = -1;
		try {
			result = dao.sendMessage(messageVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int leadMessage(int msgNo) {
	    int result = -1;
        MessageVo messageVo = new MessageVo();
        try {
            messageVo.setMsgNo(msgNo);
            messageVo.setMsgReceiver((String)SessionUtil.getAttribute("id"));
            result = dao.leadMessage(messageVo);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
            e.printStackTrace();
        }
		return result;
	}
	@Override
	public int modSaveMessage(int msgNo) {
	    int result = -1;
        MessageVo messageVo = new MessageVo();
        try {
            messageVo.setMsgNo(msgNo);
            messageVo.setMsgReceiver((String)SessionUtil.getAttribute("id"));
			result=dao.modSaveMessage(messageVo);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		return result;
	}

	@Override
	public int modClearMesage(int msgNo) {
	    int result = -1;
        MessageVo messageVo = new MessageVo();
        try {
            messageVo.setMsgNo(msgNo);
            messageVo.setMsgReceiver((String)SessionUtil.getAttribute("id"));
			result=dao.modClearMesage(messageVo);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		return result;
	}

	@Override
	public List<MessageVo> allMyMessage(String myNum) {
		List<MessageVo> result = null;
		try {
			result = dao.allMyMessage(myNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MessageVo> alarmMessage(String myNum) {
		List<MessageVo> result = null;
		try {
			result = dao.alarmMessage(myNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteTimeMessage() {
		int result = -1;
		try {
			result = dao.deleteTimeMessage();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteMyMessage(int msgNo) {
	    int result = -1;
	    MessageVo messageVo = new MessageVo();
        try {
            messageVo.setMsgNo(msgNo);
            messageVo.setMsgReceiver((String)SessionUtil.getAttribute("id"));
			result = dao.deleteMyMessage(messageVo);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		return result;
	}

	@Override
	public String selectMemName(String memberNo){
		String result = null;
		try {
			Map<String,String> userNO = new HashMap<>();
			userNO.put("keyword", memberNo);
			System.out.println(userNO);
			result = dao.selectMemName(userNO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public MyMsgCount selectMyMsgCount() {
		MyMsgCount result = null;
		try {
			Map<String,String> memberNo = new HashMap<>();
			memberNo.put("keyword", (String)SessionUtil.getAttribute("id"));
			result = dao.selectMyMsgCount(memberNo);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
