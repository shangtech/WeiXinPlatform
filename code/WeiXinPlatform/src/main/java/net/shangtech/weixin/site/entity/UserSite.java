package net.shangtech.weixin.site.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.shangtech.ssh.core.base.IBaseEntity;

@Entity
@Table(name = "user_site")
public class UserSite extends IBaseEntity {
	
	private static final long serialVersionUID = 1L;

	@Column(name = "sys_user_id")
	private Integer sysUserId;
	
	@Column(name = "template_id")
	private Integer templateId;
	
	/**
	 * 应该跟对应的template的temp_type是一样的
	 * 这里是个冗余的
	 */
	@Column(name = "type")
	private Integer type;
	
	public Integer getSysUserId() {
		return sysUserId;
	}
	public void setSysUserId(Integer sysUserId) {
		this.sysUserId = sysUserId;
	}
	public Integer getTemplateId() {
		return templateId;
	}
	public void setTemplateId(Integer templateId) {
		this.templateId = templateId;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
}
