package net.shangtech.ssh.core.base;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

/**
 * 文件名： BaseAction.java<br/>
 * 作者： 宋相恒<br/>
 * 版本： 2014-1-14 下午9:47:23 v1.0<br/>
 * 日期： 2014-1-14<br/>
 * 描述：
 */
public abstract class BaseAction extends BaseMVC implements ServletRequestAware, ServletResponseAware {
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected Integer id;
	public static final String SUCCESS = "success";
	public static final String GET = "GET";
	public static final String POST = "POST";
	
	protected boolean isGet(){
		return GET.equals(request.getMethod());
	}
	
	public void prepare() throws Exception {
		this.id = super.getId();
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public HttpServletResponse getResponse() {
		return this.response;
	}

	@Override
	public HttpServletRequest getRequest() {
		return this.request;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
}

  	