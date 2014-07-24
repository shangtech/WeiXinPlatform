<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
				<div class="control-group">
        			<label for="title" class="control-label">背景音乐</label>
        			<div class="controls uploader">
        				<input type="file" id="music" class="span9 auto-upload" data-for="music"/>
        				<input type="hidden" id="music_hidden"/>
        				<div class="input-append span9">
        					<span class="span12 fileholder" id="fileholder-music">请选择文件</span>
        					<span class="btn span2 filebtn action" id="filebtn-music">选择</span>
        				</div>
        			</div>
        		</div>
        		<div class="control-group">
        			<label for="background_image" class="control-label">背景图片</label>
        			<div class="controls uploader">
        				<input type="file" id="background_image" class="span9 auto-upload" data-for="background_image"/>
        				<input type="hidden" id="background_image_hidden"/>
        				<div class="input-append span9">
        					<span class="span12 fileholder" id="fileholder-background_image">请选择文件</span>
        					<span class="btn span2 filebtn action" id="filebtn-background_image">选择</span>
        				</div>
        			</div>
        		</div>
        		<div class="control-group">
			        <label for="image_1" class="control-label">图片</label>
				    <div class="controls uploader">
				    	<div class="row-fluid multifile">
						    <input type="file" id="image_1" class="span9 auto-upload" data-for="image_1"/>
					 		<input type="hidden" id="image_1_hidden"/>
					 		<div class="input-append span9">
						        <span class="span12 fileholder" id="fileholder-image_1">请选择文件</span>
						        <span class="btn span2 filebtn action" id="filebtn-image_1">选择</span>
						        <span class="btn span2 action filebtnadd">添加</span>
					    	</div>
				    	</div>
			     	</div>
			    </div>
			    <script type="text/javascript">
			    $(document).ready(function(){
			    	$('#pageForm .submit').unbind().click(function(){
			    		var music = $('#music_hidden').val();
			    		var images = $('input[id^="image_"][id$="_hidden"]');
			    		var data = music;
			    		var backgroundImage = $('#background_image_hidden').val();
			    		data += ';'+backgroundImage;
			    		for(var i = 0; i < images.length; i++){
			    			var image = $(images[i]).val();
			    			data += ';' + image;
			    		}
			    		data = data.substring(0, data.length);
			    		$('#data').val(data);
			    		submit();
			    	});
			    });
				</script>