package net.shangtech.weixin.controller;

import java.util.List;

import net.shangtech.ssh.core.base.BaseController;
import net.shangtech.weixin.site.entity.News;
import net.shangtech.weixin.site.entity.NewsType;
import net.shangtech.weixin.site.service.NewsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller(value = "weixinNewsController")
@RequestMapping("/weixin/application/news")
public class NewsController extends BaseController {
	@Autowired private NewsService service;
	@RequestMapping("/list")
	public String list(){
		Integer type = getInt("type");
		List<News> list = service.findPublishedNewsByType(type);
		request.setAttribute("list", list);
		request.setAttribute("tip", "详情");
		return "weixin/news/list";
	}
	
	@RequestMapping("/view")
	public String view(){
		Integer id = getId();
		News news = service.find(id);
		NewsType type = service.findType(news.getType());
		request.setAttribute("news", news);
		request.setAttribute("type", type);
		return "weixin/news/view";
	}
}
