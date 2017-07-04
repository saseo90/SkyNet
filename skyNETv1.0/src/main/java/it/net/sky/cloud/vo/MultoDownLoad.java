package it.net.sky.cloud.vo;

import java.io.File;

public class MultoDownLoad {
	private String fileOriName;
	private File fileCont;
	public String getFileOriName() {
		return fileOriName;
	}
	public void setFileOriName(String fileOriName) {
		this.fileOriName = fileOriName;
	}
	public File getFileCont() {
		return fileCont;
	}
	public void setFileCont(File fileCont) {
		this.fileCont = fileCont;
	}
	@Override
	public String toString() {
		return "MultoDownLoad [fileOriName=" + fileOriName + ", fileCont=" + fileCont + "]";
	}
}
