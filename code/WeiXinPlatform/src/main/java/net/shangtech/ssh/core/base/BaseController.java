
package net.shangtech.ssh.core.base;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shangtech.weixin.sys.entity.SysUser;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSONObject;

/**
 * 文件名： BaseController.java
 * 作者： 宋相恒
 * 版本： 2013-6-24 下午08:58:26 v1.0
 * 日期： 2013-6-24
 * 描述：
 */
public class BaseController {
	
	protected SysUser getUser(HttpServletRequest request){
		//微信客户端请求的user保存在request中,后台操作请求保存在session中
		SysUser user = (SysUser) request.getAttribute("sysUser");
		if(user == null){
			Object obj = request.getSession().getAttribute("user");
			if(obj != null){
				user = (SysUser) obj;
			}
		}
		return user;
	}
	
	public String success(HttpServletResponse response){
		renderResult(response, true, "操作成功");
		return null;
	}
	public String failed(HttpServletResponse response){
		renderResult(response, false, "操作失败");
		return null;
	}
	public String success(HttpServletResponse response, String msg){
		renderResult(response, true, msg);
		return null;
	}
	public String failed(HttpServletResponse response, String msg){
		renderResult(response, false, msg);
		return null;
	}
	
	protected int parsePageNo(String pageInfo){
		if(StringUtils.isBlank(pageInfo))
			return 1;
		if(!pageInfo.contains("-"))
			return Integer.parseInt(pageInfo);
		return Integer.parseInt(pageInfo.split("-")[0]);
	}
	
	protected int parsePageSize(String pageInfo, int pageSize){
		if(StringUtils.isBlank(pageInfo) || !pageInfo.contains("-"))
			return pageSize;
		return Integer.parseInt(pageInfo.split("-")[1]);
	}
	
	public String renderResult(HttpServletResponse response, boolean success, String msg){
		JSONObject obj = new JSONObject();
		obj.put("success", success);
		obj.put("msg", msg);
		outJson(response, obj.toJSONString());
		return null;
	}
	
	protected Integer getId(HttpServletRequest request){
		String id = request.getParameter("id");
		if(StringUtils.isNotBlank(id))
			return Integer.parseInt(id);
		return null;
	}
	
	public Integer getInt(HttpServletRequest request, String name){
		String value = request.getParameter(name);
		if(value != null && !"".equals(value))
			return Integer.parseInt(value);
		return null;
	}
	
	public String getString(HttpServletRequest request, String name){
		return request.getParameter(name);
	}
	
	public void out(HttpServletResponse response, String str){
		outJson(response, str);
	}
	
	public void outJson(HttpServletResponse response, String json) {
		PrintWriter out = null;
		try {
			response.setContentType("text/html;charset=utf-8");
			out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(out != null)
				out.close();
		}
	}

}

	