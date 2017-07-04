package it.net.sky.message.vo;

import java.util.Date;

/**
 * message View Object
 * @author pc25
 * msgNo : PK 메시지 번호
 * msgSender : 발신자
 * msgReceiver : 수신자
 * msgCont : 내용
 * msgRegDate : 발송일
 * msgLeadDate : 읽은일
 * msgDelPreDate : 삭제예정일
 * msgState : 상태(장기보관 상태 : 기본 N ,장기Y)
 */
public class MessageVo {
public MessageVo(){};
private int msgNo;//PK  메시지 번호
private String msgSender;//발신자
private String msgReceiver;//수신자
private String msgCont;//내용
private String msgRegDate;//발송일
private String time;
private String msgLeadDate;//읽은일
private Date msgDelPreDate;//삭제예정일
private String msgState;//상태
private String senderProfile;//보낸사람 사진
public int getMsgNo() {
    return msgNo;
}
public void setMsgNo(int msgNo) {
    this.msgNo = msgNo;
}
public String getMsgSender() {
    return msgSender;
}
public void setMsgSender(String msgSender) {
    this.msgSender = msgSender;
}
public String getMsgReceiver() {
    return msgReceiver;
}
public void setMsgReceiver(String msgReceiver) {
    this.msgReceiver = msgReceiver;
}
public String getMsgCont() {
    return msgCont;
}
public void setMsgCont(String msgCont) {
    this.msgCont = msgCont;
}
public String getMsgRegDate() {
    return msgRegDate;
}
public void setMsgRegDate(String msgRegDate) {
    this.msgRegDate = msgRegDate;
}
public String getTime() {
    return time;
}
public void setTime(String time) {
    this.time = time;
}
public String getMsgLeadDate() {
    return msgLeadDate;
}
public void setMsgLeadDate(String msgLeadDate) {
    this.msgLeadDate = msgLeadDate;
}
public Date getMsgDelPreDate() {
    return msgDelPreDate;
}
public void setMsgDelPreDate(Date msgDelPreDate) {
    this.msgDelPreDate = msgDelPreDate;
}
public String getMsgState() {
    return msgState;
}
public void setMsgState(String msgState) {
    this.msgState = msgState;
}

public String getSenderProfile() {
	return senderProfile;
}
public void setSenderProfile(String senderProfile) {
	this.senderProfile = senderProfile;
}
@Override
public String toString() {
	return "MessageVo [msgNo=" + msgNo + ", msgSender=" + msgSender + ", msgReceiver=" + msgReceiver + ", msgCont="
			+ msgCont + ", msgRegDate=" + msgRegDate + ", time=" + time + ", msgLeadDate=" + msgLeadDate
			+ ", msgDelPreDate=" + msgDelPreDate + ", msgState=" + msgState + ", senderProfile=" + senderProfile + "]";
}
}
