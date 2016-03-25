<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/commonList.jsp"></jsp:include><!-- 引入公供js -->
	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="sub_form" action="<%=path%>/mvc/loan_save.do"
					method="post">
					<h3 class="header smaller lighter grey">贷款信息新增</h3>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id"> </label>
					</div>
					<input id=modelid type="hidden" class="" name="modelid" value="${modelid}" />
					<input id=modelName type="hidden" class="" name="modelName" value="${modelName}" />
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							车型 </label>
						<div class="col-sm-9">
							<input type="text" id="modelName1" name="modelName1" placeholder=" "
								class="col-xs-10 col-sm-5" disabled="disabled"
								value="${modelName}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							金融机构</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="lender" name="lender">
							<c:forEach items="${lenderList}" var="list" varStatus="status">
	                        <option value="${list.id}-${list.lenderName}-${list.url}">${list.lenderName}</option>
	               		    </c:forEach>
               		    </select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							裸车价格 </label>
						<div class="col-sm-9">
							<input type="text" id="carprice" name="carprice" placeholder="请输入裸车价格 "
								class="col-xs-10 col-sm-5"
								value="" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							首付金额</label>
						<div class="col-sm-9">
							<input type="text" id="downpayment" name="downpayment" placeholder="请输入首付金额 "
								class="col-xs-10 col-sm-5"
								value="" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							首付百分比</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="downPaymentPercent" name="downPaymentPercent">
                                <option value="">-请选择-</option> 
								<option value="10%">10%</option>
								<option value="20%">20%</option>
								<option value="30%">30%</option>
								<option value="40%">40%</option>
								<option value="50%">50%</option>
								<option value="60%">60%</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							额外费用</label>
						<div class="col-sm-9">
							<input type="text" id="premium" name="premium" placeholder="请输入额外费用 "
								class="col-xs-10 col-sm-5"
								value="" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							12期每期金额</label>
						<div class="col-sm-9">
							<input type="text" id="loan12" name="loan12" placeholder="请输入12期每期金额 "
								class="col-xs-10 col-sm-5"
								value="" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							24期每期金额</label>
						<div class="col-sm-9">
							<input type="text" id="loan24" name="loan24" placeholder="请输入24期每期金额"
								class="col-xs-10 col-sm-5"
								value="" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							36期每期金额</label>
						<div class="col-sm-9">
							<input type="text" id="loan36" name="loan36" placeholder="请输入36期每期金额 "
								class="col-xs-10 col-sm-5"
								value="" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							48期每期金额</label>
						<div class="col-sm-9">
							<input type="text" id="loan48" name="loan48" placeholder="请输入48期每期金额 "
								class="col-xs-10 col-sm-5"
								value="" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 提交
							</button>
		
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="goBack('${modelid}-${modelName}');">
								<i class="icon-reply bigger-110"></i> 返回
							</button>
						</div>
					</div>
				</form>
				<!-- PAGE CONTENT ENDS -->
				</div>
			</div>
		</div>
	
	<script type="text/javascript">
	
	
	jQuery(function($) {
		
		//上传文件控件
		$('#fileInput').ace_file_input({
			no_file:'空...',
			btn_choose:'选择',
			btn_change:'更改',
			droppable:false,
			onchange:null,
			thumbnail:false
		});
		
		
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		});
	});
	
	function pictureupload(){
		
	}
	
	function subForm(){
		if (!checkData('lender', '金融机构', 'input')) {
			return;
		}
		
		if (!checkData('carprice', '裸车价格', 'input')) {
			return;
		}
		if (!limitCheck('carprice', '裸车价格', 12)) {
			return;
		}
		if (!checkData('carprice', '裸车价格', 'number')) {
			return;
		}
		
		
		if (!checkData('downpayment', '首付金额', 'input')) {
			return;
		}
		if (!limitCheck('downpayment', '首付金额', 12)) {
			return;
		}
		if (!checkData('downpayment', '首付金额', 'number')) {
			return;
		}
		
		if (!checkData('downPaymentPercent', '首付百分比', 'input')) {
			return;
		}
		
		if (!checkData('premium', '额外费用', 'input')) {
			return;
		}
		if (!limitCheck('premium', '额外费用', 12)) {
			return;
		}
		if (!checkData('premium', '额外费用', 'number')) {
			return;
		}
		
		
		if (!checkData('loan12', '12期每期金额', 'input')) {
			return;
		}
		if (!limitCheck('loan12', '12期每期金额', 12)) {
			return;
		}
		if (!checkData('loan12', '12期每期金额', 'number')) {
			return;
		}
		
		if (!checkData('loan24', '24期每期金额', 'input')) {
			return;
		}
		if (!limitCheck('loan24', '24期每期金额', 12)) {
			return;
		}
		if (!checkData('loan24', '24期每期金额', 'number')) {
			return;
		}
		
		
		if (!checkData('loan36', '36期每期金额', 'input')) {
			return;
		}
		if (!limitCheck('loan36', '36期每期金额', 12)) {
			return;
		}
		if (!checkData('loan36', '36期每期金额', 'number')) {
			return;
		}
		
		
		if (!checkData('loan48', '48期每期金额', 'input')) {
			return;
		}
		if (!limitCheck('loan48', '48期每期金额', 12)) {
			return;
		}
		if (!checkData('loan48', '48期每期金额', 'number')) {
			return;
		}
		

		param = {};
		param["modelid"]=$("#modelid").val();
		param["modelName"]=$("#modelName").val();
		param["lender"]=$("#lender").val();
		param["carprice"]=$("#carprice").val();
		param["downpayment"]=$("#downpayment").val();
		param["downPaymentPercent"]=$("#downPaymentPercent").val();
		param["premium"]=$("#premium").val();
		param["loan12"]=$("#loan12").val();
		param["loan24"]=$("#loan24").val();
		param["loan36"]=$("#loan36").val();
		param["loan48"]=$("#loan48").val();
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/loan_save.do",
			data : param,
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					alert("保存成功！");
					var modelid =$("#modelid").val();
					var modelName =$("#modelName").val();
					var model = modelid+"-"+modelName;
					window.location = "<%=path%>/mvc/loan.do?model="+model+"";
				}else{
					alert("保存失败:"+data.msg);
				}
			},
			error : function(msg) {
				alert("分配出错  " + msg);
			}
		});
	}
	function removeFile(obj){
		var param={};
		param["att_id"]=$(obj).data("attid");
		$.ajax( {
			type : "POST",
			url : "removeFile.do",
			data : param,
			async : false,
			success : function(flag) {
				if(flag){
					myalert("删除成功",initFileInput);
					$(obj).parents("label").remove();
					$("#fileUpLoadBtn").show();
				}else{
					myalert("删除失败",initFileInput);
				}
				
			},
			error : function(msg) {
				myalert("表单提交失败："+msg,initFileInput);
			}
		}); 
	}
	function initFileInput(){
		var html = "<div class=\"ace-file-input col-sm-12\" id=\"fileInputDiv\"> "+
		"<input type=\"file\" id=\"fileInput\" name=\"myfile\" class=\"ace-file-input col-sm-12\" onblur=\"clean()\"> "+
		"<div id=\"fileInput_font\" class=\"help-block red\" onclick=\"clean()\"></div></div>"; 
		$("#fileInputDiv").remove(); 
		$("#upload").html(html); 
		$('#fileInput').ace_file_input({
			no_file:'空...',
			btn_choose:'选择',
			btn_change:'更改',
			droppable:false,
			onchange:null,
			thumbnail:false 
		}); 
		setHash('${pageContext.request.contextPath}');
	}
	function goBack(model){
		window.location = "<%=path%>/mvc/loan.do?model="+model+"";
	}
	</script>
</body>
</html>
