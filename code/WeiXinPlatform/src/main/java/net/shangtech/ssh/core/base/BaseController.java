
package net.shangtech.ssh.core.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shangtech.weixin.sys.entity.SysUser;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;

/**
 * 文件名： BaseController.java
 * 作者： 宋相恒
 * 版本： 2013-6-24 下午08:58:26 v1.0
 * 日期： 2013-6-24
 * 描述：
 */
public class BaseController extends BaseMVC {
	@Autowired
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	
	@Override
	public HttpServletRequest getRequest() {
		return request;
	}
	
	protected SysUser getUser(){
		//微信客户端请求的user保存在request中,后台操作请求保存在session中
		SysUser user = (SysUser) request.getAttribute("sysUser");
		if(user == null)
			user = (SysUser) request.getSession().getAttribute("user");
		return user;
	}

	@Override
	public HttpServletResponse getResponse() {
		if(response == null){
			response = ((ServletWebRequest) RequestContextHolder.getRequestAttributes()).getResponse();
		}
		return response;
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
	
	/**
	 * 返回错误信息页面
	 * @param msg	要显示的错误信息
	 * @return
	 */
	protected String error(String msg){
		request.setAttribute("msg", msg);
		return "error";
	}
	
	protected String msg(String msg){
		request.setAttribute("msg", msg);
		return "error";
	}

}

	