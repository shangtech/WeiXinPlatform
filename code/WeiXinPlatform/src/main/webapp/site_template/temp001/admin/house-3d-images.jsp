<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
					<c:forEach items="${list}" var="item">
						<tr data-id="${item.id}">
							<td>${item.imageName}</td>
							<td>${item.sort}</td>
							<td class="btngroup tc">
								<div class="btn-group">
									<a href="javascript:;" class="btn remove">删除</a>
								</div>
							</td>
						</tr>
						</c:forEach>