<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<!-- 该页面为iframe嵌套页面，以下代码用于计算iframe高度，不允许修改：
			<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
			<div id="iframeDiv" style="display:none"></div>
			<div class="page-content" id="loadPageContent">
	-->
	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="row">
						<div class="col-xs-6" id="homepage_notice">
							
						</div>
						<div class="col-xs-6">
							<div class="widget-box transparent">
								<div class="widget-header widget-header-flat">
			
									<h4 class="lighter smaller">
										<i class="icon-signal"></i> 数据统计信息
									</h4>
			
									<div class="widget-toolbar">
										<!-- <a href="#" onclick="ToMessList()"> 更多 </a> -->
									</div>
								</div>
								<div class="space-4"></div>
								<div class="row">
									<div class="col-xs-12">
										<div class="widget-body">
											<div class="widget-main no-padding">
												<div class="infobox infobox-blue infobox-dark">
													<div class="infobox-icon">
														<i class="icon-bar-chart"></i>
													</div>
		
													<div class="infobox-data">
														<div class="infobox-content">注册用户数</div>
														<div class="infobox-content"><span class="infobox-data-number">${statistics.efficient_businessCount }</span></div>
													</div>
												</div>
												<div class="infobox infobox-green infobox-dark">
													<div class="infobox-icon">
														<i class="icon-bar-chart"></i>
													</div>
		
													<div class="infobox-data">
														<div class="infobox-content">在线用户数</div>
														<div class="infobox-content"><span class="infobox-data-number">${statistics.settlement_businessCount }</span></div>
													</div>
												</div>
												<div class="infobox infobox-blue infobox-dark">
													<div class="infobox-icon">
														<i class="icon-bar-chart"></i>
													</div>
		
													<div class="infobox-data">
														<div class="infobox-content">在线递交订单数</div>
														<div class="infobox-content"><span class="infobox-data-number">${statistics.hasloan_businessAmount }</span></div>
													</div>
												</div>
												<div class="infobox infobox-green infobox-dark">
													<div class="infobox-icon">
														<i class="icon-bar-chart"></i>
													</div>
		
													<div class="infobox-data">
														<div class="infobox-content">在线订单金额</div>
														<div class="infobox-content"><span class="infobox-data-number">${statistics.settlement_businessAmount }</span></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<!-- /widget-body -->
							</div>
						</div>
					</div>
					<div class="hr hr15 hr-dotted"></div>
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box transparent">
								<div class="widget-header widget-header-flat">
			
									<h4 class="lighter smaller">
										<i class="icon-beaker"></i> 快捷服务
									</h4>
			
									<div class="widget-toolbar">
										<!-- <a href="#" onclick="ToMessList()"> 更多 </a> -->
									</div>
								</div>
								<div class="space-4"></div>
								<div class="row">
									<div class="col-xs-12">
										<div class="widget-body">
									<div class="widget-body-inner" style="display: block;">
										<div class="widget-main no-padding">
											<div class="clearfix">
												<ul class="nav nav-pills">
													<c:forEach items="${shortCut}" var="shortCut">
														<c:if test="${shortCut.url != '#' }">
															<li role="presentation"><a href="#" onclick="toPage('${shortCut.url}');"><h5>${shortCut.name}</h5></a></li>
														</c:if>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
									</div>
									</div>
									
								</div>
								
								<!-- /widget-body -->
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="widget-box transparent">
								<div class="widget-header">
									<h4 class="lighter smaller">
										<i class="icon-exclamation-sign orange"></i>
										业务提醒
									</h4>
			
									<div class="widget-toolbar no-border">
										
									</div>
								</div>
								<div class="space-4"></div>
								<div class="row">
									<div class="col-xs-12">
										<div class="widget-body">
									<div class="widget-body-inner" style="display: block;">
										<div class="widget-main no-padding">
											<div class="clearfix">
												<ul class="nav nav-pills">
												  <li role="presentation"><a href="#" onclick="toPage('remind_approve.do');"><h5>审批提醒</h5></a></li>
												</ul>
											</div>
										</div><!-- /widget-main -->
									</div>
									</div><!-- /widget-body -->
									</div>
									
								</div>
								
								<!-- /widget-body -->
							</div>
						</div>
					</div>
					<!-- PAGE CONTENT ENDS -->
				</div>
			</div>
		</div>
	<!-- 大号模态块 -->
<div class="modal fade bs-example-modal-lg" id="myModalQuery"
	tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" onclick="hideModal();"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="myLargeModalLabel">公告</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="sub_form" action="#" method="post">
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">标题</label>

						<div class="col-sm-9">
							<input type="text" id="message_title_modail"
								class="col-xs-10 col-sm-5" 
								name="message_title_modail" disabled/>
						</div>
					</div>

					<div class="space-6"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right"
							for="user_account">内容</label>
						<div class="col-sm-9">
							<textarea rows="15" cols="29" name="message_context_modail"
								id="message_context_modail"  disabled></textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-default" onclick="hideModal();">关闭</button>
			</div>
		</div>
	</div>
