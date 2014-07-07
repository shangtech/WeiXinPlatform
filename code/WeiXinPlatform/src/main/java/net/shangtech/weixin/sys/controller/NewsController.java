package net.shangtech.weixin.sys.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shangtech.ssh.core.base.BaseController;
import net.shangtech.ssh.core.util.FileUtils;
import net.shangtech.weixin.site.entity.News;
import net.shangtech.weixin.site.entity.NewsType;
import net.shangtech.weixin.site.service.NewsService;
import net.shangtech.weixin.sys.entity.SysUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		SysUser user = getUser();
		try{
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile image = multipartRequest.getFile("image_file");
			if(image != null){
				news.setImage(FileUtils.saveStreamToFile(image.getInputStream(), image.getOriginalFilename()));
			}
			news.setSysUserId(user.getId());
			service.saveNews(news);
		}catch(IOException e){
			return failed("文件保存出错");
		}
		return success();
	}
	
	@RequestMapping("/list")
	public String list(){
		SysUser user = getUser();
		List<News> list = service.findAllNewsBySysUser(user.getId());
		for(News news : list){
			news.setNewsType(service.findType(news.getType()));
		}
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
		SysUser user = getUser();
		type.setSysUserId(user.getId());
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
