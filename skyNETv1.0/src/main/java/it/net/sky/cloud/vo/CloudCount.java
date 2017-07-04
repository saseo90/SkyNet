package it.net.sky.cloud.vo;
/**
 * 
 * @author pc25
 * 1.클라우드 사용여부
 * 2.사용량
 * 3.남은사용량
 */
public class CloudCount {
	public CloudCount(){};
    private int state;
    private int user1;
    private int unuser;
    private String cloudUser;
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getUser1() {
		return user1;
	}
	public void setUser1(int user1) {
		this.user1 = user1;
	}
	public int getUnuser() {
		return unuser;
	}
	public void setUnuser(int unuser) {
		this.unuser = unuser;
	}
	public String getCloudUser() {
		return cloudUser;
	}
	public void setCloudUser(String cloudUser) {
		this.cloudUser = cloudUser;
	}
	@Override
	public String toString() {
		return "CloudCount [state=" + state + ", user1=" + user1 + ", unuser=" + unuser + ", cloudUser=" + cloudUser
				+ "]";
	}
}
