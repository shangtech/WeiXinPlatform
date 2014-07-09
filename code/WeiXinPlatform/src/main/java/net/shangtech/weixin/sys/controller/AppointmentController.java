package net.shangtech.weixin.sys.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shangtech.ssh.core.base.BaseController;
import net.shangtech.ssh.core.base.Page;
import net.shangtech.ssh.core.util.DateUtils;
import net.shangtech.ssh.core.util.FileUtils;
import net.shangtech.weixin.appointment.entity.Appointment;
import net.shangtech.weixin.appointment.service.AppointmentService;
import net.shangtech.weixin.site.entity.SiteTemplate;
import net.shangtech.weixin.site.service.SiteTemplateService;
import net.shangtech.weixin.sys.entity.SysUser;
import net.shangtech.weixin.type.SiteTemplateType;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		this.response = response;
		SysUser user = getUser();
		String startTimeStr = request.getParameter("start_time");
		String endTimeStr = request.getParameter("end_time");
		appointment.setStartTime(DateUtils.parse(startTimeStr+":00"));
		appointment.setEndTime(DateUtils.parse(endTimeStr+":00"));
		appointment.setCreateTime(new Date());
		appointment.setSysUserId(user.getId());
		service.add(appointment);
		return success();
	}
	
	@RequestMapping("/delete")
	public String deleteAppointment(HttpServletResponse response){
		this.response = response;
		Integer id = getId();
		service.delete(id);
		return success();
	}
	private static List<String> ALLOW_TYPES = Arrays.asList(".jpg", ".jpeg", ".png", ".mp3");
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
		this.response = response;
		MultipartFile file = null;
		try{
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			file = multipartRequest.getFile("image");
			if(file == null){
				return failed("文件上传失败");
			}
			String name = file.getOriginalFilename();
			if(StringUtils.isBlank(name) || !name.contains(".")){
				return failed("文件格式错误");
			}
			String extend = name.substring(name.lastIndexOf("."));
			if(!ALLOW_TYPES.contains(extend)){
				return failed("不支持的文件格式");
			}
			String path = FileUtils.saveStreamToFile(file.getInputStream(), file.getOriginalFilename());
			return success(path);
		}catch(ClassCastException e){
			e.printStackTrace();
			return failed("保存文件失败");
		}catch(IOException e){
			e.printStackTrace();
			return failed("保存文件失败");
		}
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
