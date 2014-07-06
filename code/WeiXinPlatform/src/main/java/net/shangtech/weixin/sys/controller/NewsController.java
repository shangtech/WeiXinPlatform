package net.shangtech.weixin.sys.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shangtech.ssh.core.base.BaseController;
import net.shangtech.weixin.site.entity.News;
import net.shangtech.weixin.site.entity.NewsType;
import net.shangtech.weixin.site.service.NewsService;
import net.shangtech.weixin.sys.entity.SysUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage/application/news")
public class NewsController extends BaseController {
	@Autowired private NewsService service;
	private static final String PATH = "user/application/news";
	
	@RequestMapping("/form")
	public String newsForm(){
		SysUser user = getUser();
		List<NewsType> typeList = service.findNewsTypeByUserId(user.getId());
		request.setAttribute("typeList", typeList);
		Integer id = getId();
		News news = new News();
		if(id != null){
			news = service.find(id);
		}
		request.setAttribute("news", news);
		return PATH + "/form";
	}
	
	@RequestMapping("/type/form")
	public String typeForm(){
		Integer id = getId();
		NewsType type = new NewsType();
		if(id != null){
			type = service.findType(id);
		}
		request.setAttribute("type", type);
		return PATH + "/type-form";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletResponse response){
		this.response = response;
		Integer id = getId();
		service.delete(id);
		return success();
	}
	
	@RequestMapping("/save")
	public String saveNews(HttpServletRequest request, HttpServletResponse response, News news){
		this.response = response;
		
		return success();
	}
	
	@RequestMapping("/list")
	public String list(){
		SysUser user = getUser();
		List<News> list = service.findAllNewsBySysUser(user.getId());
		request.setAttribute("list", list);
		return PATH + "/list";
	}
	
	@RequestMapping("/type/list")
	public String typeList(){
		SysUser user = getUser();
		List<NewsType> list = service.findNewsTypeByUserId(user.getId());
		request.setAttribute("list", list);
		return PATH + "/type-list";
	}
	
	@RequestMapping("/type/save")
	public String saveType(HttpServletResponse response, NewsType type){
		this.response = response;
		service.saveType(type);
		return success();
	}
	
	@RequestMapping("/type/delete")
	public String deleteType(HttpServletResponse response){
		this.response = response;
		Integer id = getId();
		service.deleteType(id);
		return success();
	}
}
