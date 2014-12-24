<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
	<form id="groupForm" class="form-horizontal" method="post" action="group/save.htm">
      <div class="control-group">
        <label for="name" class="control-label">分组名称 </label>
        <div class="controls">
          <input id="name" name="name" type="text" placeholder="分组名称" value="${group.name}"/>
          <input type="hidden" name="id" id="group_id" value="${group.id}"/>
        </div>
      </div>
      <div class="control-group">
      	<label for="sort" class="control-label">排序</label>
      	<div class="controls">
      		<input id="sort" name="sort" type="text" placeholder="排序" value="${group.sort}"/>
      	</div>
      </div>
    </form>