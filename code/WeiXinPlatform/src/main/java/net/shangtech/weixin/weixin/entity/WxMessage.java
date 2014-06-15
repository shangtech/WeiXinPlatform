package net.shangtech.weixin.weixin.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.shangtech.ssh.core.base.IBaseEntity;

@Entity
@Table(name = "WX_MESSAGE")
public class WxMessage extends IBaseEntity {

	private static final long serialVersionUID = 1L;
	
	@Column(name = "MSG_TITLE")
	private String title;
	
	@Column(name = "SUMMARY")
	private String summary;
	
	@Column(name = "IMAGE")
	private String image;
	
	@Column(name = "MSG_CONTENT")
	private String content;
	
	@Column(name = "MSG_URL")
	private String url;
	
	@Column(name = "CREATE_TIME")
	private Date createtTime;
	
	@Column(name = "SYS_USER_ID")
	private Integer sysUserId;
	
	@Column(name = "MAIN_ID")
	private Integer mainId;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getCreatetTime() {
		return createtTime;
	}
	public void setCreatetTime(Date createtTime) {
		this.createtTime = createtTime;
	}
	public Integer getSysUserId() {
		return sysUserId;
	}
	public void setSysUserId(Integer sysUserId) {
		this.sysUserId = sysUserId;
	}
	public Integer getMainId() {
		return mainId;
	}
	public void setMainId(Integer mainId) {
		this.mainId = mainId;
	}
	
}
