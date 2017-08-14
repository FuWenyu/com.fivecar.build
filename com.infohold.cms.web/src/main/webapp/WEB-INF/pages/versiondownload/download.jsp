<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>APP安装</title>
<style type="text/css">
body{ background:#3f4754; color:#FFF; line-height:30px;}
.bj01{
	width: 900px;
	background: url('../images/bj01.png') no-repeat;
	padding-bottom: 80px;
	padding-left: 60px;
	padding-right: 80px;
	padding-top: 80px;
	 }
</style>
</head>

<body>
<div>
<div class="bj01">
  <p style="font-size: 40px;"><strong>温馨提示</strong></p>
  <p style="font-size: 36px;" id="prompt"></p>
</div>
<table width="900" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><a href="javascript:download();"><img src="../images/tb.png" width="288" height="288" alt=""/></a></td>
    </tr>
  <tr>
    <td align="center" style="font-size: 36px;">
    	<h1>智控金服</h1>
      <P>版本：${Android.version_no}
      　更新时间：${Android.version_date}</P>
      <P><a href="javascript:download();"><img src="../images/ani.png" width="496" height="154" alt=""/></P></a></td>
    </tr>
</table>
</div>
<script type="text/javascript">
var browser={
	versions : function() {
		var u = navigator.userAgent;
		var app = navigator.appVersion;
		
		return {
			trident : u.indexOf('Trident') > -1, //IE内核
			presto : u.indexOf('Presto') > -1, //opera内核
			webKit : u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
			gecko : u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
			mobile : !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
			ios : !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
			android : u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
			iPhone : u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
			iPad : u.indexOf('iPad') > -1, //是否为iPad
			webApp : u.indexOf('MicroMessenger') != -1 //是否为微信打开
		};
	}(),
	language : (navigator.browserLanguage || navigator.language).toLowerCase()
}

if(browser.versions.webApp) {
	document.getElementById("prompt").innerHTML = "请点击微信右上角按钮，然后在弹出的菜单中，选择浏览器打开，即可安装！";
}else {
	document.getElementById("prompt").innerHTML = "请点击下面的图标或者按钮进行下载安装！";
}

function download() {
	if(browser.versions.webApp) {
		alert("请点击微信右上角按钮，然后在弹出的菜单中，选择浏览器打开，即可安装！");
	}else {
		window.location.href = ${Android.version_rsv1};
	}
}
</script>
</body>
</html>
