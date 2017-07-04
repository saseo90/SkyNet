package it.net.sky.util.mail;

public class MailVo {
	
	private String mailID;
	private String mailPW;
	
	
	public String getMailID() {
		return mailID;
	}
	public void setMailID(String mailID) {
		this.mailID = mailID;
	}
	public String getMailPW() {
		return mailPW;
	}
	public void setMailPW(String mailPW) {
		this.mailPW = mailPW;
	}
	
	
	@Override
	public String toString() {
		return "MailVo [mailID=" + mailID + ", mailPW=" + mailPW + "]";
	}
	
}
