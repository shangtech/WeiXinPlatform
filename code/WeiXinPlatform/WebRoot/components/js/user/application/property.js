var descriptionEditor, peripheralEditor, trafficEditor;
$(document).ready(function(){
	//添加表单验证
	$('#typeFormModal form').validate({
		rules: {
			typeName: {
				required: true
			}
		},
		messages: {
			typeName: {
				required: '分类名称必填'
			}
		}
	});
	/**
	 * 添加楼盘分类
	 */
	$('#addTypeBtn').click(function(){
		$('#typeId').val('');
		$('#typeName').val('');
		$('#nameEn').val('');
		$('#typeFormModal').modal('toggle');
	});
	/**
	 * 保存楼盘分类
	 * @return {TypeName} 
	 */
	$('#typeFormModal .submit').click(function(){
		var id = $('#typeId').val();
		var typeName = $('#typeName').val();
		var nameEn = $('#nameEn').val();
		if($('#typeFormModal form').valid()){
			$('#typeFormModal form').ajaxSubmit({
				dataType: 'json',
				success: function(result){
					if(!result.success){
						alert(result.msg);
						return;
					}
					if(id){
						$('#node-'+id+' .name').html(typeName);
						$('#name_en_'+id).val(nameEn);
					}else{
						var html = '<div class="menunode" id="node-'+result.id+'" data-id="'+result.id+'">'
        						 + '	<a href="#"><span class="menuname name">'+typeName+'</span></a>'
        						 + '	<input type="hidden" value="'+nameEn+'"/>'
        						 + '	<div class="btns">'
	        					 + '		<a href="#" class="edit"><i class="icon-pencil"></i></a>'
	        					 + '		<a href="#" class="del"><i class="icon-trash"></i></a>'
	        					 + '	</div>'
	        					 + '	<a href="#" class="move"><i class="icon-align-justify"></i></a>' 
	        					 + '</div>';
        				$('#menulist').append(html);
					}
					$('#typeFormModal').modal('toggle');
				}
			});
		}
	});
	/**
	 * 编辑楼盘分类
	 * @memberOf {TypeName} 
	 */
	$('#menulist').on('click', '.edit', function(){
		$('#typeId').val($(this).parent().parent().attr('data-id'));
		$('#typeName').val($(this).parent().parent().find('.name').html());
		$('#nameEn').val($(this).parent().parent().find('input').val());
		$('#typeFormModal').modal('toggle');
	});
	/**
	 * 选择楼盘分类,显示该分类楼盘和添加楼盘按钮
	 * @memberOf {TypeName} 
	 */
	$('#menulist').on('click', '.menunode', function(){
		if(!$(this).hasClass('on')){
			$('#menulist .on').removeClass('on');
			$(this).addClass('on');
			$('#addProjectBtn').show();
			$('#project-list .show').removeClass('show');
			$('#project-'+$(this).attr('data-id')).addClass('show');
		}
	});
	/**
	 * 删除楼盘分类
	 * @memberOf {TypeName} 
	 * @return {TypeName} 
	 */
	$('#menulist').on('click', '.del', function(){
		$.ajax({
			url: ctx + '/manage/application/property/type/delete.htm?id='+$(this).parent().parent().attr('data-id'),
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				$(this).parent().parent().remove();
			}
		});
	});
	/**
	 * 添加楼盘
	 */
	$('#addProjectBtn').click(function(){
		$('#projectFormModal .modal-body').html('');
		$('#projectFormModal').modal('toggle');
		$('#projectFormModal .modal-body').load(ctx + '/manage/application/property/project/form.htm?type='+$('#menulist .on').attr('data-id')+'&_='+new Date().getTime());
	});
	/**
	 * 添加楼盘图片
	 * @memberOf {TypeName} 
	 */
	$('#projectFormModal').on('click', '.filebtnadd', function(){
		var id = new Date().getTime();
		var html = '<div class="row-fluid multifile">'
			     + '<input type="file" id="image_'+id+'" class="span9" name="project_image" data-for="image_'+id+'"/>'
		 		 + '<div class="input-append span9">'
			     +   '<span class="span12 fileholder" id="fileholder-image_'+id+'">请选择文件</span>'
			     +   '<span class="btn span2 filebtn action" id="filebtn-image_'+id+'">选择</span>'
			     +   '<span class="btn span2 action filebtnadd">添加</span>'
		    	 + '</div>'
	    		 + '</div>';
	    $(this).parent().parent().parent().append(html);
	    $(this).removeClass('filebtnadd').addClass('filebtnremove').html('移除');
	});
	/**
	 * 移除楼盘图片
	 * @memberOf {TypeName} 
	 */
	$('#projectFormModal').on('click', '.filebtnremove', function(){
		$(this).parent().parent().remove();
	});
	/**
	 * 保存楼盘数据
	 * @return {TypeName} 
	 */
	$('#projectFormModal .submit').click(function(){
		descriptionEditor.sync();
		peripheralEditor.sync();
		trafficEditor.sync();
		$('#projectFormModal form').ajaxSubmit({
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				$('#projectFormModal').modal('toggle');
				var type = $('#type').val();
				$('#project-'+type).load(ctx + '/manage/application/property/projects/type.htm?type='+type+'&_='+new Date().getTime());
			}
		});
	});
	/**
	 * 点击已有楼盘弹出编辑表单
	 * @memberOf {TypeName} 
	 */
	$('#project-list').on('click', '.project .edit', function(){
		$('#projectFormModal .modal-body').html('');
		$('#projectFormModal').modal('toggle');
		$('#projectFormModal .modal-body').load(ctx + '/manage/application/property/project/form.htm?id='+$(this).parent().parent().parent().parent().attr('data-id')+'&_='+new Date().getTime());
	});
	/**
	 * 删除楼盘
	 */
	$('#project-list').on('click', '.project .remove', function(){
		$.ajax({
			url: ctx + '/manage/application/property/project/delete.htm?id='+$(this).parent().parent().parent().parent().attr('data-id'),
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				var type = $('#menulist .on').attr('data-id');
				$('#project-'+type).load(ctx + '/manage/application/property/projects/type.htm?type='+type+'&_='+new Date().getTime());
			}
		});
	});
	
	/**
	 * 保存户型信息
	 * @param {Object} marker
	 */
	$('#projectFormModal').on('click', '#houses .submit', function(){
		$('#houses form').ajaxSubmit({
			dataType: 'json',
			success: function(result){
				if(!result.success){
					alert(result.msg);
					return;
				}
				$('#houses tbody').load(ctx + '/manage/application/property/project/houses.htm?projectId='+$('#id').val()+'&_='+new Date().getTime());
				$('#houses form')[0].reset();
			}
		});
	});
	/**
	 * 编辑户型信息
	 * @param {Object} marker
	 */
	$('#projectFormModal').on('click', '#houses .edit', function(){
		var tds = $(this).parent().parent().parent().find('td');
		var id = $(this).parent().parent().parent().attr('data-id');
		$('#house-id').val(id);
		$('#houseName').val(tds[0].innerHTML);
		$('#houseArea').val(tds[1].innerHTML);
		$('#houseDescription').val(tds[2].innerHTML);
		$('#houseSort').val(tds[3].innerHTML);
	});
});
	function upPoint(marker){
		var geo = new BMap.Geocoder();
		var point = marker.getPosition();
		$('#latitude').val(point.lat);
		$('#longitude').val(point.lng);
		geo.getLocation(point, function(result){
			$('#address').val(result.address);
		});
	}
	//创建和初始化地图函数：
 	function initMap(){
	   	var map = createMap();//创建地图
	    setMapEvent(map);//设置地图事件
	    addMapControl(map);//向地图添加控件
	    var marker = new BMap.Marker(map.getCenter());
	    map.addOverlay(marker);
	    marker.enableDragging();
	    upPoint(marker);
	    marker.addEventListener('dragend', function(){
	    	upPoint(marker);
	    });
	}
	
	
	//创建地图函数：
    function createMap(){
        var map = new BMap.Map("l-map");//在百度地图容器中创建一个地图
        var point = new BMap.Point(100.95416,35.016423);//定义一个中心点坐标
        map.setCenter(point);
        map.centerAndZoom(point,15);//设定地图的中心点和坐标并将地图显示在地图容器中
        return map;
        //window.map = map;//将map变量存储在全局
    }
	
	//地图事件设置函数：
    function setMapEvent(map){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
	
	//地图控件添加函数：
    function addMapControl(map){
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