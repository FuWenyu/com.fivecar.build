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
<title>微信分享</title>
<style type="text/css">
body{ background:#3f4754; color:#FFF; line-height:30px;}
.bj01{
	width: 900px;
	background: url(../images/bj01.png) no-repeat;
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
  <p style="font-size: 36px;" id="prompt">请根据您手机的型号，选择对应版本进行下载安装！</p>
</div>
<br/>
<table width="900" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" width="50%"><a href="javascript:IOSDownload();"><img src="../images/img01.png" width="350" height="404" alt=""/></a></td>
    <td align="center" width="50%"><a href="javascript:AndroidDownload();"><img src="../images/img02.png" width="340" height="402" alt=""/></a></td>
  </tr>
  <tr>
    <td align="center" style="font-size: 36px;">
    	<br><strong>iPhone版</strong><br>
      <br>适用系统：iPhone<br>
    <td align="center" style="font-size: 36px;">
    	<br><strong>Android版</strong><br>
      <br>适用系统：Android4.0.3以上<br>
  </tr>
</table>
</div>
<script type="text/javascript">
function AndroidDownload() {
	window.location="<%=path%>/app/VersionDownLoad.do";
}
function IOSDownload() {
	window.location="http://www.pgyer.com/1Z4t";
}
</script>
</body>
</html>
