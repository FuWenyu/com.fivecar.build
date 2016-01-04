<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<body>
	<jsp:include page="head.jsp"></jsp:include>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed');
			} catch (e) {
				
			}
		</script>
		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>
			<div class="sidebar" id="sidebar">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed');}catch(e){}
				</script>
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="icon-signal"></i>
						</button>
			
						<button class="btn btn-info">
							<i class="icon-pencil"></i>
						</button>
			
						<button class="btn btn-warning">
							<i class="icon-group"></i>
						</button>
			
						<button class="btn btn-danger">
							<i class="icon-cogs"></i>
						</button>
					</div>
			
					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span> <span class="btn btn-info"></span>
			
						<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
					</div>
				</div>
				<!-- #sidebar-shortcuts -->
			
				<ul class="nav nav-list" id="menuTree">
			
			
				</ul>
				<!-- /.nav-list -->
			
				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
						data-icon2="icon-double-angle-right"></i>
				</div>
			
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed');}catch(e){}
				</script>
			</div>
			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>

					<ul class="breadcrumb" id="breadCrumb">
						<li><i class="icon-home home-icon"></i><a href="#" onclick="javascript:ajaxMenuLoadPage('#loadPageContent','<%=path%>/mvc/homePage.do');">首页</a></li>
					</ul>
					<!-- .breadcrumb -->

					<!-- <div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon"> <input type="text"
								placeholder="Search ..." class="nav-search-input"
								id="nav-search-input" autocomplete="off" /> <i
								class="icon-search nav-search-icon"></i>
							</span>
						</form>
					</div> -->
					<!-- #nav-search -->
				</div>
				<iframe id="loadMainContent" name="loadMainContent" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" width="100%" height="800" src="<%=path %>/mvc/homePage.do"></iframe>
				<!-- /.page-content -->
			</div>
			<!-- /.main-content -->

			<!-- /#ace-settings-container -->
		</div>
		<!-- /.main-container-inner -->

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="icon-double-angle-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->
	<div id="modal_area"></div>
</body>
<script type="text/javascript">
			jQuery(function($) {
				
			});
			function callBackfunction(obj){
				loadMainContent.window.CallBackSubmit(obj);
			}
			
			function callBackfunction1(obj){
				loadMainContent.window.CallBackSubmit1(obj);
			}
			
			function callBackfunction2(obj){
				loadMainContent.window.CallBackSubmit2(obj);
			}
</script>
</html>

