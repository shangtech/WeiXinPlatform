<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
								<c:forEach items="${list}" var="item">
        						<div class="project" data-id="${item.id}">
        							<div class="project-image">
        								<img src="${ctx}/${item.image}"/>
        								<div class="project-opts">
        									<div class="btn-group">
        										<a href="javascript:;" class="btn btn-primary edit">编辑</a>
        										<a href="javascript:;" class="btn btn-primary remove">删除</a>
        									</div>
        								</div>
        								<div class="mask"></div>
        							</div>
        							<div class="project-name">
        								<span>${item.projectName}</span>
        								<span>${item.nameEn}</span>
        							</div>
        						</div>
        						</c:forEach>