package it.net.sky.video.vo;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class VideoBoardVo {
	private int bnum;
	@NotEmpty(message="공백불가입니다.") @Size(min=2, max=23, message="최소 두 자에서 23자까지 입력할 수 있습니다.")
	private String title;
	@Size(max=80, message="최대 80자까지 입력할 수 있습니다.")
	private String content;
	private String reg_date;
	private String category;
	private String start_date;
	private String end_date;
	//private String complete;
	//private String secret; 
	private MultipartFile vfile;
	private VideoInfoVo vinfo;
	
	private ConnectVideoVo connectvideo;
	
	
	
	
	public ConnectVideoVo getConnectvideo() {
		return connectvideo;
	}
	public void setConnectvideo(ConnectVideoVo connectvideo) {
		this.connectvideo = connectvideo;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	
	public MultipartFile getVfile() {
		return vfile;
	}
	public void setVfile(MultipartFile vfile) {
		this.vfile = vfile;
	}
	public VideoInfoVo getVinfo() {
		return vinfo;
	}
	public void setVinfo(VideoInfoVo vinfo) {
		this.vinfo = vinfo;
	}
	
	
	
	
	
}
