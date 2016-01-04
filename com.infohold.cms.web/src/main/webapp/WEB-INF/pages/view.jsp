<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />  
</head>

<style>body {font: normal 100% Helvetica, Arial, sans-serif;}h1 {font-size: 1.5em;}small {font-size: 0.875em;}img, object { max-width: 100%;}</style>

	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
	<h1>${resources.title}</h1>
	${resources.resource}
	</body>
</html>