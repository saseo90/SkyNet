package it.net.sky.inout.vo;

public class InoutVo {

	private int inout_seq ;
	private String inout_date;
	private String inout_member;
	private String inout_intime;
	private String inout_outtime;
	private String inout_state;
	private int inout_overtime;
	
	public int getInout_seq() {
		return inout_seq;
	}
	public void setInout_seq(int inout_seq) {
		this.inout_seq = inout_seq;
	}
	public String getInout_date() {
		return inout_date;
	}
	public void setInout_date(String inout_date) {
		this.inout_date = inout_date;
	}
	public String getInout_member() {
		return inout_member;
	}
	public void setInout_member(String inout_member) {
		this.inout_member = inout_member;
	}
	public String getInout_intime() {
		return inout_intime;
	}
	public void setInout_intime(String inout_intime) {
		this.inout_intime = inout_intime;
	}
	public String getInout_outtime() {
		return inout_outtime;
	}
	public void setInout_outtime(String inout_outtime) {
		this.inout_outtime = inout_outtime;
	}
	public String getInout_state() {
		return inout_state;
	}
	public void setInout_state(String inout_state) {
		this.inout_state = inout_state;
	}
	public int getInout_overtime() {
		return inout_overtime;
	}
	public void setInout_overtime(int inout_overtime) {
		this.inout_overtime = inout_overtime;
	}
	@Override
	public String toString() {
		return "InoutVo [inout_seq=" + inout_seq + ", inout_date=" + inout_date + ", inout_member=" + inout_member
				+ ", inout_intime=" + inout_intime + ", inout_outtime=" + inout_outtime + ", inout_state=" + inout_state
				+ ", inout_overtime=" + inout_overtime + ", getInout_seq()=" + getInout_seq() + ", getInout_date()="
				+ getInout_date() + ", getInout_member()=" + getInout_member() + ", getInout_intime()="
				+ getInout_intime() + ", getInout_outtime()=" + getInout_outtime() + ", getInout_state()="
				+ getInout_state() + ", getInout_overtime()=" + getInout_overtime() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
