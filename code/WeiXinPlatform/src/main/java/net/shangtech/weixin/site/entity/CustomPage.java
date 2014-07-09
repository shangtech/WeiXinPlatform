package net.shangtech.weixin.site.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.shangtech.ssh.core.base.IBaseEntity;

@Entity
@Table(name = "custom_page")
public class CustomPage extends IBaseEntity {

	private static final long serialVersionUID = 1L;

	@Column(name = "page_name")
	private String name;
	
	@Column(name = "temp_id")
	private Integer temp;
	
	@Column(name = "page_data")
	private String data;
	
	@Column(name = "create_time")
	private Date createTime;
	
	@Column(name = "sys_user_id")
	private Integer sysUserId;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getTemp() {
		return temp;
	}

	public void setTemp(Integer temp) {
		this.temp = temp;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
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
	
}