</div>


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
	<script src="<%=path%>/js/fuelux/data/fuelux.tree-sampledata.js"></script>
	<script src="<%=path%>/js/ajaxfileupload.js"></script>
	<script src="<%=path%>/js/fuelux/fuelux.tree.min.js"></script>
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
	<script src="<%=path%>/js/framework_menu.js"></script>
	<script src="<%=path%>/js/framework_pubFunction.js"></script>
	<script src="<%=path%>/js/framework_form.js"></script>
	<script src="<%=path%>/js/framework_modal.js"></script>

<script type="text/javascript">
	/* jQuery(function($) {
		param={};
		$.post("homePage_notice.do", param, function(result) {			
			$("#homepage_notice").html(result).hide();
			$("#homepage_notice").fadeIn('fast');
			setHash('${pageContext.request.contextPath}');
		});
	}); */

	function showNotice(id_) {
		var param = {};
		param["id_"] = id_;
		$.ajax({
			type : "POST",
			url : "<%=path %>/mvc/homePage_getNotice.do",
			data : param,
			async : false,
			success : function(data) {
				//$("#myModalQuery").modal("show");
				showModal($("#myModalQuery"));
				$(window.parent.document).find("#message_title_modail").val(data.title);
				$(window.parent.document).find("#message_context_modail").val(data.content);
				//$("#message_title_modail").val(data.title);
				//$("#message_context_modail").val(data.content);
			},
			error : function(msg) {
				alert("查询出错" + msg);
			}
		});
	}

	//查看待领取任务详情
	function qryDetails_todo(biz_id, task_id, biz_code) {
		var param = {};
		param["biz_id"] = biz_id;
		param["task_id"] = task_id;
		param["show_type"] = 1;
		if (biz_code == 10002) {
			ajaxLoadPage("#loadPageContent", "lpr_taskdetail.do", param);
		}
		//土地贷款审批详细页面
		else {
			ajaxLoadPage("#loadPageContent", "bus_mytaskdetails1.do", param);
		}
	}
	//查看待处理任务详情
	function qryDetails(biz_id, task_id, biz_code) {
		var param = {};
		param["biz_id"] = biz_id;
		param["biz_code"] = biz_code;
		param["task_id"] = task_id;
		param["show_type"] = 2;
		//土地证回转详细审批页面
		if (biz_code == 10002) {
			//lpr_mytaskdetails.do
			ajaxLoadPage("#loadPageContent", "lpr_mytaskdetails.do", param);

		}
		//土地贷款审批详细页面
		else {

			ajaxLoadPage("#loadPageContent", "bus_mytaskdetails.do", param);
		}
	}
	//任务领取
	function toDraw(task_id) {
		$.ajax({
			type : "POST",
			url : "lpr_receivrTask.do?task_id=" + task_id,
			async : false,
			success : function(data) {
				alert("任务领取成功");
				toHomePage();
				//staf_exeLits();
			},
			error : function(msg) {
				alert("保存出错  " + msg);
			}
		});
	}
	
	function qryoverdue(){
		var param = {};
		ajaxLoadPage("#loadPageContent", "qryoverdue.do", param);
		
	}
	//逾期提醒查看贷款详情
	function getDuebill(id){
		var param = {};
		param["type"] = "getDuebill";
		param["id"] = id;
		
		
		 $.ajax({
			type : "POST",
			url : "wqinfo_getModel.do",
			//contentType : "application/json",
			data : param,
			dataType:'json',
			async : false,
			success : function(msg) {
				if(msg.err_code!=null){
					alert(msg.err_code);
				}else{
					$("#myModal_loaninfo").modal("show");
					$("#myModal_loaninfo input[name='duebill_id']").val(msg.loanInfoListEntity.duebill_no);
					$("#myModal_loaninfo input[name='apply_amt']").val(msg.loanInfoListEntity.apply_amt);
					$("#myModal_loaninfo input[name='farmer_name']").val(msg.loanInfoListEntity.farmer_name);
					$("#myModal_loaninfo input[name='id_no']").val(msg.loanInfoListEntity.id_no);
					$("#myModal_loaninfo input[name='disbursementDate']").val(msg.loanInfoListEntity.disbursementDate);
					$("#myModal_loaninfo input[name='maturityDate']").val(msg.loanInfoListEntity.maturityDate);
				}
			}
		}); 
	};
	function toPage(url) {
		var address = "<%=path%>/mvc/"+url;
		window.location=address;
	}
</script>

