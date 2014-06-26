package net.shangtech.weixin.site.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.shangtech.ssh.core.base.IBaseEntity;

@Entity
@Table(name = "site_property")
public class SiteProperty extends IBaseEntity {

	private static final long serialVersionUID = 1L;
	
	@Column(name = "sys_user_id")
	private Integer sysUserId;
	
	@Column(name = "site_id")
	private Integer siteId;
	
	@Column(name = "property_name")
	private String propertyName;
	
	@Column(name = "property_value")
	private String propertyValue;
	
	/**
	 * 表示这个属性是否有多个值
	 * 如果有多个值要用List来保存
	 */
	@Column(name = "is_multiple")
	private Boolean isMultiple;

	public Integer getSysUserId() {
		return sysUserId;
	}

	public void setSysUserId(Integer sysUserId) {
		this.sysUserId = sysUserId;
	}

	public Integer getSiteId() {
		return siteId;
	}

	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}

	public String getPropertyName() {
		return propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

	public String getPropertyValue() {
		return propertyValue;
	}

	public void setPropertyValue(String propertyValue) {
		this.propertyValue = propertyValue;
	}

	public Boolean getIsMultiple() {
		return isMultiple;
	}

	public void setIsMultiple(Boolean isMultiple) {
		this.isMultiple = isMultiple;
	}
	
}
