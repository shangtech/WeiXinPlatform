<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
	<form id="typeForm" class="form-horizontal" method="post" action="save.htm"/>
      <div class="control-group">
        <label for="name" class="control-label">分类名称 </label>
        <div class="controls">
          <input id="name" name="name" type="text" placeholder="分类名称" value="${type.name}"/>
          <input type="hidden" name="id" id="id" value="${type.id}"/>
        </div>
      </div>
    </form>