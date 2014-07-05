package net.shangtech.weixin.appointment.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.shangtech.ssh.core.base.IBaseEntity;

@Entity
@Table(name = "appointment")
public class Appointment extends IBaseEntity {

	private static final long serialVersionUID = 1L;

	@Column(name = "sys_user_id")
	private Integer sysUserId;
	
	@Column(name = "create_time")
	private Date createTime;
	
	@Column(name = "sort")
	private Integer sort;
	
	@Column(name = "start_time")
	private Date startTime;
	
	@Column(name = "end_time")	
	private Date endTime;
	
	@Column(name = "temp_id")
	private Integer tempId;
	
	@Column(name = "custom1")
	private String custom1;
	
	@Column(name = "custom2")	
	private String custom2;
	
	@Column(name = "custom3")
	private String custom3;
	
	@Column(name = "custom4")
	private String custom4;
	
	@Column(name = "custom5")
	private String custom5;
	
	@Column(name = "custom6")
	private String custom6;
	
	@Column(name = "custom7")
	private String custom7;
	
	@Column(name = "title")
	private String title;

	public Integer getSysUserId() {
		return sysUserId;
	}

	public void setSysUserId(Integer sysUserId) {
		this.sysUserId = sysUserId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Integer getTempId() {
		return tempId;
	}

	public void setTempId(Integer tempId) {
		this.tempId = tempId;
	}

	public String getCustom1() {
		return custom1;
	}

	public void setCustom1(String custom1) {
		this.custom1 = custom1;
	}

	public String getCustom2() {
		return custom2;
	}

	public void setCustom2(String custom2) {
		this.custom2 = custom2;
	}

	public String getCustom3() {
		return custom3;
	}

	public void setCustom3(String custom3) {
		this.custom3 = custom3;
	}

	public String getCustom4() {
		return custom4;
	}

	public void setCustom4(String custom4) {
		this.custom4 = custom4;
	}

	public String getCustom5() {
		return custom5;
	}

	public void setCustom5(String custom5) {
		this.custom5 = custom5;
	}

	public String getCustom6() {
		return custom6;
	}

	public void setCustom6(String custom6) {
		this.custom6 = custom6;
	}

	public String getCustom7() {
		return custom7;
	}

	public void setCustom7(String custom7) {
		this.custom7 = custom7;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}
