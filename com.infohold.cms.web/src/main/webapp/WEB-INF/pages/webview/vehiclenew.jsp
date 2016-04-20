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
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1, minimum-scale=1, width=device-width, minimal-ui">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telphone=no, email=no">
<title>首页</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/jquery.reveal.js"></script>
</head>
<body>
	<header id="header">
		<!-- 		<nav id="nav">
 			<span class="pleft"></span>
			<span class="pright"></span>
			<h1>标题标题标题</h1> 
		</nav> -->
		<div id="banner">
			<img src="${server}${vehicle.url}">
		</div>
		<div class="slide clearfix">
			<div class="slide-left fl">
				<strong>${vehicle.vehicleName}<span>${vehicle.price}万</span></strong>
			</div>
			<div class="slide-right fl">
				<span class=""><p>${dealer.dealerName}[4s]</p><p>${dealer.addr}</p></span>
				<ul class="lianxi clearfix">
					<li><a href="#" data-reveal-id="myModal2"
						data-animation="fade"><img
							src="images/zc_button_ckdt_pressed.png"></a></li>
					<li><a href="tel://${dealer.telephone}"><img
							src="images/zc_button_lxsj_pressed.png"></a></li>
				</ul>
			</div>
		</div>
		<div class="xzgd">
			<a href="#" data-reveal-id="myModal">点击选择更多经销商</a>
		</div>
	</header>
	<div class="main">
		<div class="yhly">
			<h2>优惠礼遇</h2>
			<div class="yhly-cont clearfix">
				<span class="fl spleft"> <strong><i></i>${dealer.privilegestile}</strong>
					<p>${dealer.privileges}</p>
				</span> <span class="fr spright"><a
					href="${server}${dealer.privilegesurl}">参加</a></span>
			</div>
		</div>
		<div class="xsgw">
			<h2>销售顾问</h2>
			<div class="xsgw-cont clearfix">
				<ul class="clearfix">
					<c:forEach var="saleslist" items="${saleslist}">
						<li><img src="${server}${saleslist.url}"> <span>
								<p>销售顾问：${saleslist.salesName}</p>
								<p>销售车型：${vehicle.vehicleName}</p> <em><i></i>${dealer.privilegestile}</em>
						</span><a href="tel://${saleslist.phone}"> <img class="tel" src="images/zc_button_bddha_default.png"></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="qxcx">
			<h2>全系车型</h2>
			<div class="qxcx_col">
				<c:forEach var="modellist" items="${modellist}">
				<dl class="clearfix">
					<dt class="clearfix">
						<strong>${modellist.modelName}</strong>
					</dt>
					<dd class="clearfix ">
						<span class="fl text1">指导价：${modellist.originalprice}</span><span class="fr text2">优惠参考价：<i>${modellist.discountprice}</i>万
						</span>
					</dd>
					<dd>${modellist.Carabstract}</dd>
					<dd>
						<a href="wc://FullBuy?id=${modellist.modelid}"><span class="fl text4">全款明细</span></a><a href="wc://LoanBuy?id=${modellist.modelid}"> <span class="fr text5">贷款购车</span></a>
					</dd>
				</dl>
					</c:forEach>
			</div>
		</div>

	</div>
	<div id="myModal" class="reveal-modal">
		<ul class="xzgdul clearfix">
			<c:forEach var="dealerlist" items="${dealerlist}">
				<li><a href="${url}${dealerlist.id}&vehicleid=${vehicle.id}"><span>点击选择</span>${dealerlist.dealerName}</a></li>
				<br />
			</c:forEach>
		</ul>
		<a class="close-reveal-modal">返回</a>
	</div>
	<div id="myModal2" class="reveal-modal">
		${dealer.position} <a class="close-reveal-modal">返回</a>
	</div>
</body>
</html>