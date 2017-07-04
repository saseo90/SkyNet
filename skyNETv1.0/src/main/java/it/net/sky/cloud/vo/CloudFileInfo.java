package it.net.sky.cloud.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 
 * Cloud : FileInfo Table View Object
 * fileNo  //필수   :  PK : 파일번호
 * gorupSeq//필수    :  클라우드그룹번호(클라우드)
 * fileGroup//필수 : 그룹번호(그룹)   _ 파라미터
 * fileUser;//필수 : 파일소유자 (등록자) _세션
 * fileDirectory;//필수 : 폴더(이름)경로
 * fileName;//필수 : 파일이름(저장이름) 사원번호_cloud_경로_파일시퀀스
 * fileOriName;//필수 : 파일원본이름
 * fileSize;//필수 : 파일크기
 * fileType;//필수 : 타입 기본 0.문서 1.폴더  2.음악 3.동영상
 * fileModDate;//최근수정일     _SYSDATE
 * fileLeadDate;//최근 읽은일  _SYSDATE
 * fileRegDate;//등록일           _SYSDATE
 * fileNote;//비고 50자 또는 null
 * fileDel;//삭제여부  0.정상 1.삭제(휴지통)
 *
 */
public class CloudFileInfo {
	public CloudFileInfo(){}
	private Integer fileNo;//필수        :   PK : 파일번호
	private Integer gorupSeq;//필수    :  클라우드그룹번호(클라우드)
	private Integer fileGroup;//필수 : 그룹번호(그룹)   _ 파라미터
	private String  fileUser;//필수 : 파일소유자 (등록자) _세션
	private String  fileDirectory;//필수 : 폴더(이름)경로
	private String  fileName;//필수 : 파일이름(저장이름) 사원번호_cloud_경로_파일시퀀스
	private String  fileOriName;//필수 : 파일원본이름
	private Integer fileSize;//필수 : 파일크기
	private String  fileSize2;
	private String  fileType;//필수 : 타입 기본 0.문서 1.폴더  2.음악 3.동영상
	//@DateTimeFormat(pattern="MM/dd/yyyy KK:mm:ss a Z")
	private String    fileModDate;//최근수정일     _SYSDATE
//	@DateTimeFormat(pattern="MM/dd/yyyy KK:mm:ss a Z")
	private String    fileLeadDate;//최근 읽은일  _SYSDATE
//	@DateTimeFormat(pattern="MM/dd/yyyy KK:mm:ss a Z")
	private String    fileRegDate;//등록일           _SYSDATE
	private String  fileNote;//비고 50자 또는 null
	private Integer fileDel;//삭제여부  0.정상 1.삭제(휴지통)
    public Integer getFileNo() {
        return fileNo;
    }
    public void setFileNo(Integer fileNo) {
        this.fileNo = fileNo;
    }
    public Integer getGorupSeq() {
        return gorupSeq;
    }
    public void setGorupSeq(Integer gorupSeq) {
        this.gorupSeq = gorupSeq;
    }
    public Integer getFileGroup() {
        return fileGroup;
    }
    public void setFileGroup(Integer fileGroup) {
        this.fileGroup = fileGroup;
    }
    public String getFileUser() {
        return fileUser;
    }
    public void setFileUser(String fileUser) {
        this.fileUser = fileUser;
    }
    public String getFileDirectory() {
        return fileDirectory;
    }
    public void setFileDirectory(String fileDirectory) {
        this.fileDirectory = fileDirectory;
    }
    public String getFileName() {
        return fileName;
    }
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    public String getFileOriName() {
        return fileOriName;
    }
    public void setFileOriName(String fileOriName) {
        this.fileOriName = fileOriName;
    }
    public Integer getFileSize() {
        return fileSize;
    }
    public void setFileSize(Integer fileSize) {
        this.fileSize = fileSize;
    }
    public String getFileType() {
        return fileType;
    }
    public void setFileType(String fileType) {
        this.fileType = fileType;
    }
    public String getFileModDate() {
        return fileModDate;
    }
    public void setFileModDate(String fileModDate) {
        this.fileModDate = fileModDate;
    }
    public String getFileLeadDate() {
        return fileLeadDate;
    }
    public void setFileLeadDate(String fileLeadDate) {
        this.fileLeadDate = fileLeadDate;
    }
    public String getFileRegDate() {
        return fileRegDate;
    }
    public void setFileRegDate(String fileRegDate) {
        this.fileRegDate = fileRegDate;
    }
    public String getFileNote() {
        return fileNote;
    }
    public void setFileNote(String fileNote) {
        this.fileNote = fileNote;
    }
    public Integer getFileDel() {
        return fileDel;
    }
    public void setFileDel(Integer fileDel) {
        this.fileDel = fileDel;
    }
    
    public String getFileSize2() {
        return fileSize2;
    }
    public void setFileSize2(String fileSize2) {
        this.fileSize2 = fileSize2;
    }
    @Override
    public String toString() {
        return "CloudFileInfo [fileNo=" + fileNo + ", gorupSeq=" + gorupSeq + ", fileGroup=" + fileGroup + ", fileUser="
                + fileUser + ", fileDirectory=" + fileDirectory + ", fileName=" + fileName + ", fileOriName="
                + fileOriName + ", fileSize=" + fileSize + ", fileSize2=" + fileSize2 + ", fileType=" + fileType
                + ", fileModDate=" + fileModDate + ", fileLeadDate=" + fileLeadDate + ", fileRegDate=" + fileRegDate
                + ", fileNote=" + fileNote + ", fileDel=" + fileDel + "]";
    }
}
