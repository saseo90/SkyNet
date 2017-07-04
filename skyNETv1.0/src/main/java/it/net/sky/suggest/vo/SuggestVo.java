package it.net.sky.suggest.vo;

public class SuggestVo {

	private int sug_num; //글번호
	private int sug_gnum; //그룹번호
	private int sug_onum; //정렬번호
	private int sug_nested; //들여쓰기
//	private int sug_secret; //비밀글여부
	private String sug_id; //작성자ID
	private String sug_name; //작성자이름
	private String sug_title; //제목
	private String sug_cont; //내용
	private String sug_regdate; //등록일
	private String sug_rcount; //조회수
	private String sug_delete; //삭제여부
	public int getSug_num() {
		return sug_num;
	}
	public void setSug_num(int sug_num) {
		this.sug_num = sug_num;
	}
	public int getSug_gnum() {
		return sug_gnum;
	}
	public void setSug_gnum(int sug_gnum) {
		this.sug_gnum = sug_gnum;
	}
	public int getSug_onum() {
		return sug_onum;
	}
	public void setSug_onum(int sug_onum) {
		this.sug_onum = sug_onum;
	}
	public int getSug_nested() {
		return sug_nested;
	}
	public void setSug_nested(int sug_nested) {
		this.sug_nested = sug_nested;
	}
	public String getSug_id() {
		return sug_id;
	}
	public void setSug_id(String sug_id) {
		this.sug_id = sug_id;
	}
	public String getSug_name() {
		return sug_name;
	}
	public void setSug_name(String sug_name) {
		this.sug_name = sug_name;
	}
	public String getSug_title() {
		return sug_title;
	}
	public void setSug_title(String sug_title) {
		this.sug_title = sug_title;
	}
	public String getSug_cont() {
		return sug_cont;
	}
	public void setSug_cont(String sug_cont) {
		this.sug_cont = sug_cont;
	}
	public String getSug_regdate() {
		return sug_regdate;
	}
	public void setSug_regdate(String sug_regdate) {
		this.sug_regdate = sug_regdate;
	}
	public String getSug_rcount() {
		return sug_rcount;
	}
	public void setSug_rcount(String sug_rcount) {
		this.sug_rcount = sug_rcount;
	}
	public String getSug_delete() {
		return sug_delete;
	}
	public void setSug_delete(String sug_delete) {
		this.sug_delete = sug_delete;
	}
	@Override
	public String toString() {
		return "SuggestVo [sug_num=" + sug_num + ", sug_gnum=" + sug_gnum + ", sug_onum=" + sug_onum + ", sug_nested="
				+ sug_nested + ", sug_id=" + sug_id + ", sug_name=" + sug_name + ", sug_title=" + sug_title
				+ ", sug_cont=" + sug_cont + ", sug_regdate=" + sug_regdate + ", sug_rcount=" + sug_rcount
				+ ", sug_delete=" + sug_delete + "]";
	}
//	public int getSug_secret() {
//		return sug_secret;
//	}
//	public void setSug_secret(int sug_secret) {
//		this.sug_secret = sug_secret;
//	}
	

	
}
