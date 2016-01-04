<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>test</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- SlidesJS Required (if responsive): Sets the page width to the device width. -->
<meta name="viewport" content="width=device-width">
<!-- End SlidesJS Required -->

<script language="javascript" type="text/javascript">
 
 function test(){
	  alert('test')
	 window.parent.document.getElementById("button1tcxt").click();
 }
</script>
</head>
<body onload="test()">
  logout2
</body>
</html>
