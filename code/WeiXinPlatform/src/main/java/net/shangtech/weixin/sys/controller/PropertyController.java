package net.shangtech.weixin.sys.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shangtech.ssh.core.base.BaseController;
import net.shangtech.ssh.core.util.FileUtils;
import net.shangtech.weixin.property.entity.HouseInfo;
import net.shangtech.weixin.property.entity.HousePanorama;
import net.shangtech.weixin.property.entity.Panorama;
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
		Map<Integer, List<SubProject>> map = new HashMap<Integer, List<SubProject>>();
		for(ProjectType type : typeList){
			List<SubProject> list = projectService.findByProjectType(type.getId());
			map.put(type.getId(), list);
		}
		request.setAttribute("map", map);
		return PATH + "/frame";
	}
	
	/**
	 * 按照楼盘分类查看楼盘数据
	 * @author songxh
	 * @createtime 2014-7-5上午09:26:02
	 * @return
	 */
	@RequestMapping("/projects/type")
	public String projectsByType(){
		Integer type = getInt("type");
		List<SubProject> list = projectService.findByProjectType(type);
		request.setAttribute("list", list);
		return PATH + "/projects-by-type";
	}
	
	/**
	 * 查看楼盘图片
	 * @author songxh
	 * @createtime 2014-7-5上午09:26:59
	 * @return
	 */
	public String projectImages(){
		
		return null;
	}
	
	/**
	 * 保存户型信息
	 * @author songxh
	 * @createtime 2014-7-5上午09:31:21
	 * @return
	 */
	@RequestMapping("/house/save")
	public String saveProjectHouse(HttpServletRequest request, HttpServletResponse response, HouseInfo house){
		this.response = response;
		try{
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile image = multipartRequest.getFile("house_image");
			if(image != null){
				house.setImage(FileUtils.saveStreamToFile(image.getInputStream(), image.getOriginalFilename()));
			}
			projectService.saveHouse(house);
		}catch(IOException e){
			e.printStackTrace();
			return failed("文件保存错误");
		}
		return success();
	}
	
	/**
	 * 查看楼盘户型
	 * @author songxh
	 * @createtime 2014-7-5上午09:27:27
	 * @return
	 */
	@RequestMapping("/project/houses")
	public String projectHouses(){
		Integer projectId = getInt("projectId");
		List<HouseInfo> list = projectService.findHousesByProject(projectId);
		request.setAttribute("list", list);
		return PATH + "/project-houses";
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
		String nameEn =request.getParameter("nameEn");
		ProjectType type = new ProjectType();
		type.setId(id);
		type.setName(typeName);
		type.setNameEn(nameEn);
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
	public String saveProject(HttpServletRequest request, HttpServletResponse response, SubProject project){
		this.response = response;
		SysUser user = getUser();
		project.setSysUserId(user.getId());
		try{
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile image = multipartRequest.getFile("image_file");//封面图
			MultipartFile imageDescription = multipartRequest.getFile("image_description");//详情页封面图
			MultipartFile imagePeripheral = multipartRequest.getFile("image_peripheral");//周边配套页封面图
			MultipartFile imageTraffic = multipartRequest.getFile("image_traffic");//交通配套封面图
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
	
	/**
	 * 删除楼盘
	 * @author songxh
	 * @createtime 2014-7-5下午04:55:35
	 * @return
	 */
	@RequestMapping("/project/delete")
	public String projectDelete(HttpServletResponse response){
		this.response = response;
		Integer id = getId();
		projectService.delete(id);
		return success();
	}
	
	@RequestMapping("/project/form")
	public String projectForm(){
		Integer id = getId();
		SubProject project = new SubProject();
		if(id != null){
			project = projectService.find(id);
			List<HouseInfo> houses = projectService.findHousesByProject(id);
			request.setAttribute("houses", houses);
		}else{
			project.setType(getInt("type"));
		}
		request.setAttribute("project", project);
		return PATH + "/project-form";
	}
	
	/**
	 * 保存户型全景图
	 * @author songxh
	 * @createtime 2014-7-5下午03:49:46
	 * @return
	 */
	@RequestMapping("/panorama/save")
	public String panoramaSave(HttpServletRequest request, HttpServletResponse response){
		this.response = response;
		try{
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile front = multipartRequest.getFile("image_front");
			MultipartFile back = multipartRequest.getFile("image_back");
			MultipartFile left = multipartRequest.getFile("image_left");
			MultipartFile right = multipartRequest.getFile("image_right");
			MultipartFile top = multipartRequest.getFile("image_top");
			MultipartFile bottom = multipartRequest.getFile("image_bottom");
			Panorama p = new Panorama();
			p.setImageFront(FileUtils.saveStreamToFile(front.getInputStream(), front.getOriginalFilename()));
			p.setImageBack(FileUtils.saveStreamToFile(back.getInputStream(), back.getOriginalFilename()));
			p.setImageLeft(FileUtils.saveStreamToFile(left.getInputStream(), left.getOriginalFilename()));
			p.setImageRight(FileUtils.saveStreamToFile(right.getInputStream(), right.getOriginalFilename()));
			p.setImageTop(FileUtils.saveStreamToFile(top.getInputStream(), top.getOriginalFilename()));
			p.setImageBottom(FileUtils.saveStreamToFile(bottom.getInputStream(), bottom.getOriginalFilename()));
			String title = request.getParameter("imageName");
			p.setTitle(title);
			HousePanorama hp = new HousePanorama();
			hp.setImageName(title);
			hp.setHouseId(getInt("houseId"));
			hp.setSort(getInt("sort"));
			hp.setPanorama(p);
			projectService.savePanorama(hp);
		}catch(IOException e){
			e.printStackTrace();
			return failed("文件保存出错");
		}
		return success();
	}
	
	@RequestMapping("/panorama/list")
	public String panoramaList(){
		Integer houseId = getInt("house");
		List<HousePanorama> list = projectService.findPanoramasByHouse(houseId);
		request.setAttribute("list", list);
		return PATH + "/house-3d-images";
	}
	
	@RequestMapping("/panorama/delete")
	public String panoramaDelete(HttpServletResponse response){
		this.response = response;
		Integer id = getId();
		projectService.deletePanorama(id);
		return success();
	}
}
