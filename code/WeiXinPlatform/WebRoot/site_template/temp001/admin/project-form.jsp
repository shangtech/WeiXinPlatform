<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<c:if test="${not empty project.id}">
	<div class="tabbable">
		<div class="pull-right" id="houses-btns" style="display:none;">
			<a class="btn" href="javascript:;">保存户型图</a>
		</div>
		<div class="pull-right" id="3d-btns" style="display:none;">
			<a class="btn" href="javascript:;">保存3D全景图</a>
		</div>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#basic" data-toggle="tab">基础信息</a></li>
			<li><a href="#houses" data-toggle="tab">户型列表</a></li>
			<li><a id="tab-3dimage" href="javascript:;">3D全景图</a></li>
		</ul>
		
		<div class="tab-content">
			<div class="tab-pane active" id="basic">
</c:if>
<form class="form-horizontal form-condensed" method="post" action="project/save.htm" enctype="multipart/form-data">
	<div class="control-group">
        <label for="projectName" class="control-label">楼盘名称 </label>
        <div class="controls">
        <div class="row-fluid">
          <input id="projectName" name="projectName" class="span9" value="${project.projectName}" type="text" placeholder="楼盘名称" />
          <input type="hidden" name="id" id="id" value="${project.id}"/>
          <input type="hidden" name="type" id="type" value="${project.type}"/>
        </div>
        </div>
    </div>
    <div class="control-group">
    	<div class="controls">
    		<label class="checkbox"><input <c:if test="${project.custom1 eq 'on'}">checked</c:if> name="custom1" id="isStar" type="checkbox"> 明星楼盘</label>
    	</div>
    </div>
    <div class="control-group">
        <label for="nameEn" class="control-label">英文名称 </label>
        <div class="controls">
        <div class="row-fluid">
          <input id="nameEn" name="nameEn" value="${project.nameEn}" type="text" class="span9" placeholder="英文名称" />
        </div>
        </div>
    </div>
    <div class="control-group">
        <label for="sort" class="control-label">排序 </label>
        <div class="controls">
        <div class="row-fluid">
          <input id="sort" name="sort" value="${project.sort}" type="text" class="span9" placeholder="排序" />
        </div>
        </div>
    </div>
    <div class="control-group">
        <label for="priceAvg" class="control-label">楼盘均价</label>
        <div class="controls">
        <div class="row-fluid">
          <input id="priceAvg" value="${project.priceAvg}" name="priceAvg" type="text" class="span9" placeholder="楼盘均价" />
        </div>
        </div>
    </div>
    <div class="control-group">
        <label for="image" class="control-label">封面图</label>
	    <div class="controls uploader">
	    	<div class="row-fluid">
		    <input type="file" id="image" name="image_file" class="span9" data-for="image"/>
	 		<div class="input-append span9">
		        <span class="span12 fileholder" id="fileholder-image">请选择文件</span>
		        <span class="btn span2 filebtn action" id="filebtn-image">选择</span>
	    	</div>
	    	</div>
     	</div>
    </div>
    <div class="control-group">
        <label for="imageDescription" class="control-label">详情封面</label>
	    <div class="controls uploader">
	    	<div class="row-fluid">
		    <input type="file" id="imageDescription" name="image_description" class="span9" data-for="imageDescription"/>
	 		<div class="input-append span9">
		        <span class="span12 fileholder" id="fileholder-imageDescription">请选择文件</span>
		        <span class="btn span2 filebtn action" id="filebtn-imageDescription">选择</span>
	    	</div>
	    	</div>
     	</div>
    </div>
    <div class="control-group">
        <label for="description" class="control-label">楼盘详情 </label>
        <div class="controls">
        <div class="row-fluid">
          <textarea id="description" name="description" class="span9">${project.description}</textarea>
        </div>
        </div>
    </div>
    <div class="control-group">
        <label for="image" class="control-label">配套封面</label>
	    <div class="controls uploader">
	    	<div class="row-fluid">
		    <input type="file" id="imagePeripheral" name="image_peripheral" class="span9" data-for="imagePeripheral"/>
	 		<div class="input-append span9">
		        <span class="span12 fileholder" id="fileholder-imagePeripheral">请选择文件</span>
		        <span class="btn span2 filebtn action" id="filebtn-imagePeripheral">选择</span>
	    	</div>
	    	</div>
     	</div>
    </div>
    <div class="control-group">
        <label for="peripheral" class="control-label">周边配套 </label>
        <div class="controls">
        <div class="row-fluid">
          <textarea id="peripheral" name="peripheral" class="span9">${project.peripheral}</textarea>
        </div>
        </div>
    </div>
    <div class="control-group">
        <label for="imageTraffic" class="control-label">交通封面</label>
	    <div class="controls uploader">
	    	<div class="row-fluid">
		    <input type="file" id="imageTraffic" name="image_traffic" class="span9" data-for="imageTraffic"/>
	 		<div class="input-append span9">
		        <span class="span12 fileholder" id="fileholder-imageTraffic">请选择文件</span>
		        <span class="btn span2 filebtn action" id="filebtn-imageTraffic">选择</span>
	    	</div>
	    	</div>
     	</div>
    </div>
    <div class="control-group">
        <label for="traffic" class="control-label">交通配套 </label>
        <div class="controls">
        <div class="row-fluid">
          <textarea id="traffic" name="traffic" class="span9">${project.traffic}</textarea>
        </div>
        </div>
    </div>
    <div class="control-group">
        <label for="traffic" class="control-label">楼盘地址 </label>
        <div class="controls">
        <div class="row-fluid input-append">
          <input type="text" id="address" name="address" class="span9"/>
          <button class="btn" type="button">定位</button>
        </div>
        </div>
    </div>
    <div id="load_address">
    	<div id="l-map" style="width: 100%; height: 452px;margin-bottom:30px;">
    		<iframe src="${ctx}/site_template/temp001/admin/map.html" width="100%" height="100%" frameborder="0"></iframe>
    	</div>
    </div>
    <div class="control-group">
        <label for="image_1" class="control-label">楼盘图片</label>
	    <div class="controls uploader">
	    	<div class="row-fluid multifile">
			    <input type="file" id="image_1" name="project_image" class="span9" data-for="image_1"/>
		 		<div class="input-append span9">
			        <span class="span12 fileholder" id="fileholder-image_1">请选择文件</span>
			        <span class="btn span2 filebtn action" id="filebtn-image_1">选择</span>
			        <span class="btn span2 action filebtnadd">添加</span>
		    	</div>
	    	</div>
     	</div>
    </div>
