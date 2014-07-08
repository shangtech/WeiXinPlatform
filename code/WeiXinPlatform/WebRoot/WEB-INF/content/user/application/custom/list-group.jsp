<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
								<c:forEach items="${list}" var="item" varStatus="i">
        							<c:if test="${(i.index+1)%3 eq 1}"><ul class="thumbnails"></c:if>
        							<li class="span4">
        								<div href="#" class="thumbnail" data-id="${item.id}">
        									<img src="${ctx}/${item.image}" alt=""/>
        									<div class="service-opts" style="margin-top:3px;">
	        									<div class="btn-group">
	        										<a href="javascript:;" class="btn btn-primary edit">编辑</a>
	        										<a href="javascript:;" class="btn btn-primary remove">删除</a>
	        									</div>
	        								</div>
        								</div>
        							</li>
        							<c:if test="${((i.index+1) eq fn:length(list)) or ((i.index+1)%3 eq 0)}"></ul></c:if>
        						</c:forEach>