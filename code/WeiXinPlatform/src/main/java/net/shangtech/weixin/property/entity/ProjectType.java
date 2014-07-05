package net.shangtech.weixin.property.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.shangtech.ssh.core.base.IBaseEntity;

/**
 * 楼盘分类表
 * @author songxh
 * @datetime 2014-6-27下午02:28:59
 */
@Entity
@Table(name = "project_type")
public class ProjectType extends IBaseEntity {

	private static final long serialVersionUID = 1L;

	@Column(name = "type_name")
	private String name;
	
	@Column(name = "name_en")
	private String nameEn;
	
	@Column(name = "sys_user_id")
	private Integer sysUserId;
	
	@Column(name = "sort")
	private Integer sort;

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

	public String getNameEn() {
		return nameEn;
	}

	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
	
}
