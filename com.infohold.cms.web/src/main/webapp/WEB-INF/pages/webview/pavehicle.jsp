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
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
<title>五车</title>
<link href="css/pacss.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div>

		<div class="wc08">
<!-- 			<img src="images/zc_button_ckdt_pressed.png" width="114" height="114" -->
<!-- 				alt="" /><img src="images/zc_button_ckdt_pressed.png" width="114" -->
<!-- 				height="114" alt="" /><img src="images/zc_button_ckdt_pressed.png" -->
<!-- 				width="114" height="114" alt="" /> -->
			<img src="${vehicle.url}" width="400" height="195">
		</div>
		<div class="wc07">
			<div class="wc07_text1">发布时间:${vehicle.createDate}</div>
			<!-- <div class="wc07_text2">浏览次数<a>8888</a>次</div> -->
		</div>
		<div class="wc06">
			<h3>
				<img src="images/ioci1.png" width="13" height="13" alt="" /> 经销商
			</h3>
		</div>
		<div style="clear: both"></div>
		<div class="wc06_text">
			<div class="wc06_text_t1">
				<a><strong>${dealer.dealerName}</strong></a><br> <a>${dealer.addr}</a>
			</div>
			<div class="wc06_text_t2">
				<img src="images/df001.jpg" alt="" /><a>${dealer.telephone}</a>
			</div>
			<div class="wc06_text_t3">
				<img src="images/pxjkc_button_qydt_default.png" alt="" />
			</div>
		</div>
	</div>


	<div class="wc03">
		<h3>
			<img src="images/ioci1.png" width="13" height="13" alt="" /> 优惠礼遇
		</h3>
	</div>
	<div style="clear: both"></div>
	<div class="text">
		<div class="ind_data_text">
			<img src="images/zc_icon_h_default.png" alt="" width="38" height="38" /><strong>
				${dealer.privilegestile}</strong>
			<p class="t1"> ${dealer.privileges}</p>
		</div>
		<div class="ind_data_text2">
			<a href="${dealer.privilegesurl}"> <img src="images/an.png"
				alt="" width="80" height="32" />
			</a>
		</div>
	</div>

	<div class="wc04">
		<h3>
			<img src="images/ioci1.png" width="13" height="13" alt="" /> 销售顾问
		</h3>
	</div>
	<div style="clear: both"></div>
	<c:forEach var="saleslist" items="${saleslist}">
			<div style="clear: both"></div>
			<div class="textlist">
				<div>
					<ul>
						<li class="first"><img src="${saleslist.url}" width="86"
							height="81">
							<p class="InfoTime">销售顾问：${saleslist.salesName}</p>
							<p class="InfoTime">销售车型：${vehicle.vehicleName}</p> <span
							class="InfoContent"><img
								src="images/zc_icon_x_default.jpg" width="20" height="20" alt="" />奥迪车全系85折！</span>
						</li>
					</ul>
				</div>
				<div>
					<a href="tel://${saleslist.phone}"> <img
						src="images/zc_button_bddha_default.png" alt="" width="60"
						height="60" class="tw" /></a>
				</div>
				<div style="clear: both"></div>
			</div>
		</c:forEach>
	<div class="wc05">
		<h3>
			<img src="images/ioci1.png" width="13" height="13" alt="" /> 车辆配置信息
		</h3>
	</div>
	<div class="wc05_col">

		<div class="wc05_text3">车辆信息：${vehicle.vehicleinfo}</div>
		<div class="wc05_text3">车辆版本：${vehicle.vehicleversionvalue}</div>
		<div class="wc05_text3">
			预售价格：<a>${vehicle.price}</a>万
		</div>
		<div class="wc05_text3">所在城市：${vehicle.whereis}</div>
		<div class="wc05_text3">销售范围：${vehicle.salesarea}</div>
		<div class="wc05_text3">车辆颜色：${vehicle.color}</div>
		<div class="wc05_text3">环保标准：${vehicle.epstandard}</div>
		<div class="wc05_text3">看车地点：${vehicle.wherelook}</div>
	</div>
	<div class="wc05">
		<h3>
			<img src="images/ioci1.png" width="13" height="13" alt="" />车辆详细信息
		</h3>
	</div>
	<div class="wc06_col">

		<div class="wc05_text3">${vehicle.description}</div>

	</div>
	</div>
</body>
</html>
