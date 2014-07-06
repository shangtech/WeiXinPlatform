package net.shangtech.weixin.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.shangtech.ssh.core.base.BaseController;
import net.shangtech.weixin.appointment.entity.Appointment;
import net.shangtech.weixin.appointment.entity.AppointmentHistory;
import net.shangtech.weixin.appointment.service.AppointmentService;
import net.shangtech.weixin.site.entity.SiteTemplate;
import net.shangtech.weixin.site.service.SiteTemplateService;
import net.shangtech.weixin.sys.entity.SysUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller(value = "weixinAppointmentController")
@RequestMapping("/weixin/application/appointment")
public class AppointmentController extends BaseController {
	
	@Autowired private AppointmentService service;
	@Autowired private SiteTemplateService tempService;
	
	/**
	 * 微信端显示预约列表
	 * @author songxh
	 * @createtime 2014-7-6上午10:09:18
	 * @return
	 */
	@RequestMapping("/list")
	public String list(){
		SysUser user = getUser();
		List<Appointment> list = service.findBySysUserId(user.getId());
		request.setAttribute("list", list);
		request.setAttribute("url", "view.htm");
		request.setAttribute("tip", "我要参加");
		return "weixin/appointment/list";
	}
	
	@RequestMapping("/view")
	public String view(){
		Integer id = getId();
		Appointment appointment = service.find(id);
		request.setAttribute("appointment", appointment);
		SiteTemplate temp = tempService.find(appointment.getTempId());
		request.setAttribute("temp", temp);
		return "weixin/appointment/view";
	}
	
	@RequestMapping("/save")
	public String save(HttpServletResponse response){
		this.response = response;
		String xm = request.getParameter("xm");
		String tel = request.getParameter("tel");
		Integer appointment = getInt("appointment");
		AppointmentHistory history = new AppointmentHistory();
		history.setCreateTime(new Date());
		history.setRealName(xm);
		history.setTel(tel);
		history.setAppointmentId(appointment);
		service.saveAppointmentHistory(history);
		return success();
	}
}
