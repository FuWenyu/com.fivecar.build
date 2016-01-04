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
		<div id="modal_area"></div>
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="sub_form" action="" method="post">
					<div class="breadcrumb">
						<h4 class="row smaller lighter">贷款申请抵押物信息</h4>
					</div>
					<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="businessid">是否入库</label>
							<div class="col-sm-6 input-group">
								
								<select id="ypzt" class="form-control"  name="ypzt"
								 data-select-list="${ypztList }"  data-emptyoption="true" onblur="changeYpbh()"></select>
							</div>
							
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="dywzl">抵押物种类</label>
							<div class="col-sm-6 input-group">
								<select id="zl" class="form-control"  name="zl" data-emptyoption="true"
								 data-select-list="${dywList }" ></select>
							</div>
							
						</div>
					</div>
				</div>
					<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="dywzl">押品编号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="ypbh" name="ypbh"
								class="form-control" onclick="selectYpList(1);" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							
							<label class="col-sm-4 control-label" for="businessid">业务编号</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="businessid" value="${businessid}" name="businessid"
								class="form-control" readonly="readonly">
								<input type="hidden" id="zydbfs" name="zydbfs" value="3">
								<input type="hidden" id="custid" name="custid" value="${custid}">
								<input type="hidden" id="kyye" name="kyye" value="0">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="pgje">评估金额</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="pgje"  name="pgje"
								class="form-control" >
							</div>
						</div>
					</div>
					<div class="form-group col-sm-6">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="dbje">担保金额</label>
							<div class="col-sm-6 input-group">
								<input type="text" id="dbje"  name="dbje"
								class="form-control" onblur="checkKyye()">
								<input type="hidden" id="dywyprq"  name="dywyprq"
								class="form-control date-picker" data-date-format="yyyy-mm-dd" >
								<input type="hidden" id="dywsl"  name="dywsl" 
								class="form-control" value="1">
							</div>
						</div>
					</div>
				</div>
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm('${businessid}');">
								<i class="icon-ok bigger-110"></i> 提交
							</button>
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="javascript:history.go(-1);">
								<i class="icon-reply bigger-110"></i> 返回
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		</div>
	<jsp:include page="../business/business_yplist.jsp"></jsp:include><!-- 押品信息 -->
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
		jQuery(function($){		
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});});
		jQuery(function($){
			$("#zl").formComponents("select");
		});
		jQuery(function($){
			$("#ypzt").formComponents("select");
		});
	//表单提交
		function subForm(businessid) {
		
			if(document.getElementById("ypzt").value=="1"){
				if (!checkData('ypbh', '业务编号', 'input')) {
					return;
				}
			}
			
			if (!checkData('ypzt', '押品状态', 'input')) {
				return;
			}
			if (!checkData('zl', '抵押物种类', 'input')) {
				return;
			}

			if (!checkData('pgje', '评估金额', 'input')) {
				return;
			}
			if (!checkData('dbje', '担保金额', 'input')) {
				return;
			}
			
			var ypzt=document.getElementById("ypzt").value;
			var pgje=document.getElementById("pgje").value;
			var dbje=document.getElementById("dbje").value;
			var kyye=document.getElementById("kyye").value;

			
			if (parseFloat(document.getElementById("dbje").value)>(parseFloat(document.getElementById("pgje").value))) {
				f_alert("<%=path%>","担保金额大于抵押物评估金额！","");
				return;
			}
			if (parseFloat(document.getElementById("dbje").value)>(parseFloat(document.getElementById("kyye").value))) {
				f_alert("<%=path%>","担保金额大于抵质押可用余额！","");
				return;
			}
			
			
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/businessFsxx_addSave.do",
				data : $("#sub_form").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						f_alert("<%=path%>","success","business_view.do?viewOrEdit=edit&businessid="+businessid);
					}else{
						f_alert("<%=path%>",data.msg,"");
					}
				},
				error : function(msg) {
					var exp="分配出错 " + msg;
					f_alert("<%=path%>",exp,"");
				}
			});
		}
	
	//根据不同状态更新押品编号文本框状态,押品状态为待入库时，不录入押品编号，押品状态为已入库状态时押品编号必输
	function changeYpbh() {
		var ypzt=document.getElementById("ypzt").value;
		if (ypzt=="1") {
			document.getElementById("ypbh").readOnly=false;
		}else{
			document.getElementById("ypbh").readOnly=true;
		}
	}
	//调用押品系统的押品详细信息查询接口获取押品信息，校验担保的可用余额
	function checkKyye() {
		//获得押品状态
		var ypzt=document.getElementById("ypzt").value;
		//校验入库状态的可用余额
		if (ypzt=="1") {
			var ypbh=document.getElementById("ypbh").value;
			var dbje=document.getElementById("dbje").value;
			var businessid=document.getElementById("businessid").value;
			$.ajax( {
				type : "POST",
				url : "<%=path%>/mvc/business_getYpKyye.do?businessid="+businessid+"&xh=0&xh=3&ypbh="+ypbh,
				async : false,
				success : function(kyye) {
					if (parseFloat(dbfe)>parseFloat(kyye)) {
						f_alert("<%=path%>","担保份额"+dbje+"元大于可用余额"+kyye+"元，请重新输入担保份额！","");
						document.getElementById("dbfe").value="";
					}
					
				},
				error : function(msg) {
					alert("获取数据失败: " + msg);
				}
			});
		}
	} 
	</script>
	</body>
</html>
