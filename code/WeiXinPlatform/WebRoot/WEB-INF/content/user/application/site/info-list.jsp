<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
  <head>
  	<jsp:include page="/WEB-INF/content/user/common/resources.jsp"></jsp:include>
  	<title>仪表盘</title>
  </head>
  <body>
    <div id="in-nav">
      <div class="container">
        <div class="row">
          <div class="span12">
            <ul class="pull-right">
              <li>xxx，下午好。<a href="login.html">退出</a></li>
            </ul>
            <a id="logo" href="index.html">
            <h4>xxx<strong>微信运营平台</strong></h4></a>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/content/user/common/menu.jsp">
    	<jsp:param value="application" name="current"/>
    </jsp:include>
    <div class="page">
      <div class="page-container">
<div class="container">
  <div class="row">
    <jsp:include page="/WEB-INF/content/user/common/menu-application.jsp">
    	<jsp:param value="siteinfo" name="current"/>
    </jsp:include>
    <div class="span9">
    	<div class="pull-right">
	      <a href="form.htm" class="btn">添加网站内容</a>
      	</div>
      <h4 class="header">网站内容列表</h4>
      <div id="d3" style="width: 100%; margin-top: -30px"></div><br />
      <div>
       		<table class="table table-bordered table-hover" id="list">
       			<thead>
       				<tr>
       					<th>标题</th><th>链接地址</th><th>添加时间</th><th width="150">操作</th>
       				</tr>
       			</thead>
       			<tbody>
       				<c:forEach items="${list}" var="item">
       				<tr data-id="${item.id}">
       					<td>${item.title}</td>
       					<td>http://localhost/weixin/weixin/site/info.htm?id=${item.id}</td>
       					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${item.createTime}"/></td>
       					<td class="btngroup tc">
       						<div class="btn-group">
       							<a href="form.htm?id=${item.id}" class="btn edit">编辑</a>
       							<a href="javascript:;" class="btn remove">删除</a>
       						</div>
       					</td>
       				</tr>
       				</c:forEach>
       			</tbody>
       		</table>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('#list .remove').click(function(){
		var id = $(this).parent().parent().parent().attr('data-id');
		$.ajax({
			url: 'delete.htm?id='+id,
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				document.location.reload();
			}
		});
	});
});
</script>
      </div>
    </div>
    <footer>
      <div class="container">
        <div class="row">
          <div class="span12">
            <p class="pull-right">Admin Theme by Nathan Speller</p>
            <p>&copy; Copyright 2013 FreelanceLeague</p>
          </div>
        </div>
      </div>
    </footer>
  </body>
</html>