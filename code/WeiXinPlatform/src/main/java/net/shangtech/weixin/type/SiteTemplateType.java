package net.shangtech.weixin.type;

public enum SiteTemplateType {
	APPOINTMENT(1, "预约页面"),
	CUSTOM_PAGE(2, "自定义页面");
	private Integer type;
	private String name;
	SiteTemplateType(Integer type, String name){
		this.type = type;
		this.name = name;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
