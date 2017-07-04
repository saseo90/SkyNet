package it.net.sky.jobad.vo;

public class JobadVo {
	
	private String link;			// 포스팅 URL(링크)
	private String name;	// 링크 이름
	private String caption;		// 링크 캡션
	private String description;	// 링크 설명
	
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "JobadVo [link=" + link + ", name=" + name + ", caption=" + caption + ", description=" + description
				+ "]";
	}
	
}
