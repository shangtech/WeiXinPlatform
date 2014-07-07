package net.shangtech.weixin.controller;

import net.shangtech.ssh.core.base.BaseController;
import net.shangtech.weixin.site.entity.SiteInfo;
import net.shangtech.weixin.site.service.SiteInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller(value = "weixinSiteController")
@RequestMapping("/weixin/application/site")
public class SiteController extends BaseController {
	@Autowired private SiteInfoService service;
	@RequestMapping("/info")
	public String info(){
		Integer id = getId();
		SiteInfo info = service.find(id);
		request.setAttribute("info", info);
		return "weixin/site/info";
	}
}
