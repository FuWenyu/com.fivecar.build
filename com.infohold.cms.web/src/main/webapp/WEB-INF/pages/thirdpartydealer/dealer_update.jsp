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
				<form class="form-horizontal" id="sub_form" action="<%=path%>/mvc/version_editSave.do"
					method="post">
					<h3 class="header smaller lighter grey">图片信息修改</h3>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id"> </label>
					</div>
					<input id="tpdealer_id" type="hidden" class="" name="tpdealer_id" value="${tpdealer.id}" />
					<input id="resource" type="hidden" class="" name="resource" value="${tpdealer.resourceid}-${tpdealer.privilegestile}-${tpdealer.privileges}" />
						<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">经营项目</label>
							<div class="col-sm-9">	
								<div class="checkbox">
									<input name="thirdparty_type_check"	id="thirdparty_type_check" type="hidden" value="${tpdealer.thirdparty_type }"/>
									<label><input name="thirdparty_type"	id="thirdparty_type" type="checkbox" class="ace"
										value="1"><span class="lbl">保养</span></label>
									<label><input name="thirdparty_type" id="thirdparty_type" type="checkbox" class="ace" 
									    value="2"><span class="lbl">维修</span></label>
									 <label><input name="thirdparty_type" id="thirdparty_type" type="checkbox" class="ace" 
									 	value="3"><span class="lbl">配件</span></label>
									 <label><input name="thirdparty_type" id="thirdparty_type" type="checkbox" class="ace" 
									 	value="4"><span class="lbl">金融</span></label>
								</div>
							</div>
						</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							4s店全名 </label>
						<div class="col-sm-9">
							<input type="text" id="tpdealerName" name="tpdealerName" placeholder="请输入4s店全名 "
								class="col-xs-10 col-sm-5"
								value="${tpdealer.dealerName}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							联系电话</label>
						
						<div class="col-sm-9">
							<input type="text" id="telephone" name="telephone" placeholder="请输入联系电话 "
								class="col-xs-10 col-sm-5"
								value="${tpdealer.telephone}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							4s店地址</label>
						
						<div class="col-sm-9">
							<input type="text" id="addr" name="addr" placeholder="请输入4s店地址 "
								class="col-xs-10 col-sm-5"
								value="${tpdealer.addr}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name">
							4s店简介 </label>
						<div class="col-sm-9">
							<input type="text" id=description placeholder="请输入4s店简介"
								class="col-xs-10 col-sm-5" name="description" value="${tpdealer.description}" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name">
							五车专享特权</label>
						<div class="col-sm-9">
						<select class="input-medium"  id="anchor" name="anchor">
							<c:forEach items="${resourcesList}" var="list" varStatus="status">
	                        <option value="${list.id}-${list.title}-${list.resourceName}">${list.resourceName }</option>
	               		    </c:forEach>
               		    </select>
               		    </div>
					</div>
					
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 提交
							</button>
		
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="javascript:window.location = '<%=path%>/mvc/tpdealer.do';">
								<i class="icon-reply bigger-110"></i> 返回
							</button>
						</div>
					</div>
				</form>
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
		/*********页面加载区域**********/
		jQuery(function($) {
			var resource = document.getElementById('resource').value;
			checkOption('anchor',resource);
			
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
		});
		jQuery(function($){
			var thirdparty_type=$("#thirdparty_type_check").val().split(",");
			for(var i=0;i<thirdparty_type.length;i++){
				$('[name="thirdparty_type"]:checkbox').each(function(){if(this.value==thirdparty_type[i]){this.checked=true;}});
			}
		});
		/*********自定于方法**********/
		//表单提交
		function subForm() {
			
			if (!checkData('anchor', '五车专享特权', 'input')) {
				return;
			}
			
			if (!checkData('tpdealerName', '4s店全名', 'input')) {
				return;
			}
			if (!checkData('tpdealerName', '4s店全名', 'illegal')) {
				return;
			}
			if (!limitCheck('tpdealerName', '4s店全名', 64)) {
				return;
			}
			
			if (!checkData('telephone', '联系电话', 'input')) {
				return;
			}
			if (!checkData('telephone', '联系电话', 'number')) {
				return;
			}
			if (!limitCheck('telephone', '联系电话', 11)) {
				return;
			}
			
			if (!checkData('addr', '4s店地址 ', 'input')) {
				return;
			}
			if (!checkData('description', '4s店简介 ', 'input')) {
				return;
			}
			param = {};
			param["thirdparty_type"]=$("input[name='thirdparty_type']:checked").serialize();
			param["tpdealer_id"]=$("#tpdealer_id").val();
			param["tpdealerName"]=$("#tpdealerName").val();
			param["telephone"]=$("#telephone").val();
			param["addr"]=$("#addr").val();
			param["description"]=$("#description").val();
			param["anchor"]=$("#anchor").val();
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/tpdealer_editSave.do",
				data : param,
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						alert("保存成功！");
						window.location = "<%=path%>/mvc/tpdealer.do";
					}else{
						alert("保存失败:"+data.msg);
					}
				},
				error : function(msg) {
					alert("分配出错  " + msg.msg);
				}
			});
		}
		function checkOption(id,value)
		{
			var select = document.getElementById(id);
			var options = select.options;
			for(var i= 0;i<options.length;i++)
			{
				if(options[i].value == value)
				{
					options[i].selected = true;
					break;
				}
			}
		}
	</script>
	</body>
</html>
