package net.shangtech.weixin.property.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.shangtech.ssh.core.base.IBaseEntity;

@Entity
@Table(name = "house_panorama")
public class HousePanorama extends IBaseEntity{

	private static final long serialVersionUID = 1L;
	
	@Column(name = "house_id")
	private Integer houseId;
	
	@Column(name = "image_name")
	private String imageName;
	
	@Column(name = "sort")
	private Integer sort;
	
	@Column(name = "panorama_id")
	private Integer panoramaId;

	public Integer getHouseId() {
		return houseId;
	}

	public void setHouseId(Integer houseId) {
		this.houseId = houseId;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Integer getPanoramaId() {
		return panoramaId;
	}

	public void setPanoramaId(Integer panoramaId) {
		this.panoramaId = panoramaId;
	}
	
}
