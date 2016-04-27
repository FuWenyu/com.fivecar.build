<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html> 
<html lang="zh-CN">
<head> 
	<meta charset="utf-8" /> 
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1, minimum-scale=1, width=device-width, minimal-ui">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black" >
	<meta name="format-detection" content="telphone=no, email=no" >
	<title>大连汽车美容商城</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/jquery.reveal.js"></script>
</head>
<body>
	<header id="header" class="clearfix">
<!-- 		<nav id="nav">
			<span class="pleft">1</span>
			<span class="pright">2</span>
			<h1>大连汽车美容商城</h1>
		</nav> -->
		<div class="ziliao clearfix" style="height:30px;">
			<strong class="zida">${resources.title}</strong></br>
			<span class="fl">发布时间：${resources.createDate}</span><span class="fr">作者：${resources.createName}</span>
		</div>
	</header>
	<div class="main2 ">
		<p>${resources.resource}</p>
	</div>
</body>
</html>