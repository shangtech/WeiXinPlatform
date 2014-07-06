package net.shangtech.weixin.site.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.shangtech.ssh.core.base.IBaseEntity;

@Entity
@Table(name = "site_news_type")
public class NewsType extends IBaseEntity {

	private static final long serialVersionUID = 1L;

	@Column(name = "type_name")
	private String name;
	
	@Column(name = "sys_user_id")
	private Integer sysUserId;
	
	@Column(name = "sort")
	private Integer sort;
	
	@Column(name = "url")
	private String url;
	
	@Column(name = "memo")
	private String memo;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSysUserId() {
		return sysUserId;
	}

	public void setSysUserId(Integer sysUserId) {
		this.sysUserId = sysUserId;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
	
}
