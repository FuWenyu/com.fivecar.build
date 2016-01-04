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
	 /*var zz =<%=request.getParameter("bsessionid")%>
	 */
	 alert('zz')
	 window.parent.getElementById("button1").click();
 }
</script>
</head>
<body onload="test()">
<div style="height:98%" >
<%--  a.jsp
 <input type="text" name="a1" value="${bsessionid}" /> --%>
 
 <div  id="login">
			<form id="fm1" class="fm-v clearfix" action="https://cas.infohold.com:8443/com.infohold.ecif.cas-server/login;jsessionid=7808A53093851586C054DE5449EA2D7E?service=http%3A%2F%2Fmyapp.infohold.com%3A8088%2Ftest%2Fcas%2Fa.html" method="post">
                  
                <!-- 欢迎来到中央认证系统。默认的认证处理器支持那些用户名等于密码的账号，开发者可以试试看。 -->
                    <h2>请输入您的用户名和密码.</h2>
                    <div class="row fl-controls-left">
                        <label for="username" class="fl-label">用户名:</label>
						

						
						
						<input id="username" name="username" class="required" tabindex="1" accesskey="n" type="text" value="" size="25" autocomplete="false">
						
                    </div>
                    <div class="row fl-controls-left">
                        <label for="password" class="fl-label">密　码:</label>
						
						
						<input id="password" name="password" class="required" tabindex="2" accesskey="p" type="password" value="" size="25" autocomplete="off">
                    </div>
                    <div class="row check">
                        <input id="warn" name="warn" value="true" tabindex="3" accesskey="w" type="checkbox">
                        <label for="warn">转向其他站点前提示我。</label>
                    </div>
                    <div class="row btn-row">
						<input type="hidden" name="lt" value="LT-34-9CgeuOTCYyfYRQEqESsCgts7QqWZWj">
						<input type="hidden" name="execution" value="e1s1">
						<input type="hidden" name="_eventId" value="submit">

                        <input class="btn-submit" name="submit" accesskey="l" value="登录" tabindex="4" type="submit">
                        <input class="btn-reset" name="reset" accesskey="c" value="重置" tabindex="5" type="reset">
                    </div>
            </form>
          </div>
  </div> 
</body>
</html>
