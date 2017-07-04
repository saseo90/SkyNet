package it.net.sky.cloud.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;
/**
 * 
 * 파일저장시 사용할 vo
 *
 */
public class FileVo {
	public FileVo(){};
	private String  fileDirectory;//필수 : 폴더(이름)경로
	private MultipartFile file;//파일
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}	
}

