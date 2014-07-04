<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<form class="form-horizontal form-condensed" method="post" action="project/save.htm">
	<div class="control-group">
        <label for="projectName" class="control-label">楼盘名称 </label>
        <div class="controls">
        <div class="row-fluid">
          <input id="projectName" name="projectName" class="span9" type="text" placeholder="楼盘名称" />
          <input type="hidden" name="id" id="id" value="${project.id}"/>
          <input type="hidden" name="type" id="type" value="${project.type}"/>
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
    <div class="control-group">
        <label for="traffic" class="control-label">楼盘地址 </label>
        <div class="controls">
        <div class="row-fluid input-append">
          <input id="address" name="address" class="span9"/>
          <button class="btn" type="button">定位</button>
        </div>
        </div>
    </div>
    <div id="load_address">
    	<div id="l-map" style="width: 100%; height: 452px; overflow: hidden; text-align: left;"></div>
    	<input type="hidden" id="latitude" name="latitude" value=""/>
    	<input type="hidden" id="longitude" name="longitude" value=""/>
    </div>
    <div class="control-group">
        <label for="image_1" class="control-label">楼盘图片</label>
	    <div class="controls uploader">
	    	<div class="row-fluid multifile">
			    <input type="file" id="image_1" class="span9" data-for="image_1"/>
			    <input type="hidden" id="image_1_hidden" name="project_image" value=""/>
		 		<div class="input-append span9">
			        <span class="span12 fileholder" id="fileholder-image_1">请选择文件</span>
			        <span class="btn span2 filebtn action" id="filebtn-image_1">选择</span>
			        <span class="btn span2 action filebtnadd">添加</span>
		    	</div>
	    	</div>
     	</div>
    </div>
</form>
<script type="text/javascript">
	//创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        //setMapEvent();//设置地图事件
        //addMapControl();//向地图添加控件
        //addMarker();//向地图中添加marker
    }
	//创建地图函数：
    function createMap(){
        var map = new BMap.Map("l-map");//在百度地图容器中创建一个地图
        var point = new BMap.Point(118.19343,24.491629);//定义一个中心点坐标
        map.centerAndZoom(point,18);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
	
	//地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
	
	//地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
		var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
		map.addControl(ctrl_nav);
	    //向地图中添加缩略图控件
		var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:0});
		map.addControl(ctrl_ove);
	    //向地图中添加比例尺控件
		var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
		map.addControl(ctrl_sca);
    }
	//标注点数组
    var markerArr = [{title:"我的标记",content:"我的备注",point:"116.453137|39.923291",isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}
		 ,{title:"我的标记",content:"我的备注",point:"118.19303|24.492089",isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}
		 ];
    //创建marker
    function addMarker(){
        for(var i=0;i<markerArr.length;i++){
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0,p1);
			var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
			var iw = createInfoWindow(i);
			var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
			marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                        borderColor:"#808080",
                        color:"#333",
                        cursor:"pointer"
            });
			
			(function(){
				var index = i;
				var _iw = createInfoWindow(i);
				var _marker = marker;
				_marker.addEventListener("click",function(){
				    this.openInfoWindow(_iw);
			    });
			    _iw.addEventListener("open",function(){
				    _marker.getLabel().hide();
			    })
			    _iw.addEventListener("close",function(){
				    _marker.getLabel().show();
			    })
				label.addEventListener("click",function(){
				    _marker.openInfoWindow(_iw);
			    })
				if(!!json.isOpen){
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
        }
    }
    //创建InfoWindow
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json){
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    
    initMap();//创建和初始化地图
</script>