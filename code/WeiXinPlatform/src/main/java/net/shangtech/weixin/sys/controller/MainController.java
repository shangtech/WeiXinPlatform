package net.shangtech.weixin.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage")
public class MainController {
	@RequestMapping("/index")
	public String index(){
		return "user/index";
	}
	
	@RequestMapping("/service")
	public String service(){
		return "user/service";
	}
}
