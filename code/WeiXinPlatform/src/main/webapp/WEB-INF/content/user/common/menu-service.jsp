<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
	<div class="span3">
      <h4>微服务</h4>
      <div class="sidebar">
        <ul class="col-nav span3">
          <li<c:if test="${param.current eq 'wxmenu'}"> class="on"</c:if>><a href="${ctx}/manage/service/wxmenu.htm"><i class="pull-right icon-cog"></i>自定义菜单</a></li>
          <li<c:if test="${param.current eq 'reply'}"> class="on"</c:if>><a href="#metrics"><i class="pull-right icon-user"></i>自动回复</a></li>
          <li<c:if test="${param.current eq 'messages'}"> class="on"</c:if>><a href="${ctx}/manage/service/messages.htm"><i class="pull-right icon-star"></i>素材管理</a></li>
        </ul>
      </div>
    </div>