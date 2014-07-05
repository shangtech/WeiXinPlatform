package net.shangtech.weixin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shangtech.ssh.core.base.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 微信接口,接收微信推送过来的消息
 * @author songxh
 * @createtime 2014-7-5下午09:49:24
 */
@Controller
@RequestMapping("/")
public class WeixinController extends BaseController {
	
	@RequestMapping("/index")
	public String main(HttpServletRequest request, HttpServletResponse response){
		this.response = response;
		
		return null;
	}
}
