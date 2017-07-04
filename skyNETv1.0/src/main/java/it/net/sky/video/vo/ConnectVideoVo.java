package it.net.sky.video.vo;

public class ConnectVideoVo {
	private String member_enum;
	private int bnum;
	private String complete;
	private int watchinfo;
	
		
	
	public String getComplete() {
		return complete;
	}
	public void setComplete(String complete) {
		this.complete = complete;
	}
	public int getWatchinfo() {
		return watchinfo;
	}
	public void setWatchinfo(int watchinfo) {
		this.watchinfo = watchinfo;
	}
	public String getMember_enum() {
		return member_enum;
	}
	public void setMember_enum(String member_enum) {
		this.member_enum = member_enum;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	@Override
	public String toString() {
		return "ConnectVideoVo [member_enum=" + member_enum + ", bnum=" + bnum + ", complete=" + complete
				+ ", watchinfo=" + watchinfo + "]";
	}
	
	
	/*
	public String getComplete() {
		return complete;
	}
	public void setComplete(String complete) {
		this.complete = complete;
	}*/
	
	
}