</form>
<c:if test="${not empty project.id}">
			</div>
			<div class="tab-pane" id="houses">
				<table class="table table-bordered table-hover">
					<thead>
						<tr><th>户型名称</th><th>面积</th><th>详情</th><th>排序</th><th width="240">操作</th></tr>
					</thead>
					<tbody>
						<c:forEach items="${houses}" var="item">
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
					</tbody>
				</table>
				<form class="form-horizontal form-condensed" method="post" action="house/save.htm" enctype="multipart/form-data">
					<div class="control-group">
				        <label for="houseName" class="control-label">户型名称</label>
				        <div class="controls">
				        <div class="row-fluid">
				          <input id="houseName" name="houseName" class="span9" type="text" placeholder="户型名称" />
				          <input type="hidden" name="id" id="house-id"/>
				          <input type="hidden" name="projectId" id="projectId" value="${project.id}"/>
				        </div>
				        </div>
				    </div>
				    <div class="control-group">
				        <label for="houseName" class="control-label">面积</label>
				        <div class="controls">
				        <div class="row-fluid">
				          <input id="houseArea" name="houseArea" class="span9" type="text" placeholder="户型面积" />
				        </div>
				        </div>
				    </div>
				    <div class="control-group">
				        <label for="houseName" class="control-label">详情</label>
				        <div class="controls">
				        <div class="row-fluid">
				          <input id="houseDescription" name="description" class="span9" type="text" placeholder="详情" />
				        </div>
				        </div>
				    </div>
				    <div class="control-group">
				        <label for="houseName" class="control-label">排序</label>
				        <div class="controls">
				        <div class="row-fluid">
				          <input id="houseSort" name="sort" class="span9" type="text" placeholder="排序" />
				        </div>
				        </div>
				    </div>
				    <div class="control-group">
				        <label for="imageTraffic" class="control-label">户型图</label>
					    <div class="controls uploader">
					    	<div class="row-fluid">
						    <input type="file" id="house_image" name="house_image" class="span9" data-for="house_image"/>
					 		<div class="input-append span9">
						        <span class="span12 fileholder" id="fileholder-house_image">请选择文件</span>
						        <span class="btn span2 filebtn action" id="filebtn-house_image">选择</span>
					    	</div>
					    	</div>
				     	</div>
				    </div>
				    <div class="control-group">
				    	<div class="controls">
				    		<button type="button" class="btn submit">保存户型信息</button>
				    	</div>
				    </div>
				</form>
			</div>
			<div class="tab-pane" id="house-3d">
				<table class="table table-bordered table-hover">
					<thead>
						<tr><th>全景名称</th><th>排序</th><th width="240">操作</th></tr>
					</thead>
					<tbody>
						<c:forEach items="${panoramas}" var="item">
						<tr data-id="${item.id}">
							<td>${item.panoramaName}</td>
							<td>${item.sort}</td>
							<td class="btngroup tc">
								<div class="btn-group">
									<a href="javascript:;" class="btn remove">删除</a>
								</div>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<form class="form-horizontal form-condensed" method="post" action="panorama/save.htm" enctype="multipart/form-data">
					<div class="control-group">
				        <label for="houseName" class="control-label">全景图名称</label>
				        <div class="controls">
				        <div class="row-fluid">
				          <input name="imageName" class="span9" type="text" placeholder="全景图名称" />
				          <input type="hidden" name="id" id="panorama-house-id"/>
				        </div>
				        </div>
				    </div>
				    <div class="control-group">
				        <label for="image" class="control-label">前</label>
					    <div class="controls uploader">
					    	<div class="row-fluid">
						    <input type="file" id="imageFront" name="image_front" class="span9" data-for="imageFront"/>
					 		<div class="input-append span9">
						        <span class="span12 fileholder" id="fileholder-imageFront">请选择文件</span>
						        <span class="btn span2 filebtn action" id="filebtn-imageFront">选择</span>
					    	</div>
					    	</div>
				     	</div>
				    </div>
				    <div class="control-group">
				        <label for="image" class="control-label">后</label>
					    <div class="controls uploader">
					    	<div class="row-fluid">
						    <input type="file" id="imageBack" name="image_back" class="span9" data-for="imageBack"/>
					 		<div class="input-append span9">
						        <span class="span12 fileholder" id="fileholder-imageBack">请选择文件</span>
						        <span class="btn span2 filebtn action" id="filebtn-imageBack">选择</span>
					    	</div>
					    	</div>
				     	</div>
				    </div>
				    <div class="control-group">
				        <label for="image" class="control-label">左</label>
					    <div class="controls uploader">
					    	<div class="row-fluid">
						    <input type="file" id="imageLeft" name="image_left" class="span9" data-for="imageLeft"/>
					 		<div class="input-append span9">
						        <span class="span12 fileholder" id="fileholder-imageLeft">请选择文件</span>
						        <span class="btn span2 filebtn action" id="filebtn-imageLeft">选择</span>
					    	</div>
					    	</div>
				     	</div>
				    </div>
				    <div class="control-group">
				        <label for="image" class="control-label">右</label>
					    <div class="controls uploader">
					    	<div class="row-fluid">
						    <input type="file" id="imageRight" name="image_right" class="span9" data-for="imageRight"/>
					 		<div class="input-append span9">
						        <span class="span12 fileholder" id="fileholder-imageRight">请选择文件</span>
						        <span class="btn span2 filebtn action" id="filebtn-imageRight">选择</span>
					    	</div>
					    	</div>
				     	</div>
				    </div>
				    <div class="control-group">
				        <label for="image" class="control-label">上</label>
					    <div class="controls uploader">
					    	<div class="row-fluid">
						    <input type="file" id="imageTop" name="image_top" class="span9" data-for="imageTop"/>
					 		<div class="input-append span9">
						        <span class="span12 fileholder" id="fileholder-imageTop">请选择文件</span>
						        <span class="btn span2 filebtn action" id="filebtn-imageTop">选择</span>
					    	</div>
					    	</div>
				     	</div>
				    </div>
				    <div class="control-group">
				        <label for="image" class="control-label">下</label>
					    <div class="controls uploader">
					    	<div class="row-fluid">
						    <input type="file" id="imageBottom" name="image_bottom" class="span9" data-for="imageBottom"/>
					 		<div class="input-append span9">
						        <span class="span12 fileholder" id="fileholder-imageBottom">请选择文件</span>
						        <span class="btn span2 filebtn action" id="filebtn-imageBottom">选择</span>
					    	</div>
					    	</div>
				     	</div>
				    </div>
				    <div class="control-group">
				    	<div class="controls">
				    		<a href="javascript" class="btn submit">保存</a>
				    	</div>
				    </div>
				</form>
			</div>
		</div>
	</div>
</c:if>
<script type="text/javascript">
	descriptionEditor = KindEditor.create('#description', {
		width:666,
		height:140
	});
	peripheralEditor = KindEditor.create('#peripheral', {
		width:666,
		height:140
	});
	trafficEditor = KindEditor.create('#traffic', {
		width:666,
		height:140
	});
</script>