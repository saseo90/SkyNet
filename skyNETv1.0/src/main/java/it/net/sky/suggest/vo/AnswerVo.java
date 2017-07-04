package it.net.sky.suggest.vo;

public class AnswerVo {

	private int ans_no;
	private int ans_sugnum;
	private String ans_id;
	private String ans_name;
	private String ans_cont;
	private String ans_regdate;
	private int ans_del;
	public int getAns_no() {
		return ans_no;
	}
	public void setAns_no(int ans_no) {
		this.ans_no = ans_no;
	}
	public int getAns_sugnum() {
		return ans_sugnum;
	}
	public void setAns_sugnum(int ans_sugnum) {
		this.ans_sugnum = ans_sugnum;
	}

	public String getAns_id() {
		return ans_id;
	}
	public void setAns_id(String ans_id) {
		this.ans_id = ans_id;
	}
	public String getAns_name() {
		return ans_name;
	}
	public void setAns_name(String ans_name) {
		this.ans_name = ans_name;
	}
	public String getAns_cont() {
		return ans_cont;
	}
	public void setAns_cont(String ans_cont) {
		this.ans_cont = ans_cont;
	}
	public String getAns_regdate() {
		return ans_regdate;
	}
	public void setAns_regdate(String ans_regdate) {
		this.ans_regdate = ans_regdate;
	}
	public int getAns_del() {
		return ans_del;
	}
	public void setAns_del(int ans_del) {
		this.ans_del = ans_del;
	}
	@Override
	public String toString() {
		return "SugAnsVo [ans_no=" + ans_no + ", ans_sugnum=" + ans_sugnum + ", ans_id=" + ans_id + ", ans_name="
				+ ans_name + ", ans_cont=" + ans_cont + ", ans_regdate=" + ans_regdate + ", ans_del=" + ans_del + "]";
	}

	
	
	
	
	
}
