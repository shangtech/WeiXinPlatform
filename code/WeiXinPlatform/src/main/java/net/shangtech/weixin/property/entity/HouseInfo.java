package net.shangtech.weixin.property.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.shangtech.ssh.core.base.IBaseEntity;

@Entity
@Table(name = "house_info")
public class HouseInfo extends IBaseEntity {

	private static final long serialVersionUID = 1L;
	
	@Column(name = "sys_user_id")
	private Integer sysUserId;
	
	@Column(name = "house_name")
	private String houseName;
	
	@Column(name = "sub_project_id")
	private Integer projectId;
	
	@Column(name = "floor_num")
	private String floorNum;
	
	@Column(name = "house_area")
	private String houseArea;
	
	@Column(name = "room_num")
	private Integer roomNum;
	
	@Column(name = "hall_num")
	private Integer hallNum;
	
	@Column(name = "sort")
	private Integer sort;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "create_time")
	private Date createTime;
	
	@Column(name = "image")
	private String image;

	public Integer getSysUserId() {
		return sysUserId;
	}

	public void setSysUserId(Integer sysUserId) {
		this.sysUserId = sysUserId;
	}

	public String getHouseName() {
		return houseName;
	}

	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public String getFloorNum() {
		return floorNum;
	}

	public void setFloorNum(String floorNum) {
		this.floorNum = floorNum;
	}

	public String getHouseArea() {
		return houseArea;
	}

	public void setHouseArea(String houseArea) {
		this.houseArea = houseArea;
	}

	public Integer getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(Integer roomNum) {
		this.roomNum = roomNum;
	}

	public Integer getHallNum() {
		return hallNum;
	}

	public void setHallNum(Integer hallNum) {
		this.hallNum = hallNum;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
}
