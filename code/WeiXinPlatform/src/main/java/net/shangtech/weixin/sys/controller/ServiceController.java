package net.shangtech.weixin.sys.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shangtech.ssh.core.base.BaseController;
import net.shangtech.ssh.core.base.Page;
import net.shangtech.ssh.core.util.FileUtils;
import net.shangtech.weixin.Config;
import net.shangtech.weixin.HttpUtil;
import net.shangtech.weixin.sys.entity.SysUser;
import net.shangtech.weixin.weixin.entity.WxMenu;
import net.shangtech.weixin.weixin.entity.WxMessage;
import net.shangtech.weixin.weixin.service.WxMenuService;
import net.shangtech.weixin.weixin.service.WxMessageService;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 微信基础服务相关功能
 * 比如自定义菜单
 * 图文消息设置
 * 自动回复设置
 * @author songxh
 *
 */
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
		SysUser user = getUser();
		List<WxMenu> list = menuService.findBySysUser(user.getId());
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
		String menuUrl = request.getParameter("menuUrl");
		if(StringUtils.isBlank(parentId)){
			parentId = "0";
		}
		SysUser user = getUser();
		if(id != null){
			menu = menuService.find(id);
			if(menu == null)
				return failed("记录不存在");
			if(menu.getSysUserId() != user.getId()){
				//return failed("无权限");
			}
			menu.setMenuName(menuName);
			menu.setMenuUrl(menuUrl);
			menuService.update(menu);
		}else{
			menu.setMenuName(menuName);
			menu.setMenuUrl(menuUrl);
			int parent = Integer.parseInt(parentId);
			WxMenu parentMenu = menuService.find(parent);
			if(parentMenu == null){
				//return failed("一级菜单错误");
			}
			if(parentMenu != null && parentMenu.getSysUserId() != user.getId()){
				//return failed("无权限");
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
			menu.setSysUserId(user.getId());
			menuService.add(menu);
		}
		JSONObject obj = new JSONObject();
		obj.put("success", true);
		obj.put("parentId", menu.getParentId());
		obj.put("menuName", menu.getMenuName());
		obj.put("menuUrl", menu.getMenuUrl());
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
	
	@RequestMapping("/wxmenu/sync")
	public String syncMenu(HttpServletResponse response){
		this.response = response;
		SysUser user = getUser();
		JSONArray array = new JSONArray();
		List<WxMenu> list = menuService.findBySysUser(user.getId());
		for(WxMenu menu : list){
			JSONObject obj = new JSONObject();
			obj.put("name", menu.getMenuName());
			List<WxMenu> children = menu.getChildren();
			JSONArray subs = new JSONArray();
			//如果有二级菜单就不用判断类型
			for(WxMenu child : children){
				JSONObject sub = new JSONObject();
				sub.put("name", child.getMenuName());
				sub.put("type", "view");
				String url = child.getMenuUrl();
				if(url.contains("?")){
					url += "&";
				}else{
					url += "?";
				}
				url += "a="+user.getAppid();
				sub.put("url", url);
//				if(MenuType.CLICK.getType().equals(child.getMenuType())){
//					sub.put("type", child.getMenuType());
//					sub.put("key", child.getMenuKey());
//				}else if(MenuType.VIEW.getType().equals(child.getMenuType())){
//					sub.put("type", child.getMenuType());
//					sub.put("url", child.getMenuUrl());
//				}else{
//					continue;
//				}
				subs.add(sub);
			}
			if(!subs.isEmpty()){
				obj.put("sub_button", subs);
				array.add(obj);
				continue;
			}
			obj.put("type", "view");
			String url = menu.getMenuUrl();
			if(url.contains("?")){
				url += "&";
			}else{
				url += "?";
			}
			url += "a="+user.getAppid();
			obj.put("url", url);
//			if(MenuType.CLICK.getType().equals(menu.getMenuType())){
//				obj.put("type", menu.getMenuType());
//				obj.put("key", menu.getMenuKey());
//			}else if(MenuType.VIEW.getType().equals(menu.getMenuType())){
//				obj.put("type", menu.getMenuType());
//				obj.put("url", menu.getMenuUrl());
//			}else{
//				continue;
//			}
			array.add(obj);
		}
		JSONObject result = new JSONObject();
		result.put("button", array);
		HttpClient client = HttpUtil.createSSLInsecureClient();
		String accessToken = HttpUtil.getAccessToken(client, user);
		if(accessToken == null){
			return failed("同步发生异常,请联系系统管理员");
		}
		HttpPost post = new HttpPost(Config.URL_POST_MENU_CREATE + "access_token=" + accessToken);
		HttpEntity entity = new StringEntity(result.toJSONString(), "UTF-8");
		post.setEntity(entity);
		try {
			String resp = HttpUtil.post(client, post);
			if(StringUtils.isBlank(resp)){
				return failed("同步失败");
			}
			JSONObject json = JSON.parseObject(resp);
			if("0".equals(json.getString("errcode"))){
				return success("同步成功");
			}
			return failed("同步失败");
		} catch (Exception e) {
			e.printStackTrace();
			return failed("同步发生异常,请联系系统管理员");
		}
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
		WxMessage message = new WxMessage();
		message.setCreateTime(new Date());
		Integer id = getId();
		if(id != null){
			message = messageService.find(id);
		}
		request.setAttribute("message", message);
		return "user/service/single-messages";
	}
	@RequestMapping("/messages/multiple")
	public String messageEditMultiple(){
		WxMessage message = new WxMessage();
		message.setCreateTime(new Date());
		Integer id = getId();
		if(id != null){
			message = messageService.find(id);
			message.setSubMessages(messageService.find("where mainId=?", message.getId()));
		}
		request.setAttribute("message", message);
		return "user/service/multiple-messages";
	}
	@RequestMapping("/messages/single/save")
	public String singleMessagesSave(WxMessage message, HttpServletResponse response){
		this.response = response;
		SysUser user = getUser();
		message.setSysUserId(user.getId());
		message.setCreateTime(new Date());
		messageService.saveMessages(Arrays.asList(message));
		return success();
	}
	@RequestMapping("/messages/multiple/save")
	public String multipleMessagesSave(HttpServletResponse response){
		this.response = response;
		SysUser user = getUser();
		String ids = request.getParameter("ids");
		//ids是各个表单字段后缀,ids出现的顺序也就是消息的顺序
		String[] idArr = ids.split(",");
		List<WxMessage> list = new LinkedList<WxMessage>();
		for(String id : idArr){
			WxMessage message = new WxMessage();
			message.setSysUserId(user.getId());
			message.setId(getInt("id_"+id));
			message.setTitle(getString("title_"+id));
			message.setImage(getString("image_"+id));
			message.setContent(getString("content_"+id));
			list.add(message);
		}
		messageService.saveMessages(list);
		return success();
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
