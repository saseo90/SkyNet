package it.net.sky.custommenu.vo;

public class CustommenuVo {
	
	private int menuId; 		// 메뉴 아이디
	private String name; 		// 메뉴 이름
	private String path; 		// 메뉴 경로
	private String member_enum;	// 사원번호
	private int snum;			// 커스터마이징 메뉴 순서
	
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getMember_enum() {
		return member_enum;
	}
	public void setMember_enum(String member_enum) {
		this.member_enum = member_enum;
	}
	
	@Override
	public String toString() {
		return "CustommenuVo [menuId=" + menuId + ", name=" + name + ", path=" + path + ", member_enum=" + member_enum
				+ ", snum=" + snum + "]";
	}
}
