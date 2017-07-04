package it.net.sky.member.vo;


public class MemberVo {

	
	private String member_enum;				// 1. 사원번호
	private String dep_name;				// 2. 부서
	private String rank_name;				// 3. 직책
	private String member_pass;				// 4. 비밀번호
	private String member_email;			// 5. 이메일
	private String member_phone; 			// 6. 전화번호
	private String member_adress;			// 7. 주소
	private String member_birth; 			// 8. 생년월일
	private String member_profile;			// 프로필 사진 경로 (DB에 넣기 위한)
	private String member_sign;		
	private String member_name;				// 11. 이름
	private String member_regdate;  		// 12. 입사일
	private String member_resignationdate;	// 13. 퇴사일
	public String getMember_enum() {
		return member_enum;
	}
	public void setMember_enum(String member_enum) {
		this.member_enum = member_enum;
	}

	public String getRank_name() {
		return rank_name;
	}
	public void setRank_name(String rank_name) {
		this.rank_name = rank_name;
	}
	public String getMember_pass() {
		return member_pass;
	}
	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_adress() {
		return member_adress;
	}
	public void setMember_adress(String member_adress) {
		this.member_adress = member_adress;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_profile() {
		return member_profile;
	}
	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}
	public String getMember_sign() {
		return member_sign;
	}
	public void setMember_sign(String member_sign) {
		this.member_sign = member_sign;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_regdate() {
		
		return member_regdate;
	}
	public void setMember_regdate(String member_regdate) {
		this.member_regdate = member_regdate;
	}
	public String getMember_resignationdate() {
		return member_resignationdate;
	}
	public void setMember_resignationdate(String member_resignationdate) {
		this.member_resignationdate = member_resignationdate;
	}
	public String getDep_name() {
		return dep_name;
	}
	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}
	@Override
	public String toString() {
		return "MemberVo [member_enum=" + member_enum + ", dep_name=" + dep_name + ", rank_name=" + rank_name
				+ ", member_pass=" + member_pass + ", member_email=" + member_email + ", member_phone=" + member_phone
				+ ", member_adress=" + member_adress + ", member_birth=" + member_birth + ", member_profile="
				+ member_profile + ", member_sign=" + member_sign + ", member_name=" + member_name + ", member_regdate="
				+ member_regdate + ", member_resignationdate=" + member_resignationdate + "]";
	}

	
}
