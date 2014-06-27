package net.shangtech.weixin.property.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.shangtech.ssh.core.base.IBaseEntity;

/**
 * 子楼盘,也可以当做楼盘
 * @author songxh
 * @datetime 2014-6-27下午02:11:49
 */
@Entity
@Table(name = "sub_projects")
public class SubProject extends IBaseEntity {

	private static final long serialVersionUID = 1L;
	
	@Column(name = "sys_user_id")
	private Integer sysUserId;
	
	@Column(name = "project_name")
	private String projectName;//楼盘名称
	
	@Column(name = "sort")
	private Integer sort;
	
	@Column(name = "description")
	private String description;//楼盘简介
	
	@Column(name = "create_time")
	private Date createTime;
	
	@Column(name = "name_en")
	private String nameEn;//楼盘英文名
	
	@Column(name = "image")
	private String image;//楼盘封面图
	
	@Column(name = "longitude")
	private String longitude;//楼盘位置经度
	
	@Column(name = "latitude")
	private String latitude;//楼盘位置纬度
	
	@Column(name = "image_description")
	private String imageDescription;//楼盘简介页面封面图
	
	@Column(name = "peripheral")
	private String peripheral;//周边配套
	
	@Column(name = "image_peripheral")
	private String imagePeripheral;//周边配套页面封面图
	
	@Column(name = "traffic")
	private String traffic;//交通情况
	
	@Column(name = "price_avg")
	private String priceAvg;//楼盘均价
	
	@Column(name = "project_type")
	private Integer type;//楼盘分类

	public Integer getSysUserId() {
		return sysUserId;
	}

	public void setSysUserId(Integer sysUserId) {
		this.sysUserId = sysUserId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getNameEn() {
		return nameEn;
	}

	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getImageDescription() {
		return imageDescription;
	}

	public void setImageDescription(String imageDescription) {
		this.imageDescription = imageDescription;
	}

	public String getPeripheral() {
		return peripheral;
	}

	public void setPeripheral(String peripheral) {
		this.peripheral = peripheral;
	}

	public String getImagePeripheral() {
		return imagePeripheral;
	}

	public void setImagePeripheral(String imagePeripheral) {
		this.imagePeripheral = imagePeripheral;
	}

	public String getTraffic() {
		return traffic;
	}

	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}

	public String getPriceAvg() {
		return priceAvg;
	}

	public void setPriceAvg(String priceAvg) {
		this.priceAvg = priceAvg;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
}
