package net.shangtech.weixin.appointment.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import net.shangtech.ssh.core.base.IBaseEntity;

@Entity
@Table(name = "appointment_history")
public class AppointmentHistory extends IBaseEntity {

	private static final long serialVersionUID = 1L;

	@Column(name = "appointment_id")
	private Integer appointmentId;
	
	@Column(name = "create_time")
	private Date createTime;
	
	@Column(name = "real_name")
	private String realName;
	
	@Column(name = "tel")
	private String tel;

	public Integer getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(Integer appointmentId) {
		this.appointmentId = appointmentId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
