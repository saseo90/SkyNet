package it.net.sky.cloud.vo;
/**
 * 
 * Cloud : memberGroup Table View Object
 * 
 * groupNo     : PK 그룹시퀀스
 * groupType   : 그룹종류 (0.사원 1.부서 2.프로젝트3.모임)
 * groupLeader : 개설자
 * groupTypeName : 팀 이름
 * 
 */
public class GroupVo {
	public GroupVo(){};
	private Integer groupNo;
	private Integer groupType;
	private String  groupLeader;
	private String  groupTypeName;
	public Integer getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(Integer groupNo) {
		this.groupNo = groupNo;
	}
	public Integer getGroupType() {
		return groupType;
	}
	public void setGroupType(Integer groupType) {
		this.groupType = groupType;
	}
	public String getGroupLeader() {
		return groupLeader;
	}
	public void setGroupLeader(String groupLeader) {
		this.groupLeader = groupLeader;
	}
	public String getGroupTypeName() {
		return groupTypeName;
	}
	public void setGroupTypeName(String groupTypeName) {
		this.groupTypeName = groupTypeName;
	}
	
	
	
}
