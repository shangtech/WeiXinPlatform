package net.shangtech.weixin.sys.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shangtech.ssh.core.base.BaseController;
import net.shangtech.ssh.core.util.FileUtils;
import net.shangtech.weixin.custom.entity.CustomService;
import net.shangtech.weixin.custom.entity.CustomServiceGroup;
import net.shangtech.weixin.custom.service.CustomServiceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/manage/application/custom")
public class CustomServiceController extends BaseController {
	@Autowired private CustomServiceService service;
	private static final String PATH = "user/application/custom";
	@RequestMapping("/list")
	public String list(){
		List<CustomServiceGroup> list = service.findGroupsByUser(getUser().getId());
		request.setAttribute("list", list);
		Map<Integer, List<CustomService>> map = new HashMap<Integer, List<CustomService>>();
		for(CustomServiceGroup group : list){
			map.put(group.getId(), service.findServiceByGroup(group.getId()));
		}
		request.setAttribute("map", map);
		return PATH + "/list";
	}
	
	@RequestMapping("/list/{group}")
	public String listByGroup(@PathVariable Integer group){
		List<CustomService> list = service.findServiceByGroup(group);
		request.setAttribute("list", list);
		return PATH + "/list-group";
	}
	
	@RequestMapping("/group/form")
	public String groupForm(){
		Integer id = getId();
		CustomServiceGroup group = new CustomServiceGroup();
		if(id != null){
			group = service.findGroupById(id);
		}
		request.setAttribute("group", group);
		return PATH + "/group-form";
	}
	
	@RequestMapping("/group/save")
	public String saveGroup(HttpServletResponse response, CustomServiceGroup group){
		this.response = response;
		if(group.getId() == null){
			group.setSysUserId(getUser().getId());
		}
		service.saveServiceGroup(group);
		return success(group.getId()+"");
	}
	
	@RequestMapping("/group/delete")
	public String deleteGroup(HttpServletResponse response){
		this.response = response;
		Integer id = getId();
		service.deleteGroup(id);
		return success();
	}
	
	@RequestMapping("/form")
	public String form(){
		CustomService service = new CustomService();
		Integer id = getId();
		if(id != null){
			service = this.service.find(id);
		}else{
			service.setGroupId(getInt("group"));
		}
		request.setAttribute("service", service);
		return PATH + "/form";
	}
	
	@RequestMapping("/save")
	public String save(HttpServletRequest request, HttpServletResponse response, CustomService service){
		this.response = response;
		try{
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile image = multipartRequest.getFile("image_file");
			if(image != null){
				service.setImage(FileUtils.saveStreamToFile(image.getInputStream(), image.getOriginalFilename()));
			}
			this.service.saveCustomService(service);
		}catch(IOException e){
			e.printStackTrace();
			return failed("文件保存出错");
		}
		return success();
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletResponse response){
		this.response = response;
		Integer id = getId();
		service.delete(id);
		return success();
	}
}
