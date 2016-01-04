<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<%
    	String sub_portal_url=(String)request.getParameter("sub_portal_url");
    	System.out.println(sub_portal_url);
    	%>
</head>
<script>
    function invoke(){
        document.getElementById('myfarme').src="<%=sub_portal_url%>?content="+encodeURI("");
    }
    
   // invoke();
</script>
<body onLoad="invoke()">
<iframe id="myfarme" src="###" width='0' height='0'> </iframe>

</body>
</html>