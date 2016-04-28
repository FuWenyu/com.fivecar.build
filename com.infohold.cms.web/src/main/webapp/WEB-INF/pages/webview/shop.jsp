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
	<header id="header">
<!-- 		<nav id="nav">
			<span class="pleft">1</span>
			<span class="pright">2</span>
			<h1>大连汽车美容商城</h1>
		</nav> -->
		<div id="banner2"><img src="images/map.jpg"></div>
		<div class="ziliao clearfix">
			<strong>${dealer.dealerName}</strong>
			<span class="fl">${dealer.addr}</span><span class="fr"><a href="tel://${dealer.telephone}"><img src="images/df001.jpg">${dealer.telephone}</a></span>
		</div>
	</header>
	<div class="main">
		<div class="yhly">
			<h2>优惠礼遇</h2>
			<div class="yhly-cont clearfix">
				<span class="fl spleft">
					<strong><i></i>${dealer.privilegestile}</strong>
					<p>${dealer.privileges}</p>
				</span>
				<span class="fr spright"><a href="${dealer.privilegesurl}">参加</a></span>
			</div>
		</div>
		<div class="xsgw">
			<h2>销售顾问</h2>
			<div class="xsgw-cont clearfix">
				<ul class="clearfix">
					<c:forEach var="tpsaleslist" items="${tpsaleslist}">
						<li><img src="images/img1.jpg"> <span>
								<p>销售顾问：${tpsaleslist.salesName}</p>
						</span><a href="tel://${tpsaleslist.phone}"> <img class="tel"
								src="images/zc_button_bddha_default.png"></a></li>
					</c:forEach>
				</ul>
			</div>
			<!-- 			<div class="xsgwgd">
				<a href="#">点击显示所有销售顾问信息</a>
			</div> -->
		</div>
		<div class="qxcx">
			<h2>保养项目</h2>
        	<div class="qxcx_col">
            	<ul class="byxm clearfix">
            		<c:forEach var="resourcelist" items="${resourcelist}">
            		<li class="clearfix">
            			<img src="images/23.jpg">
            			<span class="fl">
            				<strong>${resourcelist.title}</strong>
            				<p>${resourcelist.resourceName}</p>
            				<em>${resourcelist.createDate}</em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!--             				<em><font color="#e4b448;">￥300-800</font></em> -->
            			</span>
            		</li>
					</c:forEach>
            	</ul>
                
        	</div>
		</div>
	</div>
</body>
</html>