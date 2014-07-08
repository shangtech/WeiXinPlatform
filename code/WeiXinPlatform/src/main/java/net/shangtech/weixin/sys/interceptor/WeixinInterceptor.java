package net.shangtech.weixin.sys.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shangtech.weixin.sys.entity.SysUser;
import net.shangtech.weixin.sys.service.SysUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 这个拦截器用来拦截从微信客户端来的请求,比如点击菜单或者图文消息跳转过来的
 * @author songxh
 * @createtime 2014-7-5下午09:14:30
 */
public class WeixinInterceptor implements HandlerInterceptor {
	
	@Autowired private SysUserService sysUserService;
	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		String appid = request.getParameter("a");
		SysUser user = sysUserService.findByAppid(appid);
		request.setAttribute("sysUser", user);
		return true;
	}

}
