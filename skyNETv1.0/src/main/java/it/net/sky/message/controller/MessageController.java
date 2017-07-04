package it.net.sky.message.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import it.net.sky.login.vo.LoginVo;
import it.net.sky.message.service.MessageService;
import it.net.sky.message.vo.MessageVo;
import it.net.sky.message.vo.MyMsgCount;
import it.net.sky.report.service.ReportService;
import it.net.sky.util.session.SessionUtil;
import it.net.sky.util.websocket.AlarmWebSocketHandler;

@Controller
@RequestMapping(value = { "/*/message", "/message" })
public class MessageController {

	@Resource(name="messageService")
	private MessageService service;
	@Resource(name="reportService")
	private ReportService repoService;
	
//	private Logger log = Logger.getLogger(this.getClass());

	/**
	 * 메시지 발송 파라미터 : 발신사원번호, 수신사원번호 ,메시지내용 ,발송일
	 * 
	 */
	@RequestMapping(value = "/sendMessage", method = RequestMethod.POST)
	public @ResponseBody MessageVo createEvent(@RequestParam String msg,
			@RequestParam(value = "user", required = true) List<String> users,HttpServletRequest rq) {
		try {
			rq.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		 AlarmWebSocketHandler handle = new AlarmWebSocketHandler();
		 MessageVo vo = new MessageVo();
		 //System.out.println("컨트롤러 메시지 : "+msg);
  	   try {
  		   String sender = (String)SessionUtil.getAttribute("id");
  		   String senderName = service.selectMemName(sender);
  		   for (String user : users) {
  			vo = new MessageVo();
  			vo.setMsgCont(msg);
  			vo.setMsgSender(sender);
  			vo.setMsgReceiver(user);
  		    service.sendMessage(vo);
  		    handle.sendEventMessage(user,msg,senderName);
//		    log.info("[메시지발송]["+user+"]에게 ["+msg+"]발송");
       	   }//파라미터 : 보낸자 , 수신자 ,내용
  	   } catch (Exception e) {
  		   e.printStackTrace();
  	   }
		return vo;
	}
	/**
	 * 알림 : 읽지 않은 내가 받은 메시지 파라미터 : 내 사원번호
	 */
	@RequestMapping(value = "/reflashMSG")
	public @ResponseBody List<MessageVo> reflashMSG() {
		List<MessageVo> result = new ArrayList<>();
		try {
			String id = (String) SessionUtil.getAttribute("id");
//			log.info("id : " + id + "\n");
			result = service.alarmMessage(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 내가 받은 메시지 전체 파라미터 : 내 사원번호
	 * 결과 : 
	 */
	@RequestMapping(value="/allMyMessage" ,produces = "application/json")
	public @ResponseBody List<MessageVo> allMyMessage(){
		List<MessageVo> result = new ArrayList<>();
		try {
			result = service.allMyMessage((String)SessionUtil.getAttribute("id"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println("탄다"+result);
		return result;
	}
	/**
	 * 맴버리스트 갱신
	 * 
	 */
	@RequestMapping(value="/reflashMemList" ,produces = "application/json")
	public @ResponseBody List<LoginVo> allMemList(){
		List<LoginVo> result = new ArrayList<>();
		result = repoService.getUser();
		return result;
	}
	
	/**
	 * 메시지 읽음 파라미터 : 메시지번호 , 받는 사원번호
	 */
	@RequestMapping(value="/leadMessage")
	public @ResponseBody int leadMessage(@RequestParam int msgNo){
	 return service.leadMessage(msgNo);
	}
	
	
	/**
	 * 장기보관 적용 파라미터 : 메시지번호, 받은 사원번호
	 */
	@RequestMapping(value="/saveMessage")
	public @ResponseBody int modSaveMessage(@RequestParam int msgNo){
	    return service.modSaveMessage(msgNo);
	}
	 
	 /**
	  * 장기보관 해제 파라미터 : 메시지번호, 받은 사원번호
	  */
	@RequestMapping(value="/clearMessage")
	  public @ResponseBody int modClearMesage(@RequestParam int msgNo){
	      return service.modClearMesage(msgNo);
	  }

    /**
	 * 삭제 : 개인삭제 파라미터 : 개인사원번호 ,메시지번호
	 */
	@RequestMapping(value="/deleteMessage")
	  public @ResponseBody int deleteMyMessage(@RequestParam int msgNo){
	    return service.deleteMyMessage(msgNo);
	 }
	/**
	 * 통계 : 위젯  파라미터 없음 ,
	 * 결과 : 새쪽지 수 , 읽은수 , 보관 수 
     */
	@RequestMapping(value="/myMsgCount")
	  public @ResponseBody MyMsgCount selectMyMsgCount(){
	    return  service.selectMyMsgCount();
	}
}
