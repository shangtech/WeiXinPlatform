<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="x-ua-compatible" content="ie=7" />
	<title>360全景展示|720全景拍摄|三维全景制作|虚拟全景漫游|全景视频|全景摄影</title>
	<link href="css/comstyle.css" rel="stylesheet" type="text/css" />
	<link href="css/swf.css" rel="stylesheet" type="text/css" />
	<script src="js/index.js" type="text/javascript"></script>
</head>
<body>
	<div id="header">
		<!--head-->
		<div class="main02" id="head">
			<%-- 
			<div class="logo">
				<a href="http://www.ddmer.com/"><img src="http://www.ddmer.com/images/logo.jpg" alt="丁丁猫" title="丁丁猫" /></a>
			</div>
			<div class="right">
				<a href="http://www.ddmer.com/gg/index.html" target="_blank"><img src="http://www.ddmer.com/images/zxyh.gif" /></a>
			</div>
			--%>
			<!--daohang-->
			<div class="nav">
				<ul>
					<li><a href="index.htm">首页</a></li>
					<li>&nbsp;<span>|</span>&nbsp;<a href="aboutus.htm">关于我们</a></li>
				</ul>
			</div>
			<!--end daohang-->
		</div>
		<!--end head-->
	</div>
	<div id="main" class="main">
		<div id="sidenav">
			<div id="flash">
				<div id="flash_nei">
					<div id="pano" style="width: auto; height: 100%;">
						<noscript>
							<table style="width: 100%; height: 100%;">
								<tr style="valign: middle;">
									<td><div style="text-align: center;">
											ERROR:<br />
											<br />Javascript not activated<br />
											<br />
										</div></td>
								</tr>
							</table>
						</noscript>
						<script>
							embedpano({
								swf : "flash/index.swf",
								target : "pano",
								html5 : "auto",
								passQueryParameters : true
							});
						</script>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!--foot-->
</body>
</html>
