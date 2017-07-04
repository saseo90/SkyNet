package it.net.sky.message.vo;
/**
 * 메인 위젯에서 사용할 메시지 통계
 * @author pc25
 * 결과 
 * 1.newMSG  :새쪽지
 * 2.oldMSG  :읽은
 * 3.saveMSG :보관중
 */
public class MyMsgCount {
	
	public MyMsgCount(){};
	
	private int newMSG;
	private int oldMSG;
	private int saveMSG;
	
	public int getNewMSG() {
		return newMSG;
	}

	public void setNewMSG(int newMSG) {
		this.newMSG = newMSG;
	}

	public int getOldMSG() {
		return oldMSG;
	}

	public void setOldMSG(int oldMSG) {
		this.oldMSG = oldMSG;
	}

	public int getSaveMSG() {
		return saveMSG;
	}

	public void setSaveMSG(int saveMSG) {
		this.saveMSG = saveMSG;
	}

	@Override
	public String toString() {
		return "MyMsgCount [newMSG=" + newMSG + ", oldMSG=" + oldMSG + ", saveMSG=" + saveMSG + "]";
	}
}
