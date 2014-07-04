package net.shangtech.weixin.sys.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.shangtech.ssh.core.base.BaseController;
import net.shangtech.ssh.core.util.FileUtils;
import net.shangtech.weixin.property.entity.ProjectImage;
import net.shangtech.weixin.property.entity.ProjectType;
import net.shangtech.weixin.property.entity.SubProject;
import net.shangtech.weixin.property.service.ProjectService;
import net.shangtech.weixin.sys.entity.SysUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;

/**
 * 房地产行业相关信息设置
 * @author songxh
 * @datetime 2014-6-27下午02:32:01
 */
@Controller
@RequestMapping("/manage/application/property")
public class PropertyController extends BaseController {
	
	@Autowired private ProjectService projectService;
	
	private static final String PATH = "user/application/property";
	
	/**
	 * 子楼盘管理
	 * @author songxh
	 * @datetime 2014-6-27下午02:33:19
	 * @return
	 */
	@RequestMapping("/projects")
	public String projects(){
		SysUser user = getUser();
		List<ProjectType> typeList = projectService.findProjectTypesByUser(user.getId());
		request.setAttribute("typeList", typeList);
		return PATH + "/frame";
	}
	
	/**
	 * ajax保存楼盘分类信息
	 * @author songxh
	 * @datetime 2014-6-27下午04:31:18
	 * @return
	 */
	@RequestMapping("/type/save")
	public String projectTypeSave(HttpServletResponse response){
		this.response = response;
		SysUser user = getUser();
		Integer id = super.getId();
		String typeName = request.getParameter("typeName");
		ProjectType type = new ProjectType();
		type.setId(id);
		type.setName(typeName);
		if(id == null){
			type.setSort(projectService.countTypeByUser(user.getId())+1);
			type.setSysUserId(user.getId());
		}
		projectService.saveType(type);
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		obj.put("msg", "保存成功");
		obj.put("id", type.getId());
		outJson(obj.toJSONString());
		return null;
	}
	
	/**
	 * 删除楼盘类型
	 * @author songxh
	 * @createtime 2014-7-2下午09:57:40
	 * @param response
	 * @return
	 */
	@RequestMapping("/type/delete")
	public String propertyTypeDelete(HttpServletResponse response){
		this.response = response;
		Integer id = getId();
		projectService.deleteProjectType(id);
		return success();
	}
	
	@RequestMapping("/project/save")
	public String saveProject(HttpServletResponse response, SubProject project){
		this.response = response;
		SysUser user = getUser();
		project.setSysUserId(user.getId());
		try{
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile image = multipartRequest.getFile("image");//封面图
			MultipartFile imageDescription = multipartRequest.getFile("imageDescription");//详情页封面图
			MultipartFile imagePeripheral = multipartRequest.getFile("imagePeripheral");//周边配套页封面图
			MultipartFile imageTraffic = multipartRequest.getFile("imageTraffic");//交通配套封面图
			List<MultipartFile> projectImageList = multipartRequest.getFiles("project_image");//楼盘图片
			if(image == null){
				return failed("请上传封面图");
			}
			project.setImage(FileUtils.saveStreamToFile(image.getInputStream(), image.getOriginalFilename()));
			project.setImageDescription(FileUtils.saveStreamToFile(imageDescription.getInputStream(), imageDescription.getOriginalFilename()));
			project.setImagePeripheral(FileUtils.saveStreamToFile(imagePeripheral.getInputStream(), imagePeripheral.getOriginalFilename()));
			project.setImageTraffic(FileUtils.saveStreamToFile(imageTraffic.getInputStream(), imageTraffic.getOriginalFilename()));
			List<ProjectImage> list = new LinkedList<ProjectImage>();
			for(MultipartFile file : projectImageList){
				ProjectImage projectImage = new ProjectImage();
				projectImage.setImage(FileUtils.saveStreamToFile(file.getInputStream(), file.getOriginalFilename()));
				list.add(projectImage);
			}
			projectService.saveProject(project, list);
			JSONObject obj = new JSONObject();
			obj.put("success", true);
			obj.put("image", project.getImage());
			out(obj.toJSONString());
		}catch(ClassCastException e){
			e.printStackTrace();
			return failed("文件上传错误");
		}catch(IOException e){
			e.printStackTrace();
			return failed("文件保存失败");
		}
		return null;
	}
	
	@RequestMapping("/project/form")
	public String projectForm(){
		Integer id = getId();
		SubProject project = new SubProject();
		if(id != null){
			project = projectService.find(id);
		}else{
			project.setType(getInt("type"));
		}
		return PATH + "/project-form";
	}
	
}
