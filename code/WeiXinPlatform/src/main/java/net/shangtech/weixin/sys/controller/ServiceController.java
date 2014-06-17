package net.shangtech.weixin.sys.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shangtech.ssh.core.base.BaseController;
import net.shangtech.ssh.core.base.Page;
import net.shangtech.ssh.core.util.FileUtils;
import net.shangtech.weixin.sys.entity.SysUser;
import net.shangtech.weixin.weixin.entity.WxMenu;
import net.shangtech.weixin.weixin.entity.WxMessage;
import net.shangtech.weixin.weixin.service.WxMenuService;
import net.shangtech.weixin.weixin.service.WxMessageService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/manage/service")
public class ServiceController extends BaseController {
	
	@Autowired private WxMenuService menuService;
	@Autowired private WxMessageService messageService;
	
	/**
	 * 微信菜单管理页面
	 * @return
	 */
	@RequestMapping("/wxmenu")
	public String wxmenu(){
		List<WxMenu> list = menuService.findBySysUser(0);
		request.setAttribute("list", list);
		return "user/service/menu";
	}
	
	/**
	 * AJAX保存微信菜单
	 * @param response
	 * @return
	 */
	@RequestMapping("/wxmenu/save")
	public String saveMenu(HttpServletResponse response){
		this.response = response;
		Integer id = super.getId();
		WxMenu menu = new WxMenu();
		String menuName = request.getParameter("menuName");
		String parentId = request.getParameter("parentId");
		if(StringUtils.isBlank(parentId)){
			parentId = "0";
		}
		SysUser user = getUser();
		if(id != null){
			menu = menuService.find(id);
			if(menu == null)
				return failed("记录不存在");
			if(menu.getSysUserId() != user.getId()){
				return failed("无权限");
			}
			menu.setMenuName(menuName);
			menuService.update(menu);
		}else{
			menu.setMenuName(menuName);
			int parent = Integer.parseInt(parentId);
			WxMenu parentMenu = menuService.find(parent);
			if(parentMenu == null){
				return failed("一级菜单错误");
			}
			if(parentMenu.getSysUserId() != user.getId()){
				return failed("无权限");
			}
			menu.setParentId(parent);
			int count = menuService.countByUserAndParent(0, parent);
			if(parent == 0 && count >= 3){
				return failed("一级菜单最多三个");
			}
			if(parent != 0 && count >= 5){
				return failed("二级菜单最多五个");
			}
			menu.setSort(count+1);
			menu.setSysUserId(0);
			menuService.add(menu);
		}
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		obj.put("parentId", menu.getParentId());
		obj.put("menuName", menu.getMenuName());
		obj.put("id", menu.getId());
		out(obj.toJSONString());
		return null;
	}
	
	/**
	 * AJAX删除微信菜单
	 * 如果还有子菜单就不允许删除
	 * @param response
	 * @return
	 */
	@RequestMapping("/wxmenu/delete")
	public String deleteMenu(HttpServletResponse response){
		this.response = response;
		Integer id = getId();
		if(id == null){
			return failed("未选择");
		}
		WxMenu menu = menuService.find(id);
		if(menu == null){
			return failed("记录不存在");
		}
		SysUser user = getUser();
		if(menu.getSysUserId() != user.getId()){
			return failed("无权限");
		}
		if(menu.getParentId() == 0){
			int count = menuService.countByUserAndParent(user.getId(), id);
			if(count > 0){
				return failed("请先删除子菜单");
			}
		}
		menuService.delete(id);
		return success(String.valueOf(id));
	}
	
	/**
	 * AJAX微信菜单排序
	 * id:sort,id:sort,id:sort...
	 * @return
	 */
	@RequestMapping("/wxmenu/sort")
	public String sortMenu(HttpServletResponse response){
		this.response = response;
		String sortStr = request.getParameter("sort");
		if(StringUtils.isBlank(sortStr)){
			return failed("参数无效");
		}
		String[] sorts = sortStr.split(",");
		SysUser user = getUser();
		List<WxMenu> list = new ArrayList<WxMenu>();
		for(String sort : sorts){
			String[] menuSort = sort.split(":");
			if(menuSort.length != 2){
				return failed("参数无效");
			}
			Integer id = Integer.parseInt(menuSort[0]);
			WxMenu menu = menuService.find(id);
			if(menu == null || menu.getSysUserId() != user.getId()){
				return failed("参数无效");
			}
			menu.setSort(Integer.parseInt(menuSort[1]));
			list.add(menu);
		}
		menuService.update(list);
		return success();
	}
	
	/**
	 * 图文消息管理
	 * @return
	 */
	@RequestMapping("/messages")
	public String messages(){
		return messagesPage("1");
	}
	@RequestMapping("/messages/p{pageInfo}")
	public String messagesPage(@PathVariable String pageInfo){
		int pageSize = super.parsePageSize(pageInfo, 8);
		int pageNo = super.parsePageNo(pageInfo);
		SysUser user = super.getUser();
		Page<WxMessage> page = messageService.findMessageByPage(pageNo, pageSize, user.getId());
		request.setAttribute("page", page);
		return "user/service/messages";
	}
	
	@RequestMapping("/messages/single")
	public String messageEditSingle(){
		
		return "user/service/single-messages";
	}
	@RequestMapping("/messages/multiple")
	public String messageEditMultiple(){
		
		return "user/service/multiple-messages";
	}
	@RequestMapping("/messages/single/save")
	public String singleMessagesSave(WxMessage message, HttpServletResponse response){
		this.response = response;
		SysUser user = getUser();
		message.setSysUserId(user.getId());
		message.setCreatetTime(new Date());
		messageService.saveMessages(Arrays.asList(message));
		return success();
	}
	@RequestMapping("/messages/multiple/save")
	public String multipleMessagesSave(HttpServletResponse response){
		this.response = response;
		return null;
	}
	private static List<String> ALLOW_TYPES = Arrays.asList(".jpg", ".jpeg", ".png");
	@RequestMapping("/messages/image/save")
	public String imageSave(HttpServletResponse response, HttpServletRequest request){
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
	@RequestMapping("/messages/delete")
	public String deleteMessages(HttpServletResponse response){
		this.response = response;
		return null;
	}
}
