<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>五车</title>
<!-- <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css"> -->
<link rel="stylesheet"
	href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div>
		<div class="wc01">
			<img src="${vehicle.url}" width="400" height="195">
		</div>
		<div class="wc02">
			<div class="wc02-01">
				<h3>${vehicle.vehicleName}</h3>
				<a>${vehicle.price}</a>
			</div>
			<div class="wc02-02">
				<div class="wc02-03">
					<a>${dealer.dealerName}[4s]</a> <br> <a>${dealer.addr}</a>
				</div>
				<div class="wc02-03">
					<img id="map" src="images/zc_button_ckdt_default.png" width="60"
						height="60" alt="" /> <a href="tel://${dealer.telephone}"> <img
						src="images/zc_button_lxsj_default.png" width="114" height="114"
						alt="" />
					</a>
				</div>
			</div>
		</div>
		<div id="mapdialog" title="地图">${dealer.position}</div>
		<button id="opener">点击加载更多经销商</button>
		<div class="tc" id="dialog" title="请选择一个经销商">
			<div class="tc_text">
				<c:forEach var="dealerlist" items="${dealerlist}">
					<a href="${url}${dealerlist.id}&vehicleid=${vehicle.id}">${dealerlist.dealerName}</a>
					<br />
				</c:forEach>
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

				<img src="images/zc_icon_h_default.png" alt="" width="38"
					height="38" /> <strong> ${dealer.privilegestile}</strong>
				<p class="t1">${dealer.privileges}</p>
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
	</div>
	<div class="wc05">
		<h3>
			<img src="images/ioci1.png" width="13" height="13" alt="" /> 全系车型
		</h3>
	</div>
	<c:forEach var="modellist" items="${modellist}">
		<div class="wc05_col">
			<h3>${modellist.modelName}</h3>
			<div class="wc05_text">指导价：${modellist.originalprice}</div>
			<div class="wc05_text2">
				优惠参考价：<a>${modellist.discountprice}</a>
			</div>
			<div class="wc05_text3">${modellist.Carabstract}</div>
			<div class="wc05_text4">
				<a href="wc://LoanBuy?id=${modellist.modelid}">全款明细</a>
			</div>
			<div class="wc05_text5">
				<a href="wc://LoanBuy?id=${modellist.modelid}">贷款购车</a>
			</div>
			<span class="InfoContent"><img
				src="images/zc_icon_x_default.jpg" width="20" height="20" alt="" />奥迪车全系85折！</span>
		</div>
	</c:forEach>
	<script src="<%=path%>/js/jquery.min.js"></script>
	<script src="<%=path%>/js/jquery-ui.min.js"></script>
	<!-- 	<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script> -->
	<!-- 	<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script> -->
	<script>
		$("#dialog").dialog({
			autoOpen : false
		});
		$("#opener").click(function() {
			$("#dialog").dialog("open");
		});
		$("#mapdialog").dialog({
			autoOpen : false,
			height : 420,
			width : 590,
			position : 0
		});
		$("#map").click(function() {
			$("#mapdialog").dialog("open");
		});
	</script>

</body>
</html>
