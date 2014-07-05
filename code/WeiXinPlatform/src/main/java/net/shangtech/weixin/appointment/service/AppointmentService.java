package net.shangtech.weixin.appointment.service;

import net.shangtech.ssh.core.base.BaseDao;
import net.shangtech.ssh.core.base.BaseService;
import net.shangtech.ssh.core.base.Page;
import net.shangtech.weixin.appointment.dao.AppointmentDao;
import net.shangtech.weixin.appointment.entity.Appointment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AppointmentService extends BaseService<Appointment> {
	@Autowired private AppointmentDao dao;
	
	public Page<Appointment> findAppointmentByPage(int pageNo, int pageSize, int sysUserId){
		Page<Appointment> page = new Page<Appointment>(pageSize);
		page.setPageNo(pageNo);
		page.setQuery("where sysUserId=? order by createTime desc", sysUserId);
		page = super.find(page);
		return page;
	}
	
	public void saveAppointment(Appointment appointment){
		
	}
	
	@Override
	protected BaseDao<Appointment> dao() {
		return dao;
	}

}
