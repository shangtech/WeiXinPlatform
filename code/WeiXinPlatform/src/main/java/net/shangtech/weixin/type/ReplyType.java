package net.shangtech.weixin.type;
/**
 * 自动回复消息类型
 * @author Administrator
 *
 */
public enum ReplyType {
	URL(0, "链接"),
	TEXT(1, "文本"),
	NEWS(2, "图文"),
	ACTIVITY(3, "活动");
	private Integer value;
	private String name;
	ReplyType(Integer value, String name){
		this.value = value;
		this.name = name;
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public static String getName(Integer value){
		if(value != null){
			for(ReplyType type : ReplyType.values()){
				if(type.getValue() == value)
					return type.getName();
			}
		}
		return "未定义";
	}
}
