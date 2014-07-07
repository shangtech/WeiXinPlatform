package net.shangtech.weixin.type;

import org.apache.commons.lang3.StringUtils;

public enum MenuType {
	CLICK("按钮", "click"),
	VIEW("链接", "view");
	private String name;
	private String type;
	MenuType(String name, String type){
		this.name = name;
		this.type = type;
	}
	public static String getName(String type){
		if(StringUtils.isNotBlank(type)){
			for(MenuType menuType : MenuType.values()){
				if(menuType.getType().equals(type)){
					return menuType.getName();
				}
			}
		}
		return "未设置";
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
