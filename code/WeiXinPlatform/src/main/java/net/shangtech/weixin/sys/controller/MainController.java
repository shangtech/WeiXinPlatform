package net.shangtech.weixin.sys.controller;

import javax.servlet.http.HttpServletResponse;

import net.shangtech.ssh.core.base.BaseController;
import net.shangtech.ssh.core.util.EncoderUtils;
import net.shangtech.weixin.sys.entity.SysUser;
import net.shangtech.weixin.sys.service.SysUserService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage")
public class MainController extends BaseController {
	@Autowired private SysUserService userService;
	@RequestMapping("/index")
	public String index(){
		return "user/index";
	}
	
	@RequestMapping("/service")
	public String service(){
		return "user/service";
	}
	
	/**
	 * 微应用主页面
	 * @return
	 */
	@RequestMapping("/application")
	public String application(){
		return "user/application";
	}
	
	@RequestMapping("/prelogin")
	public String loginForm(){
		return "login";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletResponse response){
		this.response = response;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(StringUtils.isBlank(username)){
			return failed("请填写用户名");
		}
		if(StringUtils.isBlank(password)){
			return failed("请填写登录密码");
		}
		SysUser user = userService.findByUsername(username);
		if(user == null){
			return failed("用户名或密码错误");
		}
		System.out.println(user.getPassword());
		System.out.println(EncoderUtils.MD5(username+"@"+password));
		if(!user.getPassword().equals(EncoderUtils.MD5(username+"@"+password))){
			return failed("用户名或密码错误");
		}
		request.getSession().setAttribute("user", user);
		return success();
	}
}
