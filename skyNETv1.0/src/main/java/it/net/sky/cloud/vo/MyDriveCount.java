package it.net.sky.cloud.vo;
/**
 * 내 클라우드의 파일개수 카운팅
 * @author pc25
 *
 */
public class MyDriveCount {
	private String myDriverCount;
	private String myGabegeCount;
	public String getMyDriverCount() {
		return myDriverCount;
	}
	public void setMyDriverCount(String myDriverCount) {
		this.myDriverCount = myDriverCount;
	}
	public String getMyGabegeCount() {
		return myGabegeCount;
	}
	public void setMyGabegeCount(String myGabegeCount) {
		this.myGabegeCount = myGabegeCount;
	}
	@Override
	public String toString() {
		return "MyDriveCount [myDriverCount=" + myDriverCount + ", myGabegeCount=" + myGabegeCount + "]";
	}
}
