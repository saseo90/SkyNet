package it.net.sky.join.vo;

import org.springframework.web.multipart.MultipartFile;

public class JoinVo {
	private String member_enum;				// 1. 사원번호
	private int member_department;		// 2. 부서
	private int member_rank;				// 3. 직책
	private String member_pass;				// 4. 비밀번호
	private String member_email;			// 5. 이메일
	private String member_phone; 			// 6. 전화번호
	private String member_adress;			// 7. 주소
	private String member_birth; 			// 8. 생년월일
	private MultipartFile profile; 			// 9. 프로필 사진
	private MultipartFile sign;				// 10. 결재도장
	private String member_name;				// 11. 이름
	private String member_regdate;  		// 12. 입사일
	private String member_resignationdate;	// 13. 퇴사일
	private String member_profile;			// 프로필 사진 경로 (DB에 넣기 위한)
	private String member_sign;				// 결재 도장 경로 (DB에 넣기 위한)		
	
	
	// profile 과 sign 은 MultipartFile 타입이므로 DB에 넣을 수 없다. 그러므로 그 경로를 받을 수 있는 변수 2개를 만들어준다.
	
	public String getMember_enum() {
		return member_enum;
	}
	public void setMember_enum(String member_enum) {
		this.member_enum = member_enum;
	}
	public int getMember_department() {
		return member_department;
	}
	public void setMember_department(int member_department) {
		this.member_department = member_department;
	}
	public int getMember_rank() {
		return member_rank;
	}
	public void setMember_rank(int member_rank) {
		this.member_rank = member_rank;
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
	public MultipartFile getProfile() {
		return profile;
	}
	public void setProfile(MultipartFile profile) {
		this.profile = profile;
	}
	public MultipartFile getSign() {
		return sign;
	}
	public void setSign(MultipartFile sign) {
		this.sign = sign;
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
	
	@Override
	public String toString() {
		return "JoinVo [member_enum=" + member_enum + ", member_department=" + member_department + ", member_rank="
				+ member_rank + ", member_pass=" + member_pass + ", member_email=" + member_email + ", member_phone="
				+ member_phone + ", member_adress=" + member_adress + ", member_birth=" + member_birth + ", profile="
				+ profile + ", sign=" + sign + ", member_name=" + member_name + ", member_regdate=" + member_regdate
				+ ", member_resignationdate=" + member_resignationdate + ", member_profile=" + member_profile
				+ ", member_sign=" + member_sign + "]";
	}
}
