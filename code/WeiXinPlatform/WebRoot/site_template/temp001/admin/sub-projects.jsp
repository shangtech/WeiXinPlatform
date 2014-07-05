<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
		<div class="pull-right">
		 <a href="javascript:;" id="addTypeBtn" class="btn">添加分类</a>
     	 <a href="javascript:history.go(-1);" class="btn">返回</a>
      	</div>
		<h4 class="header">子楼盘管理</h4>
      	<div id="d3" style="width: 100%; margin-top: -30px"></div><br />
      	<div class="row-fluid">
		<table class="table table-bordered" height="400">
        	<thead>
        		<tr><th width="25%">楼盘分类</th><th>楼盘列表</th></tr>
        	</thead>
        	<tbody>
        		<tr>
        			<td class="nopadding">
        				<div id="menulist">
        					<c:forEach items="${typeList}" var="item">
        					<div class="menunode" id="node-${item.id}" data-id="${item.id}">
        						<a href="#"><span class="menuname name">${item.name}</span></a>
        						<input type="hidden" id="name_en_${item.id}" value="${item.nameEn}"/>
        						<div class="btns">
	        						<a href="#" class="edit"><i class="icon-pencil"></i></a>
	        						<a href="#" class="del"><i class="icon-trash"></i></a>
	        					</div>
	        					<a href="#" class="move"><i class="icon-align-justify"></i></a>
        					</div>
        					</c:forEach>
        				</div>
        			</td>
        			<td>
        				<div class="center" style="margin-bottom:10px;"><a href="javascript:;" style="display: none;" id="addProjectBtn" class="btn btn-primary btn-large">添加楼盘</a></div>
        				<div class="center" id="project-list">
        					<c:forEach items="${map}" var="entry">
        					<div id="project-${entry.key}">
        						<c:forEach items="${entry.value}" var="item">
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
        					</div>
        					</c:forEach>
        				</div>
        			</td>
        		</tr>
        	</tbody>
        </table>
        </div>

<div id="typeFormModal" class="modal hide fade" data-backdrop="static">
  <div class="modal-header">
    <button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
    <h3>楼盘分类</h3>
  </div>
  <div class="modal-body">
    <form class="form-horizontal" method="post" action="type/save.htm">
      <div class="control-group">
        <label for="typeName" class="control-label">分类名称 </label>
        <div class="controls">
          <input id="typeName" name="typeName" type="text" placeholder="分类名称" />
          <input type="hidden" name="id" id="typeId"/>
        </div>
      </div>
      <div class="control-group">
        <label for="nameEn" class="control-label">英文名称 </label>
        <div class="controls">
          <input id="nameEn" name="nameEn" type="text" placeholder="英文名称" />
        </div>
      </div>
    </form>
  </div>
  <div class="modal-footer">
  	<a href="#" data-dismiss="modal" class="btn">取消</a>
  	<a href="#" class="btn btn-primary submit">保存</a>
  </div>
</div>
<div id="projectFormModal" class="modal hide fade" data-backdrop="static" style="width:900px;margin-left:-450px;">
	<div class="modal-header">
    	<button type="button" data-dismiss="modal" aria-hidden="true" class="close">&times;</button>
    	<h3>楼盘详情</h3>
  	</div>
  	<div class="modal-body" style="max-height:650px;"></div>
  	<div class="modal-footer">
	  	<a href="javascript:;" data-dismiss="modal" class="btn">取消</a>
	  	<a href="javascript:;" class="btn btn-primary submit">保存</a>
	</div>
</div>
<script type="text/javascript" src="${ctx}/components/user/js/jqueryui.core.js"></script>
<script type="text/javascript" src="${ctx}/components/bootstrap.singlefile.js"></script>
<script type="text/javascript" src="${ctx}/components/js/user/application/property.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=UP2S64ZI4ohv64DOEE3yz7F9"></script>
<script type="text/javascript" src="${ctx}/components/kindeditor/kindeditor-min.js"></script>
<script type="text/javascript" src="${ctx}/components/kindeditor/lang/zh_CN.js"></script>