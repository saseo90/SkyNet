package it.net.sky.notice.vo;

public class NoticeVo {

	private int notice_num;
	private String notice_title;
	private String notice_content;
	private String notice_writer;
	private String notice_date;
	private int notice_readcnt;
	private String notice_state;
	private String notice_type;
	
	@Override
	public String toString() {
		return "NoticeVo [notice_num=" + notice_num + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_writer=" + notice_writer + ", notice_date=" + notice_date
				+ ", notice_readcnt=" + notice_readcnt + ", notice_state=" + notice_state + ", notice_type="
				+ notice_type + "]";
	}

	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_writer() {
		return notice_writer;
	}

	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

	public int getNotice_readcnt() {
		return notice_readcnt;
	}

	public void setNotice_readcnt(int notice_readcnt) {
		this.notice_readcnt = notice_readcnt;
	}

	public String getNotice_state() {
		return notice_state;
	}

	public void setNotice_state(String notice_state) {
		this.notice_state = notice_state;
	}

	public String getNotice_type() {
		return notice_type;
	}

	public void setNotice_type(String notice_type) {
		this.notice_type = notice_type;
	}
	
	
	
}
