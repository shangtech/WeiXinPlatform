<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
	<form id="serviceForm" class="form-horizontal" method="post" action="save.htm" enctype="multipart/form-data">
      <div class="control-group">
        <label for="name" class="control-label">姓名</label>
        <div class="controls">
          <input id="realname" name="realname" type="text" placeholder="姓名" value="${service.realname}"/>
          <input type="hidden" name="id" id="id" value="${service.id}"/>
          <input type="hidden" name="groupId" value="${service.groupId}"/>
        </div>
      </div>
      <div class="control-group">
      	<label for="sort" class="control-label">手机号码</label>
      	<div class="controls">
      		<input id="tel" name="tel" type="text" placeholder="手机号码" value="${service.tel}"/>
      	</div>
      </div>
      <div class="control-group">
      	<label for="description" class="control-label">人员说明</label>
      	<div class="controls">
      		<input id="description" name="description" type="text" placeholder="人员说明" value="${service.description}"/>
      	</div>
      </div>
      <div class="control-group">
      	<label for="sort" class="control-label">排序</label>
      	<div class="controls">
      		<input id="sort" name="sort" type="text" placeholder="排序" value="${service.sort}"/>
      	</div>
      </div>
      <div class="control-group">
        <label for="image" class="control-label">头像</label>
        <div class="controls uploader">
        	<div class="row-fluid">
        	<input type="file" id="image" name="image_file" class="span9" data-for="image"/>
        	<div class="input-append span9">
        		<span class="fileholder span12" id="fileholder-image">请选择文件</span>
        		<span class="btn filebtn action" id="filebtn-image">选择</span>
        	</div>
        	</div>
        </div>
       </div>
    </form>