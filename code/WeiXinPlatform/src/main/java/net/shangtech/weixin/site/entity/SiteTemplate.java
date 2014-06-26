package net.shangtech.weixin.site.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.shangtech.ssh.core.base.IBaseEntity;

@Entity
@Table(name = "site_template")
public class SiteTemplate extends IBaseEntity {

	private static final long serialVersionUID = 1L;
	
	@Column(name = "temp_name")
	private String name;
	
	@Column(name = "temp_path")
	private String path;
	
	/**
	 * 模板的类型
	 * 留着拓展的,可能有的模板单纯是列表页或者首页或者是某个行业特有的
	 */
	@Column(name = "temp_type")
	private Integer type;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	
}
