<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
        <ul class="col-nav">
          <li<c:if test="${param.current eq 'wxmenu'}"> class="on"</c:if>><a href="${ctx}/manage/service/wxmenu.htm"><i class="pull-right icon-cog"></i>自定义菜单</a></li>
          <li<c:if test="${param.current eq 'projects'}"> class="on"</c:if>><a href="${ctx}/manage/application/property/projects.htm"><i class="pull-right icon-user"></i>子楼盘管理</a></li>
          <li<c:if test="${param.current eq 'messages'}"> class="on"</c:if>><a href="${ctx}/manage/service/messages.htm"><i class="pull-right icon-star"></i>素材管理</a></li>
        </ul>