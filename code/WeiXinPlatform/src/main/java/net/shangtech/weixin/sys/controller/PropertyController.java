package net.shangtech.weixin.sys.controller;

import javax.servlet.http.HttpServletResponse;

import net.shangtech.ssh.core.base.BaseController;
import net.shangtech.weixin.property.dao.ProjectService;
import net.shangtech.weixin.property.entity.ProjectType;
import net.shangtech.weixin.sys.entity.SysUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}
