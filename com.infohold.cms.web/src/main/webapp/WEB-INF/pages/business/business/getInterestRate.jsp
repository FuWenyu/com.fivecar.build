<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>新信贷管理系统</title>
<meta charset="utf-8" />
<style>
.abc, select {
	border-radius: 0;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	color: #858585;
	background-color: #fff;
	border: 1px solid #d5d5d5
}
</style>
</head>
<body>
	<script type="text/javascript">
//获取执行利率
function get_zxllbdxs(){
	var jzll = document.getElementById("jzllz").value;//基准利率
	var zxllbdxs = document.getElementById("zxllbdxs").value;//执行利率变动系数
	var zxllbdfs = document.getElementById("zxllbdfs").value;//执行利率变动方式
	if((jzll!=null&&jzll!="")&&(zxllbdxs!=null&&zxllbdxs!="")&&(zxllbdfs!=null&&zxllbdfs!="")){
		if(zxllbdfs=="P"){
			var jzll=parseFloat(jzll);
			zxll= parseFloat(jzll+(jzll*(zxllbdxs/100))).toFixed(5);
			document.getElementById("zxll").value=zxll;
		}else{
			var jzll=parseFloat(jzll);
			var zxllbdxs=parseFloat(zxllbdxs);
			zxll= parseFloat(jzll+zxllbdxs).toFixed(5);
			document.getElementById("zxll").value=zxll;
		}
		
	get_yqllbdxs();
	get_nyllbdxs();
	}else{
		document.getElementById("zxll").value='';
	}
}
//获取逾期利率
function get_yqllbdxs(){
	var zxll = document.getElementById("zxll").value;//执行利率
	var yqllbdxs = document.getElementById("yqllbdxs").value;//逾期利率变动系数
	var yqllbdfs = document.getElementById("yqllbdfs").value;//逾期利率变动方式

	if((zxll!=null&&zxll!="")&&(yqllbdxs!=null&&yqllbdxs!="")&&(yqllbdfs!=null&&yqllbdfs!="")){
		
		if(yqllbdfs=="P"){
			
			var zxll=parseFloat(zxll);
			yqll= parseFloat(zxll+(zxll*(yqllbdxs/100))).toFixed(5);
			document.getElementById("yqll").value=yqll;
		}else{
		
			var zxll=parseFloat(zxll);
			var yqllbdxs=parseFloat(yqllbdxs);
			
			yqll= parseFloat(zxll+yqllbdxs).toFixed(5);
			
			document.getElementById("yqll").value=yqll;
		}
		
	}else{
		document.getElementById("yqll").value='';
	}	
}

//获取挪用利率
function get_nyllbdxs(){
	var zxll = document.getElementById("zxll").value;//执行利率
	var nyllbdxs = document.getElementById("nyllbdxs").value;//挪用利率变动系数
	var nyllbdfs = document.getElementById("nyllbdfs").value;//挪用利率变动方式
	if((zxll!=null&&zxll!="")&&(nyllbdxs!=null&&nyllbdxs!="")&&(nyllbdfs!=null&&nyllbdfs!="")){
	
		if(nyllbdfs=="P"){
			
			var zxll=parseFloat(zxll);
			nyll= parseFloat(zxll+(zxll*(nyllbdxs/100))).toFixed(5);
			document.getElementById("nyll").value=nyll;
		}else{
		
			var zxll=parseFloat(zxll);
			var nyllbdxs=parseFloat(nyllbdxs);
			
			nyll= parseFloat(zxll+nyllbdxs).toFixed(5);
		
			document.getElementById("nyll").value=nyll;
		}
		
	}else{
		document.getElementById("nyll").value='';
	}	
}

function getjzll() {
	var dkqx=document.getElementById("dkqx").value;
	var jzllhqfs=document.getElementById("jzllhqfs").value;
	if (jzllhqfs=="2") {
		document.getElementById("jzllz").readOnly=false;
		document.getElementById("jzllz").value=null;
	} else {
		$.ajax( {
			type : "POST",
			url : "<%=path%>/mvc/getjzll.do?dkqx="+dkqx,
			async : false,
			success : function(obj) {
				var jzllz=obj[0];//结果信息	
				document.getElementById("jzllz").value=jzllz;
			},
			error : function(msg) {
				alert("获取数据失败: " + msg);
			}
		});
	}
	
}
</script>