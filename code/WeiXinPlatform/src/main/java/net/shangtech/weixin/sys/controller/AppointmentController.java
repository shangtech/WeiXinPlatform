package net.shangtech.weixin.sys.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shangtech.ssh.core.base.BaseController;
import net.shangtech.ssh.core.base.Page;
import net.shangtech.weixin.appointment.entity.Appointment;
import net.shangtech.weixin.appointment.service.AppointmentService;
import net.shangtech.weixin.site.entity.SiteTemplate;
import net.shangtech.weixin.site.service.SiteTemplateService;
import net.shangtech.weixin.sys.entity.SysUser;
import net.shangtech.weixin.type.SiteTemplateType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 预约相关操作
 * @author songxh
 * @createtime 2014-7-5下午11:52:38
 */
@Controller
@RequestMapping("/manage/application/appointment")
public class AppointmentController extends BaseController {
	@Autowired private AppointmentService service;
	@Autowired private SiteTemplateService tempService;
	private static final String PATH = "user/application/appointment";
	@RequestMapping("/list")
	public String list(){
		return listPage("1");
	}
	@RequestMapping("/list/p{pageInfo}")
	public String listPage(@PathVariable String pageInfo){
		int pageSize = super.parsePageSize(pageInfo, 10);
		int pageNo = super.parsePageNo(pageInfo);
		SysUser user = super.getUser();
		Page<Appointment> page = service.findAppointmentByPage(pageNo, pageSize, user.getId());
		request.setAttribute("page", page);
		return PATH + "/list";
	}
	
	@RequestMapping("/form")
	public String form(){
		List<SiteTemplate> tempList = tempService.findByType(SiteTemplateType.APPOINTMENT.getType());
		request.setAttribute("tempList", tempList);
		return PATH + "/form";
	}
	
	/**
	 * 保存预约活动
	 * @author songxh
	 * @createtime 2014-7-6上午12:07:55
	 * @param response
	 * @return
	 */
	@RequestMapping("/save")
	public String saveAppointment(HttpServletResponse response, Appointment appointment){
		
		return null;
	}
	
	@RequestMapping("/delete")
	public String deleteAppointment(HttpServletResponse response){
		
		return null;
	}
	
	/**
	 * AJAX保存图片,返回保存后的路径
	 * @author songxh
	 * @createtime 2014-7-6上午12:17:11
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/image/save")
	public String saveImage(HttpServletRequest request, HttpServletResponse response){
		
		return null;
	}
	
	/**
	 * 查看可供选择的预约界面模板
	 * @author songxh
	 * @createtime 2014-7-6上午12:17:54
	 * @return
	 */
	@RequestMapping("/template/list")
	public String appointmentTemplates(){
		return null;
	}
	
	/**
	 * 获取模板表单页面
	 * @author songxh
	 * @createtime 2014-7-6上午12:19:04
	 * @return
	 */
	@RequestMapping("/template/form")
	public String formTemplate(){
		Integer id = getId();
		SiteTemplate temp = tempService.find(id);
		request.setAttribute("temp", temp);
		return PATH + "/temp-form";
	}
}
