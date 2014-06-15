package net.shangtech.ssh.core.base;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSONObject;

/**
 * 文件名： BaseMVC.java<br/>
 * 作者： 宋相恒<br/>
 * 版本： 2014-1-14 下午9:05:20 v1.0<br/>
 * 日期： 2014-1-14<br/>
 * 描述：
 */
public abstract class BaseMVC {
	public void outJson(String json) {
		PrintWriter out = null;
		try {
			getResponse().setContentType("text/html;charset=utf-8");
			out = getResponse().getWriter();
			out.print(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(out != null)
				out.close();
		}
	}
	
	public void outXml(String xml) {
		PrintWriter out = null;
		try {
			getResponse().setContentType("text/xml;charset=gbk");
			out = getResponse().getWriter();
			out.print(xml);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(out != null)
				out.close();
		}
	}
	
	public void out(String str){
		outJson(str);
	}
	public int getStart(){
		String start = getRequest().getParameter("start");
		if(StringUtils.isBlank(start))
			start = "0";
		return Integer.parseInt(start);
	}
	public int getPageNo(){
		String pageNo = getRequest().getParameter("page");
		if(StringUtils.isBlank(pageNo))
			pageNo = "1";
		return Integer.parseInt(pageNo);
	}
	public int getLimit(){
		String limit = getRequest().getParameter("limit");
		if(StringUtils.isBlank(limit))
			limit = "10";
		return Integer.parseInt(limit);
	}
	public int getRows(){
		String rows = getRequest().getParameter("rows");
		if(StringUtils.isBlank(rows))
			rows = "10";
		return Integer.parseInt(rows);
	}
	protected Integer getId(){
		String id = getRequest().getParameter("id");
		if(StringUtils.isNotBlank(id))
			return Integer.parseInt(id);
		return null;
	}
	public String success(){
		renderResult(true, "操作成功");
		return null;
	}
	public String failed(){
		renderResult(false, "操作失败");
		return null;
	}
	public String success(String msg){
		renderResult(true, msg);
		return null;
	}
	public String failed(String msg){
		renderResult(false, msg);
		return null;
	}
	public String noSelected(){
		renderResult(false, "请先选择需要操作的记录");
		return null;
	}
	public String renderResult(boolean success, String msg){
		JSONObject obj = new JSONObject();
		obj.put("success", success);
		obj.put("msg", msg);
		outJson(obj.toJSONString());
		return null;
	}
	public abstract HttpServletResponse getResponse();
	public abstract HttpServletRequest getRequest();
}

  	