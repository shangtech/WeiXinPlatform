<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<c:forEach items="${list}" var="item">
<tr data-id="${item.id}">
	<td>${item.houseName}</td>
	<td>${item.houseArea}</td>
	<td>${item.description}</td>
	<td>${item.sort}</td>
	<td class="btngroup tc">
		<div class="btn-group">
			<a href="javascript:;" class="btn edit">编辑</a>
			<a href="javascript:;" class="btn 3dimage">3D全景图</a>
			<a href="javascript:;" class="btn remove">删除户型</a>
		</div>
	</td>
</tr>
</c:forEach>