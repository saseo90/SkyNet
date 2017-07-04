package it.net.sky.cloud.vo;

import java.util.Date;

/**
 * Cloud : FileHistory Table View Object
 * 
 * 
 * fileOriNo : 원본파일번혼 
 * fileUser  : 파일소유자
 * code : 0.생성,1.이름변경,2.이동,3.수정,4.삭제(휴지통이동),5.복원
 * fileModeUser : 수정자 사원번호
 * Date : 수정일
 * file_oriname : 원본파일의 원본이름
 */
public class CloudFileHistory {

	public CloudFileHistory(){}
	
	private int fileNo;
	private String  fileUser;
	private Integer fileOriNo;
	private int code;
	private String code2;
	private String fileModeUser;
	private String fileModeDate;
	private String fileOriname;
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getFileUser() {
		return fileUser;
	}
	public void setFileUser(String fileUser) {
		this.fileUser = fileUser;
	}
	public Integer getFileOriNo() {
		return fileOriNo;
	}
	public void setFileOriNo(Integer fileOriNo) {
		this.fileOriNo = fileOriNo;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getFileModeUser() {
		return fileModeUser;
	}
	public void setFileModeUser(String fileModeUser) {
		this.fileModeUser = fileModeUser;
	}
	public String getFileModeDate() {
		return fileModeDate;
	}
	public void setFileModeDate(String fileModeDate) {
		this.fileModeDate = fileModeDate;
	}
	public String getFile_oriname() {
		return fileOriname;
	}
	public void setFile_oriname(String fileOriname) {
		this.fileOriname = fileOriname;
	}
	public String getCode2() {
		return code2;
	}
	public void setCode2(String code2) {
		this.code2 = code2;
	}
	public String getFileOriname() {
		return fileOriname;
	}
	public void setFileOriname(String fileOriname) {
		this.fileOriname = fileOriname;
	}
	@Override
	public String toString() {
		return "CloudFileHistory [fileNo=" + fileNo + ", fileUser=" + fileUser + ", fileOriNo=" + fileOriNo + ", code="
				+ code + ", code2=" + code2 + ", fileModeUser=" + fileModeUser + ", fileModeDate=" + fileModeDate
				+ ", fileOriname=" + fileOriname + "]";
	}

}
