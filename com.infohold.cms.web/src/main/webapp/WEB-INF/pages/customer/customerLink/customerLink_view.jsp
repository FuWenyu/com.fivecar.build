<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<!-- basic styles -->
<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=path%>/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=path%>/css/ace-fonts.css" />
<link rel="stylesheet" href="<%=path%>/css/ace.min.css" />
<link rel="stylesheet" href="<%=path%>/css/ace-rtl.min.css" />
<link rel="stylesheet" href="<%=path%>/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=path%>/css/datepicker.css" />
<link rel="stylesheet" href="<%=path%>/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="<%=path%>/css/daterangepicker.css" />
<link rel="stylesheet" href="<%=path%>/css/jquery-ui-1.10.3.full.min.css" />
<script src="<%=path%>/js/ace-extra.min.js"></script>
</head>
<body id="iframe_body"	onload="setHash('${pageContext.request.contextPath}')">
	<div id="iframeDiv" style="display: none"></div>
	<div class="page-content" id="loadPageContent">
		<form class="form-horizontal" id="sub_form" name="sub_form" action="#"method="post">
			<input type="hidden" id="yrbh"  class="col-xs-10 col-sm-5" name="yrbh" value="${customerLinkEntity.yrbh}" />
			<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
		<!--  基本信息 -->
		<div class="breadcrumb">
						<h4 class="row smaller lighter">客户引入信息</h4>
					</div>
					<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="custid">客户编号：</label>
							<div class="col-sm-6 input-group">
							<label class="control-label" >${customerLinkEntity.custid}</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="custtype">客户类型：</label>
							<div class="col-sm-6 input-group">
							<label class="control-label" >
							<c:if test="${customerLinkEntity.custtype=='1'}">个人客户</c:if>
							<c:if test="${customerLinkEntity.custtype=='2'}">企业客户</c:if>
							</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="custname">引入人编号：</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${customerLinkEntity.yrrbh}</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="yrrmc">引入人名称：</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${yrrmc}</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
					  	<div class="form-group">
							<label class="col-sm-4 control-label" for="yrqsrq">引入起始日期：</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${customerLinkEntity.yrqsrq}</label>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label"
								for="yrdqrq">引入到期日：</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${customerLinkEntity.yrdqrq}</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
					  	<div class="form-group">
							<label class="col-sm-4 control-label" for="yryy">引入原因：</label>
							<div class="col-sm-6 input-group">
								<label class="control-label" >${customerLinkEntity.yryy}</label>
							</div>
						</div>
					</div>
				</div>
		<!-- /row 横线-->
		<div class="clearfix form-actions">
		  <div class="row">
			<div class="form-group col-sm-6"></div>
			<div class="form-group col-sm-6">
				<div class="form-group">
					<button class="btn btn-info"  type="button" onclick="goback()">
						<i class="icon-reply bigger-110"></i> 返回
					</button>
				</div>
			</div>
		</div>
	  </div>
		
	</form>
	</div>
	<div class="page-content" style="height:40px;"> </div>
	<script type="text/javascript">
		window.jQuery|| document.write("<script src='<%=path%>/js/jquery-2.0.3.min.js'>" + "<"+"script>");
	</script>
	<script type="text/javascript">
		var $assets = "assets";//this will be used in fuelux.tree-sampledata.js
	</script>
	<script type="text/javascript">
		if ("ontouchend" in document)
			document.write("<script src='<%=path%>/js/jquery.mobile.custom.min.js'>" + "<"+"script>");
	</script>
	<script src="<%=path%>/js/bootstrap.min.js"></script>
	<script src="<%=path%>/js/typeahead-bs2.min.js"></script>
	<script src="<%=path%>/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="<%=path%>/js/jquery-ui-1.10.3.full.min.js"></script>
	<script src="<%=path%>/js/jquery.ui.touch-punch.min.js"></script>
	<script src="<%=path%>/js/jquery.slimscroll.min.js"></script>
	<script src="<%=path%>/js/jquery.easy-pie-chart.min.js"></script>
	<script src="<%=path%>/js/jquery.sparkline.min.js"></script>
	<script src="<%=path%>/js/flot/jquery.flot.min.js"></script>
	<script src="<%=path%>/js/flot/jquery.flot.pie.min.js"></script>
	<script src="<%=path%>/js/flot/jquery.flot.resize.min.js"></script>
	<script src="<%=path%>/js/ace-elements.min.js"></script>
	<script src="<%=path%>/js/ace.min.js"></script>
	<script src="<%=path%>/js/framework_menu.js"></script>
	<script src="<%=path%>/js/framework_pubFunction.js"></script>
	<script src="<%=path%>/js/fuelux/data/fuelux.tree-sampledata.js"></script>
	<script src="<%=path%>/js/ajaxfileupload.js"></script>
	<script src="<%=path%>/js/fuelux/fuelux.tree.min.js"></script>
	<script src="<%=path%>/js/framework_form.js"></script>
	<script src="<%=path%>/js/framework_modal.js"></script>
	<script src="<%=path%>/js/jquery.maskedinput.min.js"></script>
	<script src="<%=path%>/js/jquery.validate.min.js"></script>
	<script src="<%=path%>/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="<%=path%>/js/date-time/bootstrap-timepicker.min.js"></script>
	<script src="<%=path%>/js/date-time/moment.min.js"></script>
	<script src="<%=path%>/js/date-time/daterangepicker.min.js"></script>
	<script src="<%=path%>/js/bootbox.min.js"></script>
	<script src="<%=path%>/js/bootstrap-wysiwyg.min.js"></script>
	<script src="<%=path%>/js/markdown/markdown.min.js"></script>
	<script src="<%=path%>/js/markdown/bootstrap-markdown.min.js"></script>
	<script src="<%=path%>/js/jquery.hotkeys.min.js"></script>
	<script src="<%=path%>/js/jquery.dataTables.min.js"></script>
	<script src="<%=path%>/js/jquery.dataTables.bootstrap.js"></script>
	<script src="<%=path%>/js/select2.min.js"></script>
	<script src="<%=path%>/js/fuelux/fuelux.wizard.min.js"></script>
	<script src="<%=path%>/js/additional-methods.min.js"></script>
	<script type="text/javascript">
		jQuery(function($) {
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
			
			$('[data-rel=tooltip]').tooltip();
		
			$(".select2").css('width','200px').select2({allowClear:true})
			
			$('#fuelux-wizard').ace_wizard(
			).on('change' , function(e, info){
				
			}).on('finished', function(e) {
				return false;
			}).on('stepclick', function(e){
			});
		
		});
		</script>
	<script type="text/javascript">
		//jQuery获取
		jQuery(function($){		
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});});
		jQuery(function($){
			$("#custtype").formComponents("select");
		});
	function goback(){
		window.location="<%=path%>/mvc/customerLink_getList.do?pageNo="+$("#pageNo").val();
	}
	</script>
</body>
</html>