<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="/site_template/temp001/project-form.jsp"></jsp:include>
<form class="form-horizontal form-condensed" method="post" action="project/save.htm">
	<div class="control-group">
        <label for="projectName" class="control-label">楼盘名称 </label>
        <div class="controls">
        <div class="row-fluid">
          <input id="projectName" name="projectName" class="span9" type="text" placeholder="楼盘名称" />
          <input type="hidden" name="id" id="id"/>
        </div>
        </div>
    </div>
    <div class="control-group">
        <label for="nameEn" class="control-label">英文名称 </label>
        <div class="controls">
        <div class="row-fluid">
          <input id="nameEn" name="nameEn" type="text" class="span9" placeholder="英文名称" />
        </div>
        </div>
    </div>
    <div class="control-group">
        <label for="sort" class="control-label">排序 </label>
        <div class="controls">
        <div class="row-fluid">
          <input id="sort" name="sort" type="text" class="span9" placeholder="排序" />
        </div>
        </div>
    </div>
    <div class="control-group">
        <label for="priceAvg" class="control-label">楼盘均价</label>
        <div class="controls">
        <div class="row-fluid">
          <input id="priceAvg" name="priceAvg" type="text" class="span9" placeholder="楼盘均价" />
        </div>
        </div>
    </div>
    <div class="control-group">
        <label for="image" class="control-label">封面图</label>
	    <div class="controls uploader">
	    	<div class="row-fluid">
		    <input type="file" id="image" class="span9" data-for="image"/>
		    <input type="hidden" id="image_hidden" name="image" value="${project.image}"/>
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
		    <input type="file" id="imageDescription" class="span9" data-for="imageDescription"/>
		    <input type="hidden" id="imageDescription_hidden" name="image" value="${project.image}"/>
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
          <textarea id="description" name="description" class="span9"></textarea>
        </div>
        </div>
    </div>
    <div class="control-group">
        <label for="image" class="control-label">配套封面</label>
	    <div class="controls uploader">
	    	<div class="row-fluid">
		    <input type="file" id="imagePeripheral" class="span9" data-for="imagePeripheral"/>
		    <input type="hidden" id="imagePeripheral_hidden" name="imagePeripheral" value="${project.image}"/>
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
          <textarea id="peripheral" name="peripheral" class="span9"></textarea>
        </div>
        </div>
    </div>
    <div class="control-group">
        <label for="imageTraffic" class="control-label">交通封面</label>
	    <div class="controls uploader">
	    	<div class="row-fluid">
		    <input type="file" id="imageTraffic" class="span9" data-for="imageTraffic"/>
		    <input type="hidden" id="imageTraffic_hidden" name="imageTraffic" value="${project.image}"/>
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
          <textarea id="traffic" name="traffic" class="span9"></textarea>
        </div>
        </div>
    </div>
</form>