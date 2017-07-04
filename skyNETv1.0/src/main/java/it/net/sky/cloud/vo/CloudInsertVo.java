package it.net.sky.cloud.vo;
/**
 * 
 * 그룹생성시 입력 파라미터 객체
 * 
 * 그룹정보 1개 그리고 사원번호 다수(1개이상) 와 그룹이름(사원이름_사원이름)
 * 
 */
public class CloudInsertVo {
	public CloudInsertVo(){};
	private Integer groupType;
	private String  groupLeader;
	private String  groupTypeName;
	
	private CloudGroupVo member;//클라우드번호  ,별명 : 기본값 사원이름_사원이름

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
	public CloudGroupVo getMember() {
		return member;
	}
	public void setMember(CloudGroupVo member) {
		this.member = member;
	}
}
