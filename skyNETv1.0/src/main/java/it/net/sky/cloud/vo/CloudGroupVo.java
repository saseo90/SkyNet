package it.net.sky.cloud.vo;

import java.util.Date;

/** 
 * Cloud : cloudGroup Table View Object
 * groupSeq  필수 : PK 클라우드그룹 시퀀스
 * groupNo   그룹번호 : 그룹의 종류를 알기위해 필요함
 * cloupUser 클라우드번호 
 * groupName 별명 : 기본값 사원이름_사원이름
 * groupRegDate 등록일
 */
public class CloudGroupVo {
	public CloudGroupVo(){};
	private Integer groupSeq;//필수 : PK 클라우드그룹 시퀀스
	private Integer groupNo;//그룹번호 : 그룹의 종류를 알기위해 필요함.
	private String  cloupUser;//클라우드번호 
	private String  groupName;//별명 : 기본값 사원이름_사원이름
	private Date    groupRegDate;//등록일
	public Integer getGroupSeq() {
		return groupSeq;
	}
	public void setGroupSeq(Integer groupSeq) {
		this.groupSeq = groupSeq;
	}
	public Integer getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(Integer groupNo) {
		this.groupNo = groupNo;
	}
	public String getCloupUser() {
		return cloupUser;
	}
	public void setCloupUser(String cloupUser) {
		this.cloupUser = cloupUser;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public Date getGroupRegDate() {
		return groupRegDate;
	}
	public void setGroupRegDate(Date groupRegDate) {
		this.groupRegDate = groupRegDate;
	}
}
