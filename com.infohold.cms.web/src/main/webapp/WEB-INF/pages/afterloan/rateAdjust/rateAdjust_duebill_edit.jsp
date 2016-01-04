<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="sub_form"
					action="<%=path%>/mvc/productDef_addSave.do" method="post">
					<h3 class="header smaller lighter blue">借据信息</h3>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="duebill_id"> 借据编号 </label>
						<div class="col-sm-3">
							<input name="duebill_id" id="duebill_id" placeholder="点击选择借据" type="text"
								class="col-xs-10 col-sm-8" onclick="selectContract();" value="${map.biz_id }" readonly>
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="cust_name">
							客户名称 </label>
						<div class="col-sm-5">
							<input name="cust_name" id="cust_name" class="col-xs-10 col-sm-5" type="text"  value="${map.cust_name }" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="product_name"> 产品名称 </label>
						<div class="col-sm-3">
							<input name="product_name" id="product_name" class="col-xs-10 col-sm-8" type="text" value="${map.product_name }" 
								readonly>
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="duebill_amount">
							借据金额 </label>
						<div class="col-sm-5">
							<input name="duebill_amount" id="duebill_amount" class="col-xs-10 col-sm-5" type="text"  value="${map.duebill_amount }" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="start_date"> 借据起始日期 </label>
						<div class="col-sm-3">
							<input name="start_date" id="start_date" class="col-xs-10 col-sm-8" type="text" value="${map.start_date }" 
								readonly>
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="end_date">
							借据到期日期 </label>
						<div class="col-sm-5">
							<input name="end_date" id="end_date" class="col-xs-10 col-sm-5" type="text"  value="${map.end_date }" readonly>
						</div>
					</div>
					<h3 class="header smaller lighter blue">利率信息</h3>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="rat_int_val_new"> 基准利率(%) </label>
						<div class="col-sm-3">
							<input name="rat_int_val" id="rat_int_val" class="col-xs-10 col-sm-8" type="text" value="${map.rat_int_val }" 
								readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="contract_id"> 执行变动系数 </label>
						<div class="col-sm-3">
							<select name="rat_exe_cha_new" id="rat_exe_cha_new" class="col-xs-10 col-sm-4" data-emptyoption="false" data-select-list="${CHA}" data-select-value="${map.rat_exe_cha_new }">
							</select>
							<input name="rat_exe_coe_new" id="rat_exe_coe_new"  type="text"
								class="col-xs-10 col-sm-4"  value="${map.rat_exe_coe_new }" onblur="get_rat_exe_coe()">
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="cust_name">
							执行利率(%) </label>
						<div class="col-sm-5">
							<input name="rat_exe_val_new" id="rat_exe_val_new" class="col-xs-10 col-sm-5" type="text"  value="${map.rat_exe_val_new }" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="contract_id"> 逾期变动系数 </label>
						<div class="col-sm-3">
							<select name="rat_ove_cha_new" id="rat_ove_cha_new" class="col-xs-10 col-sm-4" data-emptyoption="false" data-select-list="${CHA}" data-select-value="${map.rat_ove_cha_new }">
							</select>
							<input name="rat_ove_coe_new" id="rat_ove_coe_new"  type="text" value="${map.rat_ove_coe_new }" 
								class="col-xs-10 col-sm-4" onblur="get_rat_ove_coe()">
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="cust_name">
							逾期利率(%) </label>
						<div class="col-sm-5">
							<input name="rat_ove_val_new" id="rat_ove_val_new" class="col-xs-10 col-sm-5" type="text"  value="${map.rat_ove_val_new }" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="contract_id"> 挪用变动系数 </label>
						<div class="col-sm-3">
							<select name="rat_emb_cha_new" id="rat_emb_cha_new" class="col-xs-10 col-sm-4" data-emptyoption="false" data-select-list="${CHA}" data-select-value="${map.rat_emb_cha_new }">
							</select>
							<input name="rat_emb_coe_new" id="rat_emb_coe_new"  type="text" value="${map.rat_emb_coe_new }" 
								class="col-xs-10 col-sm-4" onblur="get_rat_emb_coe()">
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="cust_name">
							挪用利率(%) </label>
						<div class="col-sm-5">
							<input name="rat_emb_val_new" id="rat_emb_val_new" class="col-xs-10 col-sm-5" type="text"  value="${map.rat_emb_val_new }" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="reason">申请原因</label>
						<div class="col-sm-3">
							<textarea class="form-control" id="reason" name="reason">${map.reason }</textarea>
						</div>
					</div>
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 提交
							</button>

							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button"
								onclick="javascript:history.go(-1);">
								<i class="icon-reply bigger-110"></i> 返回
							</button>
						</div>
					</div>
					<input id="rate_id" name="rate_id" type="hidden" value="${map.rate_id }">
					<input id="rat_exe_val_old" name="rat_exe_val_old" type="hidden" value="${map.rat_exe_val_old }">
					<input id="rat_exe_cha_old" name="rat_exe_cha_old" type="hidden" value="${map.rat_exe_cha_old }">
					<input id="rat_exe_coe_old" name="rat_exe_coe_old" type="hidden" value="${map.rat_exe_coe_old }">
					<input id="rat_ove_val_old" name="rat_ove_val_old" type="hidden" value="${map.rat_ove_val_old }">
					<input id="rat_ove_cha_old" name="rat_ove_cha_old" type="hidden" value="${map.rat_ove_cha_old }">
					<input id="rat_ove_coe_old" name="rat_ove_coe_old" type="hidden" value="${map.rat_ove_coe_old }">
					<input id="rat_emb_val_old" name="rat_emb_val_old" type="hidden" value="${map.rat_emb_val_old }">
					<input id="rat_emb_cha_old" name="rat_emb_cha_old" type="hidden" value="${map.rat_emb_cha_old }">
					<input id="rat_emb_coe_old" name="rat_emb_coe_old" type="hidden" value="${map.rat_emb_coe_old }">
				</form>
				<!-- PAGE CONTENT ENDS -->
			</div>
			<!-- /.col -->
		</div>
		
	<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" onclick="hideModal();">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">借据列表</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12">
							<div id="sample-table-2_wrapper" class="dataTables_wrapper"
								role="grid">
								<table id="sample-table-2"
									class="table table-striped table-bordered table-hover dataTable"
									aria-describedby="sample-table-2">
									<thead>
										<tr>
											<th>借据编号</th>
											<th>借据金额</th>
											<th>起始日期</th>
											<th>到期日期</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="custList">

									</tbody>
								</table>
							</div>
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
	<!-- PAGE CONTENT ENDS -->
	<script type="text/javascript">
	jQuery(function($) {
		$("#rat_emb_cha_new").formComponents("select");
		$("#rat_exe_cha_new").formComponents("select");
		$("#rat_ove_cha_new").formComponents("select");
	});
	function subForm() {
		
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/rateAdjust_contract_editSave.do",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					alert("保存成功！");
					$.post("rateAdjust_duebill_getList.do", param, function(result) {			
						$("#tabContent").html(result).hide();
						$("#tabContent").fadeIn('fast');
						setHash('${pageContext.request.contextPath}');
					});
				}else{
					alert("保存失败！");
				}
			},
			error : function(msg) {
				alert("分配出错  " + msg);
			}
		});
	}
	function selectContract(){
		showModal($("#myModal"));
		$.ajax( {
			type : "POST",
			url : "${pageContext.request.contextPath}/mvc/rateAdjust_duebill_queryDuebill.do",
			async : false,
			success : function(obj) {
				$(obj).each(function(index){
					var $tr = "<tr><td>"+$(obj)[index].duebill_id+"</td> "
								+" <td>"+$(obj)[index].duebill_amount+"</td> "
								+" <td>"+$(obj)[index].start_date+"</td> "
								+" <td>"+$(obj)[index].end_date+"</td> "
								+" <td><button type=\"button\" onclick=\"CallBackSubmit('"
										+$(obj)[index].duebill_id+","
										+$(obj)[index].cust_name+","
										+$(obj)[index].product_name+","
										+$(obj)[index].start_date+","
										+$(obj)[index].end_date+","
										+$(obj)[index].duebill_amount+","
										+$(obj)[index].rat_exe_val+","
										+$(obj)[index].rat_exe_cha+","
										+$(obj)[index].rat_exe_coe+","
										+$(obj)[index].rat_ove_val+","
										+$(obj)[index].rat_ove_cha+","
										+$(obj)[index].rat_ove_coe+","
										+$(obj)[index].rat_emb_val+","
										+$(obj)[index].rat_emb_cha+","
										+$(obj)[index].rat_emb_coe+","
										+$(obj)[index].rat_int_val+"');\">选择</button></td> "
								+" </tr>";
					$(window.document).find("#custList").append($tr);
				});
				var oTable1 = $('#sample-table-2').dataTable( {
					"aoColumns": [
				      null,null, null,null, null
					] } );
				$("#sample-table-2_length").remove();
				$("#sample-table-2_filter").remove();
			},
			error : function(msg) {
				alert("获取数据失败: " + msg);
			}
		});
	}
	function CallBackSubmit(obj){
		var objs = obj.split(",");
		$("#duebill_id").val(objs[0]);
		$("#cust_name").val(objs[1]);
		$("#product_name").val(objs[2]);
		$("#start_date").val(objs[3]);
		$("#end_date").val(objs[4]);
		$("#duebill_amount").val(objs[5]);
		$("#rat_exe_val_new").val(objs[6]);
		$("#rat_exe_cha_new").val(objs[7]);
		$("#rat_exe_coe_new").val(objs[8]);
		$("#rat_ove_val_new").val(objs[9]);
		$("#rat_ove_cha_new").val(objs[10]);
		$("#rat_ove_coe_new").val(objs[11]);
		$("#rat_emb_val_new").val(objs[12]);
		$("#rat_emb_cha_new").val(objs[13]);
		$("#rat_emb_coe_new").val(objs[14]);
		
		$("#rat_int_val").val(objs[15]);
		
		$("#rat_exe_val_old").val(objs[6]);
		$("#rat_exe_cha_old").val(objs[7]);
		$("#rat_exe_coe_old").val(objs[8]);
		$("#rat_ove_val_old").val(objs[9]);
		$("#rat_ove_cha_old").val(objs[10]);
		$("#rat_ove_coe_old").val(objs[11]);
		$("#rat_emb_val_old").val(objs[12]);
		$("#rat_emb_cha_old").val(objs[13]);
		$("#rat_emb_coe_old").val(objs[14]);
		hideModal();
	}
	//获取执行利率
	function get_rat_exe_coe(){
		
		var rat_int_val = document.getElementById("rat_int_val").value;//基准利率
		var rat_exe_coe = document.getElementById("rat_exe_coe_new").value;//执行利率变动系数
		var rat_exe_cha = document.getElementById("rat_exe_cha_new").value;//执行利率变动方式
		if((rat_int_val!=null&&rat_int_val!="")&&(rat_exe_coe!=null&&rat_exe_coe!="")&&(rat_exe_cha!=null&&rat_exe_cha!="")){
			if(rat_exe_cha==1){
				var rat_int_val=parseFloat(rat_int_val);
				rat_exe_val= parseFloat(rat_int_val+(rat_int_val*(rat_exe_coe/100))).toFixed(5);
				document.getElementById("rat_exe_val_new").value=rat_exe_val;
			}else{
				var rat_int_val=parseFloat(rat_int_val);
				var rat_exe_coe=parseFloat(rat_exe_coe);
				rat_exe_val= parseFloat(rat_int_val+rat_exe_coe).toFixed(5);
				document.getElementById("rat_exe_val_new").value=rat_exe_val;
			}
			
		get_rat_ove_coe();
		get_rat_emb_coe();
		}else{
			document.getElementById("rat_exe_val_new").value='';
		}
	}
	//获取逾期利率
	function get_rat_ove_coe(){
		var rat_exe_val = document.getElementById("rat_exe_val_new").value;//执行利率
		var rat_ove_coe = document.getElementById("rat_ove_coe_new").value;//逾期利率变动系数
		var rat_ove_cha = document.getElementById("rat_ove_cha_new").value;//逾期利率变动方式
		if((rat_exe_val!=null&&rat_exe_val!="")&&(rat_ove_coe!=null&&rat_ove_coe!="")&&(rat_ove_cha!=null&&rat_ove_cha!="")){
			
			if(rat_ove_cha==1){
				
				var rat_exe_val=parseFloat(rat_exe_val);
				rat_ove_val= parseFloat(rat_exe_val+(rat_exe_val*(rat_ove_coe/100))).toFixed(5);
				document.getElementById("rat_ove_val_new").value=rat_ove_val;
			}else{
			
				var rat_exe_val=parseFloat(rat_exe_val);
				var rat_ove_coe=parseFloat(rat_ove_coe);
				
				rat_ove_val= parseFloat(rat_exe_val+rat_ove_coe).toFixed(5);
				
				document.getElementById("rat_ove_val_new").value=rat_ove_val;
			}
			
		}else{
			document.getElementById("rat_ove_val_new").value='';
		}	
	}

	//获取挪用利率
	function get_rat_emb_coe(){
		var rat_exe_val = document.getElementById("rat_exe_val_new").value;//执行利率
		var rat_emb_coe = document.getElementById("rat_emb_coe_new").value;//逾期利率变动系数
		var rat_emb_cha = document.getElementById("rat_emb_cha_new").value;//逾期利率变动方式
		if((rat_exe_val!=null&&rat_exe_val!="")&&(rat_emb_coe!=null&&rat_emb_coe!="")&&(rat_emb_cha!=null&&rat_emb_cha!="")){
		
			if(rat_emb_cha==1){
				
				var rat_exe_val=parseFloat(rat_exe_val);
				rat_emb_val= parseFloat(rat_exe_val+(rat_exe_val*(rat_emb_coe/100))).toFixed(5);
				document.getElementById("rat_emb_val_new").value=rat_emb_val;
			}else{
			
				var rat_exe_val=parseFloat(rat_exe_val);
				var rat_emb_coe=parseFloat(rat_emb_coe);
				
				rat_emb_val= parseFloat(rat_exe_val+rat_emb_coe).toFixed(5);
			
				document.getElementById("rat_emb_val_new").value=rat_emb_val;
			}
			
		}else{
			document.getElementById("rat_emb_val_new").value='';
		}	
	}
	</script>
</body>
</html>

