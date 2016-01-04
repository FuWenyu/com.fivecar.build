<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!-- 模态块 -->
<div class="modal fade bs-example-modal-lg" id="Business_modal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" onclick="hideModal();">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">业务列表</h4>
				</div>
				<div class="modal-body">
				<form action="#" id = "form_cust_model_2" name ="form_cust_model_2" method="post">
				<div class="space-6"></div>
					<div class="row">
						<div class="col-xs-12">
							<div id="sample-table-2_wrapper" class="dataTables_wrapper"
								role="grid">
								<table id="sample-table-2"
									class="table table-striped table-bordered table-hover dataTable"
									aria-describedby="sample-table-2">
									<thead>
										<tr>
											<th>业务编号</th>
											<th>客户编号</th>
											<th>产品名称</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="businessList">

									</tbody>
									
								</table>
							</div>
						</div>
					</div>
					</form>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-sm btn-primary" onclick="callBackfunction();">选择</button> -->
					<button type="button" class="btn btn-sm btn-default"
						onclick="hideModal();">关闭</button>
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
<script type="text/javascript">
function selectBusiness(){
	var cust_id = document.getElementById("cust_id").value;
	if(cust_id==null||cust_id==''){
		alert("请先选择客户");
		return false;
	}
	showModal($("#Business_modal"));
	$.ajax( {
		type : "POST",
		url : "${pageContext.request.contextPath}/mvc/contract_getBusinessList.do?cust_id="+cust_id,
		async : false,
		success : function(obj2) {
		
			$(obj2).each(function(index2){
				var $tr = "<tr><td>"+$(obj2)[index2].BUSINESSID+"</td> "
							+" <td>"+$(obj2)[index2].CUSTID+"</td> "
							+" <td>"+$(obj2)[index2].pro_name+"</td> "
							+" <td><button type=\"button\" onclick=\"CallBackSubmit1('"
							+$(obj2)[index2].BUSINESSID+","
							+$(obj2)[index2].pro_name+","
							+$(obj2)[index2].AMOUNT+","
							+$(obj2)[index2].ZYDBFS+","
							+$(obj2)[index2].SPTGRQ+"');\">选择</button></td> "
							+" </tr>";
				$(window.document).find("#businessList").append($tr);
			});
		},
		error : function(msg) {
			alert("获取数据失败: " + msg);
		} 
	});
}

function CallBackSubmit1(businessList){
	var objs = businessList.split(",");
	$("#businessid").val(objs[0]);
	$("#pro_name").val(objs[1]);
	$("#amount").val(objs[2]);
	$("#zydbfs").val(objs[3]);
	$("#sptgrq").val(objs[4]);
	hideModal();
}
</script>

