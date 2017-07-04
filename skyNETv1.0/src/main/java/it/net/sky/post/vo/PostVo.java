package it.net.sky.post.vo;

import java.util.Date;

public class PostVo {
	int postNo;
	String PostId;
	String postCont;
	Date post_date;
	Date post_delteDate;
	
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getPostId() {
		return PostId;
	}
	public void setPostId(String postId) {
		PostId = postId;
	}
	public String getPostCont() {
		return postCont;
	}
	public void setPostCont(String postCont) {
		this.postCont = postCont;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	public Date getPost_delteDate() {
		return post_delteDate;
	}
	public void setPost_delteDate(Date post_delteDate) {
		this.post_delteDate = post_delteDate;
	}
	
	
}
