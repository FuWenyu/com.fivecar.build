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
	 
	
	
 }
</script>
</head>
<body onload="test()">
  <% 
	session.invalidate();
response.sendRedirect("http://cas.infohold.com:8080/com.infohold.ecif.cas-server/logout?service=http://myapp.infohold.com:8080/com.infohold.cms.web/logout2.jsp");
	%>
</body>
</html>
