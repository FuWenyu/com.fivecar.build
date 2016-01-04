<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!-- 模态块 -->
<div class="modal fade bs-example-modal-lg" id="gua_limit_modal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" onclick="hideModal();">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">保证人列表</h4>
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
											<th>额度编号</th>
											<th>总金额</th>
											<th>剩余金额</th>
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
				<div class="row">
							<div class="form-group">
							<label class="col-sm-1 control-label no-padding-right" 
								for="form-field-2"> 担保份额 </label>
							<div class="col-sm-2">
								<input type="text" id="gua_share1" 
									class="col-xs-8" name="gua_share1"
									value="${gua_share}" />
							</div>
							</div>
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
function selectGuaTor(guarantee_id){
	showModal($("#gua_limit_modal"));
	$.ajax( {
		type : "POST",
		url : "${pageContext.request.contextPath}/mvc/Guarantee_modal_getTor.do?guarantee_id="+guarantee_id,
		async : false,
		success : function(obj2) {
		
			$(obj2).each(function(index2){
				var $tr = "<tr><td>"+$(obj2)[index2].limitId+"</td> "
							+" <td>"+$(obj2)[index2].totalAmount+"</td> "
							+" <td>"+$(obj2)[index2].creditBalance+"</td> "
							+" <td><button type=\"button\" onclick=\"CallBackSubmit1('"
							+$(obj2)[index2].limitId+","
							+$(obj2)[index2].totalAmount+","
							+$(obj2)[index2].creditBalance+"');\">选择</button></td> "
							+" </tr>";
				$(window.document).find("#businessList").append($tr);
			});
		},
		error : function(msg) {
			alert("获取数据失败: " + msg);
		} 
	});
}

function CallBackSubmit1(torList){
	var gua_share1 = document.getElementById("gua_share1").value;
	var guarantee_id = document.getElementById("guarantee_id").value;
	var contract_id = document.getElementById("contract_id").value;
	var objs = torList.split(",");
	var limitId = objs[0];
	var totalAmount = objs[1];
	var creditBalance = objs[2];
	if(gua_share1==null||gua_share1==''){
		alert("请填写担保份额");
		return false;
	}
	if(gua_share1>creditBalance){
		alert("担保份额不能大于可用金额");
		return false;
	}
	
	//调后台保存担保合同与保证人的关联关系
		$.ajax( {
			type : "POST",
			url : "<%=path%>/mvc/guarantee_tor_save.do?guarantee_id="+guarantee_id+"&gua_share="+gua_share1+"&limitId="+limitId,
			data : $("#form_sub").serialize(),
			async : false,
			success : function(result) {
				if(result.msg=="success"){
					f_alert("<%=path%>","success","Guarantee_quertTorList.do?flag=1&guarantee_id="+guarantee_id+"&contract_id="+contract_id);
				}else{
					f_alert("<%=path%>","担保公司系统-"+result.msg,"");			
					}
			},
				error : function(msg) {
					var exp="分配出错 " + msg;
					f_alert("<%=path%>",exp,"");
				}
		});
	hideModal();
}
</script>

