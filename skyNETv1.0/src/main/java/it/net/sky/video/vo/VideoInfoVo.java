package it.net.sky.video.vo;

public class VideoInfoVo {
	private int vnum;
	private String oriname;
	private String storedname;
	private long vsize;
	private int bnum;
	public int getVnum() {
		return vnum;
	}
	public void setVnum(int vnum) {
		this.vnum = vnum;
	}
	public String getOriname() {
		return oriname;
	}
	public void setOriname(String oriname) {
		this.oriname = oriname;
	}
	public String getStoredname() {
		return storedname;
	}
	public void setStoredname(String storedname) {
		this.storedname = storedname;
	}
	public long getVsize() {
		return vsize;
	}
	public void setVsize(long vsize) {
		this.vsize = vsize;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	@Override
	public String toString() {
		return "VideoInfoVo [vnum=" + vnum + ", oriname=" + oriname + ", storedname=" + storedname + ", vsize=" + vsize
				+ ", bnum=" + bnum + "]";
	}
	
	
}
