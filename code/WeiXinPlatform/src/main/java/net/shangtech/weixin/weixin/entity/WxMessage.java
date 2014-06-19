package net.shangtech.weixin.weixin.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import net.shangtech.ssh.core.base.IBaseEntity;

@Entity
@Table(name = "wx_message")
public class WxMessage extends IBaseEntity {

	private static final long serialVersionUID = 1L;
	
	@Column(name = "msg_title")
	private String title;
	
	@Column(name = "summary")
	private String summary;
	
	@Column(name = "image")
	private String image;
	
	@Column(name = "msg_content")
	private String content;
	
	@Column(name = "msg_url")
	private String url;
	
	@Column(name = "create_time")
	private Date createTime;
	
	@Column(name = "sys_user_id")
	private Integer sysUserId;
	
	@Column(name = "main_id")
	private Integer mainId;
	
	@Transient
	private List<WxMessage> subMessages;
	
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
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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
	public List<WxMessage> getSubMessages() {
		return subMessages;
	}
	public void setSubMessages(List<WxMessage> subMessages) {
		this.subMessages = subMessages;
	}
	
}
