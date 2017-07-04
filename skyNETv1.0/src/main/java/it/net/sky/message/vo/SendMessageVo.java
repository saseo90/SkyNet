package it.net.sky.message.vo;

public class SendMessageVo {
	public SendMessageVo(){};
	private String msgSender;//발신자
	private String msgReceiver;//수신자
	private String msgCont;//내용
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
	@Override
	public String toString() {
		return "SendMessageVo [msgSender=" + msgSender + ", msgReceiver=" + msgReceiver + ", msgCont=" + msgCont + "]";
	}
	
	
}
