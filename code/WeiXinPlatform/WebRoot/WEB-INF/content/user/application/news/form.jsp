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
    	<jsp:param value="service" name="current"/>
    </jsp:include>
    <div class="page">
      <div class="page-container">
<div class="container">
  <div class="row">
    <jsp:include page="/WEB-INF/content/user/common/menu-application.jsp">
    	<jsp:param value="appointment" name="current"/>
    </jsp:include>
    <div class="span9">
    	<div class="pull-right">
	      <a href="form.htm" class="btn">添加新闻资讯</a>
      	</div>
      <h4 class="header">新闻资讯列表</h4>
      <div id="d3" style="width: 100%; margin-top: -30px"></div><br />
      <div>
       		<form class="form-horizontal" method="post" action="wxmenu/save.htm"/>
		      <div class="control-group">
		        <label for="type" class="control-label">资讯分类</label>
		        <div class="controls">
		          <select name="type">
		          	<c:forEach items="${typeList}" var="item">
		          		<option value="${item.id}"<c:if test="${news.type eq item.id}"> selected</c:if>>${item.name}</option>
		          	</c:forEach>
		          </select>
		        </div>
		      </div>
		      <div class="control-group">
		        <label for="title" class="control-label">标题</label>
		        <div class="controls">
		          <input id="title" name="title" type="text" placeholder="标题" />
		          <input name="id" type="hidden" value="${news.id}"/>
		        </div>
		      </div>
		    </form>
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