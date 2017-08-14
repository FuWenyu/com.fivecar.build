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
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/jquery.reveal.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
</head>
<body>
	<header id="header">
<%-- 		<nav id="nav">
			<span class="pleft">1</span> <span class="pright">2</span>
			<h1>${dealer.dealerName}</h1>
		</nav> --%>
		<div id="banner">
			<a href="${vehicle.url}"><img src="${vehicle.url}"></a>
		</div>
		<div class="ziliao clearfix" style="height: 30px;">
			<span class="fl">发布时间：:${vehicle.createDate}</span>
			<!-- <span class="fr">已有888人浏览</span> -->
		</div>
	</header>
	<div class="main">
		<div class="jxs">
			<h2>经销商</h2>
			<div class="jxs-cont clearfix">
				<strong>${dealer.dealerName}</strong> <span class="fl">${dealer.addr}</span><span
					class="fl"><a href="tel://${dealer.telephone}"><img src="images/df001.jpg">${dealer.telephone}</span></a>
				<div class="fr ckdt">
					<img id=map
						src="images/pxjkc_button_qydt_default.png">
				</div>
			</div>
		</div>
		<div class="yhly">
			<h2>优惠礼遇</h2>
			<div class="yhly-cont clearfix">
				<span class="fl spleft"> <strong><i></i>${dealer.privilegestile}</strong>
					<p>${dealer.privileges}</p>
				</span> <span class="fr spright"><a href="${server}${dealer.privilegesurl}">参加</a></span>
			</div>
		</div>
		<div class="xsgw">
			<h2>销售顾问</h2>
			<div class="xsgw-cont clearfix">
				<ul class="clearfix">
					<c:forEach var="saleslist" items="${saleslist}">
						<li><a href="${saleslist.url}"><img src="${saleslist.url}"></a> <span>
								<p>销售顾问：${saleslist.salesName}</p>
								<p>销售车型：${vehicle.vehicleName}</p> <!-- <em><i></i>奥迪车全系85折！</em> -->
						</span><a href="tel://${saleslist.phone}"> <img class="tel"
								src="images/zc_button_bddha_default.png"></a></li>
					</c:forEach>
				</ul>
			</div>
			<!-- 			<div class="xsgwgd">
				<a href="#">点击显示所有销售顾问信息</a>
			</div> -->
		</div>
		<div class="clxxpe">
			<h2>车辆信息配置</h2>
			<div class="clxxpe_col">
				<dl class="clearfix">
					<dt>车辆信息：</dt>
					<dd>${vehicle.vehicleinfo}</dd>
				</dl>
				<dl class="clearfix">
					<dt>车辆版本：</dt>
					<dd>${vehicle.vehicleversionvalue}</dd>
				</dl>
				<dl class="clearfix">
					<dt>预售价格：</dt>
					<dd>${vehicle.price}</dd>
				</dl>
				<dl class="clearfix">
					<dt>所在城市：</dt>
					<dd>${vehicle.whereis}</dd>
				</dl>
				<dl class="clearfix">
					<dt>销售范围：</dt>
					<dd>${vehicle.salesarea}</dd>
				</dl>
				<dl class="clearfix">
					<dt>车辆颜色：</dt>
					<dd>${vehicle.color}</dd>
				</dl>
				<dl class="clearfix">
					<dt>环保标准：</dt>
					<dd>${vehicle.epstandard}</dd>
				</dl>
				<dl class="clearfix">
					<dt>看车地点：</dt>
					<dd>${vehicle.wherelook}</dd>
				</dl>
			</div>
			<h2>车辆详细信息</h2>
			<div class="clxxpe_col">
				<p>${vehicle.description}</p>
			</div>
		</div>
	</div>
	<div id="myModal2">${dealer.position}</div>
	<script>
		$(function() {
			$("#myModal2").dialog({
				autoOpen : false,
				width : 400,
			});

			$("#map").click(function() {
				$("#myModal2").dialog("open");
			});
		});
	</script>
</body>
</html>