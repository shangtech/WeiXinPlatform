<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
	<div id="in-sub-nav">
      <div class="container">
        <div class="row">
          <div class="span12">
            <ul>
              <li><a<c:if test="${param.current eq 'index'}"> class="active"</c:if> href="${ctx}/manage/index.htm"><i class="batch home"></i><br />仪表盘</a></li>
              <li><a<c:if test="${param.current eq 'service'}"> class="active"</c:if> href="${ctx}/manage/service.htm"><i class="batch stream"></i><br />微服务</a></li>
              <li><a href="messages.html"><i class="batch plane"></i><br />微应用</a></li>
              <li><a href="calendar.html"><i class="batch calendar"></i><br />微营销</a></li>
              <li><a href="faq.html"><i class="batch forms"></i><br />数据统计</a></li>
              <li><a href="users.html"><i class="batch users"></i><br />充值中心</a></li>
              <li><a href="settings.html"><i class="batch settings"></i><br />账户管理</a></li>
              <li><a href="paragraphs.html"><i class="batch quill"></i><br />帮助中心</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>