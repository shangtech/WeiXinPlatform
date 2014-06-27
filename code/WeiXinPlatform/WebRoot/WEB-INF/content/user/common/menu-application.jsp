<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
	<div class="span3">
      <h4>微服务</h4>
      <div class="sidebar">
      	<div class="accordion no-padding" id="accordion">
      		<div class="accordion-group">
      			<div class="accordion-heading">
      				<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">菜单</a>
      			</div>
      			<div class="accordion-body collapse in" id="collapseOne" style="height:0px;">
      				<div class="accordion-inner">
      				<ul class="col-nav">
			          <li<c:if test="${param.current eq 'wxmenu'}"> class="on"</c:if>><a href="${ctx}/manage/service/wxmenu.htm"><i class="pull-right icon-cog"></i>自定义菜单</a></li>
			          <li<c:if test="${param.current eq 'reply'}"> class="on"</c:if>><a href="#metrics"><i class="pull-right icon-user"></i>自动回复</a></li>
			          <li<c:if test="${param.current eq 'messages'}"> class="on"</c:if>><a href="${ctx}/manage/service/messages.htm"><i class="pull-right icon-star"></i>素材管理</a></li>
			        </ul>
      				</div>
      			</div>
      		</div>
      		<div class="accordion-group">
      			<div class="accordion-heading">
      				<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">微房产</a>
      			</div>
      			<div class="accordion-body collapse out" id="collapseTwo">
      				<div class="accordion-inner">
      				<jsp:include page="/WEB-INF/content/user/application/property/menu.jsp"></jsp:include>
      				</div>
      			</div>
      		</div>
      	</div>
      	<script type="text/javascript">
      	$('.collapse').collapse();
      	</script>
      </div>
    </div>