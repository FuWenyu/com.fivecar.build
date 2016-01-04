<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<div class="form-horizontal" id="sub_form" >
				<input type="hidden" id="pageNo" name="pageNo"	value="${page.pageNo }" />
					<div class="breadcrumb">
						<h4 class="row smaller lighter">贷款申请信息</h4>
					</div>
					<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="custname">客户名称</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="custchname" name="custchname"  value="${bizBusinessEntity.custname}"  disabled="disabled" 
								class="col-xs-10 col-sm-5 "  >
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="cust_id">客户编号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="cust_id" name="cust_id"  value="${bizBusinessEntity.custid}"  disabled="disabled" 
												class="ol-xs-10 col-sm-5"  >
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="prodcode">贷款产品</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="prodname" placeholder="请输入选择贷款种类"	 
											class="col-xs-10 col-sm-5" name="prodname"  value="${bizBusinessEntity.prodname}" readonly="readonly"/>
							</div>
						</div>
					</div>
					<!--  <div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="isjtkh">是否集团客户</label>
							<div class="col-sm-6 input-group">
								<select id="isjtkh" class="col-xs-10 col-sm-5"  name="isjtkh"
								 			data-select-list="${isJtkhList }" data-select-value="${bizBusinessEntity.isjtkhvalue}" disabled="disabled"></select>
							</div>
						</div>
					</div>-->
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="ccycode">币种</label>
							<div class="col-sm-6 input-group">
								<select id="ccycode" class="col-xs-10 col-sm-5"  name="ccycode"
								 			data-select-list="${ccycodeList }" data-select-value="${bizBusinessEntity.ccycode}" disabled="disabled"></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="amount">金额</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="amount"  
												class="col-xs-10 col-sm-5" name="amount" value="${bizBusinessEntity.amount}" disabled="disabled"/>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- 
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="dkyt">贷款用途</label>
							<div class="col-sm-6 input-group">
								<select id="dkyt" class="col-xs-10 col-sm-5"  name="dkyt"
								 			data-select-list="${dkytList }" data-select-value="${bizBusinessEntity.dkyt}" disabled="disabled"></select>	
							</div>
						</div>
					</div>
					 -->
					 <div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="zydbfs">主要担保方式</label>
							<div class="col-sm-6 input-group">
								<select id="zydbfs" class="col-xs-10 col-sm-5"  name="zydbfs"
								 			data-select-list="${dbList }" data-select-value="${bizBusinessEntity.zydbfsvalue}" disabled="disabled"></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="dkqx">贷款期限</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="dkqx"  
											placeholder="请输入整月数"	class="col-xs-10 col-sm-5" name="dkqx" value="${bizBusinessEntity.dkqx}" disabled="disabled"/>
							</div>
						</div>
					</div>
				</div>
				<!-- 
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="hkfs">还款方式</label>
							<div class="col-sm-6 input-group">
								<select id="hkfs" class="col-xs-10 col-sm-5"  name="hkfs"
								 			data-select-list="${hkfsList }" data-select-value="${bizBusinessEntity.hkfs}" disabled="disabled"></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="zydbfs">主要担保方式</label>
							<div class="col-sm-6 input-group">
								<select id="zydbfs" class="col-xs-10 col-sm-5"  name="zydbfs"
								 			data-select-list="${dbList }" data-select-value="${bizBusinessEntity.zydbfsvalue}" disabled="disabled"></select>
							</div>
						</div>
					</div>
				</div>
				-->
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="xhbz">循环标志</label>
							<div class="col-sm-6 input-group">
								<select id="xhbz" class="col-xs-10 col-sm-5"  name="xhbz"
								 			data-select-list="${xhbzList }" onblur="getLimit()" data-select-value="${bizBusinessEntity.xhbzvalue}" disabled="disabled"></select>							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="gled">关联额度</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="gled"  
											placeholder="请输入关联额度"	class="col-xs-10 col-sm-5" name="gled" value="${bizBusinessEntity.gled}" disabled="disabled"/>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="jzllhqfs">利率获取方式</label>
							<div class="col-sm-6 input-group">
								<select name="jzllhqfs" id="jzllhqfs"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${jzllhqfsList}" data-select-value="${bizBusinessEntity.jzllhqfs}" disabled="disabled"></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="jzllz">基准利率值</label>
							<div class="col-sm-6 input-group">
								<input type="text" 
													class="col-xs-10 col-sm-5" name="jzllz" id="jzllz" value="${bizBusinessEntity.jzllz }" placeholder="请输入利率值（%）" disabled="disabled"/>
							</div>
						</div>
					</div>
				</div>
				<!-- 
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="zxlljsfs">利率计算方式</label>
							<div class="col-sm-6 input-group">
								<select name="zxlljsfs" id="zxlljsfs"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${zxlljsfsList}" data-select-value="${bizBusinessEntity.zxlljsfs}" disabled="disabled"></select>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="zxllbdfs">执行变动系数</label>
							<div class="col-sm-6 input-group">
								<select name="zxllbdfs" id="zxllbdfs"  class="col-xs-10 col-sm-5" data-emptyoption="false" disabled="disabled" data-select-list="${llbdlxList}" data-select-value="${bizBusinessEntity.zxllbdfs}" onchange="get_zxllbdxs()"></select>
											<input type="text" id="zxllbdxs" 
												class="col-xs-10 col-sm-2" name="zxllbdxs"  disabled="disabled"
												value="${bizBusinessEntity.zxllbdxs }"  />
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="zxll">执行利率值</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="zxll" 
												class="col-xs-10 col-sm-5" name="zxll"   disabled="disabled"
												value="${bizBusinessEntity.zxll}" />
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="yqllbdfs">逾期变动系数</label>
							<div class="col-sm-6 input-group">
								<select name="yqllbdfs" id="yqllbdfs"  class="col-xs-10 col-sm-5" data-emptyoption="false" disabled="disabled"  data-select-value="${bizBusinessEntity.yqllbdfs}" data-select-list="${llbdlxList}"  onchange="get_yqllbdxs()"></select>
											<input type="text" id="yqllbdxs" 
												class="col-xs-10 col-sm-2" name="yqllbdxs" disabled="disabled" 
												value="${bizBusinessEntity.yqllbdxs }"   onblur="get_yqllbdxs()"/>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="yqll">逾期利率值</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="yqll"    disabled="disabled"
												class="col-xs-10 col-sm-5" name="yqll" 
												value="${bizBusinessEntity.yqll }" />						
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="nyllbdxs">挪用变动系数</label>
							<div class="col-sm-6 input-group">
								<select name="nyllbdfs" id="nyllbdfs"  class="col-xs-10 col-sm-5"  disabled="disabled" data-emptyoption="false" data-select-value="${bizBusinessEntity.nyllbdfs}" data-select-list="${llbdlxList}"  onchange="get_nyllbdxs()"></select>
											<input type="text" id="nyllbdxs" 
												class="col-xs-10 col-sm-2" name="nyllbdxs"  disabled="disabled"
												value="${bizBusinessEntity.nyllbdxs }"   onblur="get_nyllbdxs()"/>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="nyll">挪用利率值</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="nyll"   
												class="col-xs-10 col-sm-5" name="nyll" 
												value="${bizBusinessEntity.nyll }" disabled="disabled"/>
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="jzllz">利率调整方式</label>
							<div class="col-sm-6 input-group">
								<select name="lltzsj" id="lltzsj"  class="col-xs-10 col-sm-5" disabled="disabled" data-emptyoption="false" data-select-value="${bizBusinessEntity.lltzsj}" data-select-list="${lltzfsList}" ></select>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="flbz">复利标志</label>
							<div class="col-sm-6 input-group">
								<select name="flbz" id="flbz"  class="col-xs-10 col-sm-5" data-emptyoption="false" disabled="disabled" data-select-list="${flbzList}" data-select-value="${bizBusinessEntity.flbz}"></select>
							</div>
						</div>
					</div>
				</div>
				 -->
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="zxlljsfs">经办机构</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="jbjgmc" value="${jbjgmc}" name="jbjgmc" disabled="disabled"
													class="col-xs-10 col-sm-5" >
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="jbkhjlmc">经办客户经理</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="jbkhjlmc" value="${jbkhjlmc}" name="jbkhjlmc" disabled="disabled"
													class="col-xs-10 col-sm-5" >
							</div>
						</div>
					</div>
				</div>
				
					<div class="center">
										<button class="btn btn-sm btn-primary" type="button" onclick="javascript:history.go(-1);">返回</button>
					</div>
					</div>
				</div>
				<jsp:include page="getInterestRate.jsp"></jsp:include>
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
	<!-- PAGE CONTENT ENDS -->
	<script type="text/javascript">
	//jQuery获取
		jQuery(function($) {
			//加载下拉列表
		
		$("#prodcode").formComponents("select");
			$("#isjtkh").formComponents("select");
			$("#ccycode").formComponents("select");
			$("#dkyt").formComponents("select");
			$("#hkfs").formComponents("select");
			$("#zydbfs").formComponents("select");
			$("#xhbz").formComponents("select");
			$("#jzllhqfs").formComponents("select");
			$("#zxlljsfs").formComponents("select");
			$("#zxllbdfs").formComponents("select");
			$("#yqllbdfs").formComponents("select");
			$("#nyllbdfs").formComponents("select");
			$("#lltzsj").formComponents("select");
			$("#flbz").formComponents("select");
			//Date Picker 控件
			$('.date-picker').datepicker({
				autoclose : true
			}).next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
		})
	</script>
	</body>
</html>
