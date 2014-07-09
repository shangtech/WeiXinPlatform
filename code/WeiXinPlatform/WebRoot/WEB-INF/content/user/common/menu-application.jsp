<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
	<div class="span3">
      <h4>微应用</h4>
      <div class="sidebar">
        <ul class="col-nav span3">
          <li<c:if test="${param.current eq 'property'}"> class="on"</c:if>><a href="${ctx}/manage/application/property/projects.htm"><i class="pull-right icon-cog"></i>微房产</a></li>
          <li<c:if test="${param.current eq 'appointment'}"> class="on"</c:if>><a href="${ctx}/manage/application/appointment/list.htm"><i class="pull-right icon-user"></i>微预约</a></li>
          <li<c:if test="${param.current eq 'newstype'}"> class="on"</c:if>><a href="${ctx}/manage/application/news/type/list.htm"><i class="pull-right icon-star"></i>资讯分类</a></li>
          <li<c:if test="${param.current eq 'news'}"> class="on"</c:if>><a href="${ctx}/manage/application/news/list.htm"><i class="pull-right icon-star"></i>资讯管理</a></li>
          <li<c:if test="${param.current eq 'custom'}"> class="on"</c:if>><a href="${ctx}/manage/application/custom/list.htm"><i class="pull-right icon-star"></i>客服管理</a></li>
          <li<c:if test="${param.current eq 'custompage'}"> class="on"</c:if>><a href="${ctx}/manage/application/site/page/list.htm"><i class="pull-right icon-star"></i>特效页面</a></li>
        </ul>
      </div>
    </div>