<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Unicorn Admin</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${ctx}/components/admin/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${ctx}/components/admin/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="${ctx}/components/admin/css/unicorn.login.css" />
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    </head>
    <body>
        <div id="logo">
            <img src="${ctx}/components/admin/img/logo.png" alt="" />
        </div>
        <div id="loginbox">            
            <form id="loginform" class="form-vertical" action="index.html" />
				<p>&nbsp;</p>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-user"></i></span><input type="text" name="username" id="username" placeholder="Username" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-lock"></i></span><input type="password" name="password" id="password" placeholder="Password" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <%--<span class="pull-left"><a href="#" class="flip-link" id="to-recover">Lost password?</a></span>--%>
                    <span class="pull-right"><input type="button" class="btn submit btn-inverse" value="登录" /></span>
                </div>
            </form>
            <form id="recoverform" action="#" class="form-vertical" />
				<p>Enter your e-mail address below and we will send you instructions how to recover a password.</p>
				<div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-envelope"></i></span><input type="text" placeholder="E-mail address" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link" id="to-login">&lt; Back to login</a></span>
                    <span class="pull-right"><input type="submit" class="btn btn-inverse" value="Recover" /></span>
                </div>
            </form>
        </div>
        <script src="${ctx}/components/admin/js/jquery.min.js"></script>  
        <script src="${ctx}/components/admin/js/unicorn.login.js"></script> 
        <script type="text/javascript">
        $(document).ready(function(){
        	$('.submit').click(function(){
        		if(!$('#username').val()){
        			alert('请输入用户名');
        			$('#username').focus();
        			return;
        		}
        		if(!$('#password').val()){
        			alert('请输入登录密码');
        			$('#password').focus();
        			return;
        		}
        		$.ajax({
        			url: '${ctx}/manage/login.htm',
        			data: {
        				username: $('#username').val(),
        				password: $('#password').val()
        			},
        			dataType: 'json',
        			success: function(result){
        				if(!result.success){
        					alert(result.msg);
        					return;
        				}
        				document.location.href = '${ctx}/manage/index.htm'
        			}
        		});
        	});
        });
        </script>
    </body>
</html>
