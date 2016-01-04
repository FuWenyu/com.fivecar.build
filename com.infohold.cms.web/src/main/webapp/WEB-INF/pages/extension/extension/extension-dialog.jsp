<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!-- 模态块 -->
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" onclick="hideModal();">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">借据查询</h4>
				</div>
				<div class="modal-body">
				<form action="#" id = "form_cust_model" name ="form_cust_model" method="post">
				<div class="row">
					<div class="form-group">
					<div class="col-sm-1"></div>
						<label class="col-sm-1 control-label no-padding-right"
							for="form-field-1"> 客户编号 </label>
						<div class="col-sm-4">
							<input type="text" id="custid_s"  
								class="col-xs-10 col-sm-5" name="custid_s" value="" />
						</div>
						<label class="col-sm-1 control-label no-padding-right"
							for="form-field-1"> 借据编号</label>
						<div class="col-sm-3">
							<input type="text" id="duebill_id_s"  
								class="col-xs-10 col-sm-5" name="duebill_id_s"  value="" />
						</div>
						<div class="col-sm-1">
							<button class="btn btn-sm btn-primary" type="button" onclick="javaScript:show_modal_query(1);">查询</button>
						</div>
					<div class="col-sm-1"></div>
					</div>
				</div>
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
											<th>借据编号</th>
											<th>合同号</th>
											<th>借据金额</th>											
											<th>起始日期</th>
											<th>到期日期</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="sub_data">

									</tbody>
									
								</table>
								<!--分页信息  -->
								
							</div>
							<div class="row">
								<div class="col-xs-12">
									<!-- PAGE CONTENT BEGINS -->
									<div class="table-responsive">
										<input type="hidden" id="pageNo" name="pageNo"
											value="${page.pageNo }" />
										<div id="sample-table-2_wrapper" class="dataTables_wrapper"
											role="grid">
											<div class="row">
												<div class="col-sm-5">
													<!--页码  -->
													<div class="col-sm-5" id="sub_page_totalCount_1"></div>
												</div>
												<div class="col-sm-7">
													<div class="dataTables_paginate paging_bootstrap">
														<ul class="pagination" id="sub_page_1"></ul>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- PAGE CONTENT ENDS -->
								</div>
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
function selectDuebill(pageNo){
	showModal($("#myModal"));
	$.ajax( {
		type : "POST",
		url : "${pageContext.request.contextPath}/mvc/getDuebillList.do?pageNo="+pageNo,
		async : false,
		success : function(obj) {
				var pageInfo=obj[0];//分页信息
				var BizDueBillList=obj[1];//结果信息
				$(BizDueBillList).each(function(index){//输出结果集到表格，此处根据各自需要修改
					var $tr = "<tr><td>"+BizDueBillList[index].duebill_acct+"</td> "
					+" <td>"+BizDueBillList[index].con_acct+"</td> "
					+" <td>"+BizDueBillList[index].duebill_amount+"</td> "
					+" <td>"+BizDueBillList[index].billstart+"</td> "
					+" <td>"+BizDueBillList[index].billend+"</td> "
					+" <td><button type=\"button\" onclick=\"CallBackSubmit('"
					+BizDueBillList[index].duebill_id+","
					+BizDueBillList[index].con_acct+","
					+BizDueBillList[index].amount+","
					+BizDueBillList[index].product_name+","
					+BizDueBillList[index].repayment_name+","
					+BizDueBillList[index].custid+","
					+BizDueBillList[index].custchname+","
					+BizDueBillList[index].constart+","
					+BizDueBillList[index].conend+","
					+BizDueBillList[index].duebill_acct+","
					+BizDueBillList[index].duebill_amount+","
					+BizDueBillList[index].rat_int_val+","
					+BizDueBillList[index].rat_exe_val+","
					+BizDueBillList[index].rat_ove_val+","
					+BizDueBillList[index].rat_emb_val+","
					+BizDueBillList[index].loan_acct_no+","
					+BizDueBillList[index].status+","
					+BizDueBillList[index].billstart+","
					+BizDueBillList[index].billend+","
					+BizDueBillList[index].zdzqrq+"');\">选择</button></td> "
					+" </tr>";
					$(window.document).find("#sub_data").append($tr);
				});
			//输出分页信息，下面的不需要动				
			 $(".sub_page_prev_1").remove();
			$(".sub_page_next_1").remove();
			$(".sub_page_next_1").remove();
			$(".dataTables_infot_1").remove();
			var str_page="";
			if((pageInfo.pageNo + 1) <= (pageInfo.totalPageCount)){
				str_page=str_page + "<li class='sub_page_next_1 pull-right'><a href='#'onclick='movePage_1("+(pageInfo.totalPages)+");'> <iclass='icon-double-angle-right'>尾页</i></a></li>";	
			}
			if((pageInfo.pageNo + 1) > (pageInfo.totalPageCount)){
				str_page=str_page + "<li class='sub_page_next_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-right'>尾页</i></a></li>";	
			}	
			if((pageInfo.pageNo + 1) <= (pageInfo.totalPageCount)){
				str_page=str_page + "<li class='sub_page_next_1 pull-right'><a href='#'onclick='movePage_1("+(pageInfo.pageNo + 1)+");'> <iclass='icon-double-angle-right'>下一页</i></a></li>";	
			}
			if((pageInfo.pageNo + 1) > (pageInfo.totalPageCount)){
				str_page=str_page + "<li class='sub_page_next_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-right'>下一页</i></a></li>";	
			}				
			if(pageInfo.pageNo <= 1){
				str_page=str_page + "<li class='sub_page_prev_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-left'>上一页 </i></a></li>";	
			}
			if(pageInfo.pageNo > 1){
				str_page=str_page + "<li class='sub_page_prev_1 pull-right'><a href='#'onclick='movePage_1("+(pageInfo.pageNo - 1)+");'> <iclass='icon-double-angle-left'>上一页 </i></a></li>";	
			}
			if(pageInfo.pageNo <= 1){
				str_page=str_page + "<li class='sub_page_prev_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-left'>首页 </i></a></li>";	
			}
			if(pageInfo.pageNo > 1){
				str_page=str_page + "<li class='sub_page_prev_1 pull-right'><a href='#'onclick='movePage_1(1);'> <iclass='icon-double-angle-left'>首页 </i></a></li>";	
			}				
			$(window.document).find("#sub_page_1").append(str_page);				 
			 var sub_page_totalCount=""; 
			 if(pageInfo.totalCount > 0){
				 sub_page_totalCount="<div class='dataTables_infot_1' id='sample-table-2_info' >共"+pageInfo.totalCount+"条,第"+pageInfo.pageNo+"页</div>";
			 }
			 $(window.document).find("#sub_page_totalCount_1").append(sub_page_totalCount);	

		},
		error : function(msg) {
			alert("获取数据失败: " + msg);
		}
	});
}
function movePage_1(pageNo) {
	show_modal_query(pageNo);
};
function show_modal_query(pageNo) {
	window.$(".sub_data_tr_1").remove();
		$.ajax( {
			type : "POST",
			data : $(window.document).find("#form_cust_model").serialize(),
			url : "${pageContext.request.contextPath}/mvc/getDuebillList.do?pageNo="+pageNo,
			async : false,
			success : function(obj) {
				var pageInfo=obj[0];//分页信息
				var custList=obj[1];//结果信息

				$(BizDueBillList).each(function(index){//输出结果集到表格，此处根据各自需要修改
					var $tr = "<tr><td>"+BizDueBillList[index].duebill_acct+"</td> "
					+" <td>"+BizDueBillList[index].con_acct+"</td> "
					+" <td>"+BizDueBillList[index].duebill_amount+"</td> "
					+" <td>"+BizDueBillList[index].billstart+"</td> "
					+" <td>"+BizDueBillList[index].billend+"</td> "
					+" <td><button type=\"button\" onclick=\"CallBackSubmit('"
					+BizDueBillList[index].duebill_id+","
					+BizDueBillList[index].con_acct+","
					+BizDueBillList[index].amount+","
					+BizDueBillList[index].product_name+","
					+BizDueBillList[index].repayment_name+","
					+BizDueBillList[index].custid+","
					+BizDueBillList[index].custchname+","
					+BizDueBillList[index].constart+","
					+BizDueBillList[index].conend+","
					+BizDueBillList[index].duebill_acct+","
					+BizDueBillList[index].duebill_amount+","
					+BizDueBillList[index].rat_int_val+","
					+BizDueBillList[index].rat_exe_val+","
					+BizDueBillList[index].rat_ove_val+","
					+BizDueBillList[index].rat_emb_val+","
					+BizDueBillList[index].loan_acct_no+","
					+BizDueBillList[index].status+","
					+BizDueBillList[index].billstart+","
					+BizDueBillList[index].billend+","
					+BizDueBillList[index].billend+","
					+BizDueBillList[index].zdzqrq+"');\">选择</button></td> "
					+" </tr>";
					$(window.document).find("#sub_data").append($tr);
				});
				//输出分页信息，下面的不需要动				
				window.$(".sub_page_prev_1").remove();
				window.$(".sub_page_next_1").remove();
				window.$(".sub_page_next_1").remove();
				window.$(".dataTables_infot_1").remove();
				var str_page="";
				if((pageInfo.pageNo + 1) <= (pageInfo.totalPageCount)){
					str_page=str_page + "<li class='sub_page_next_1 pull-right'><a href='#'onclick='movePage_1("+(pageInfo.totalPages)+");'> <iclass='icon-double-angle-right'>尾页</i></a></li>";	
				}
				if((pageInfo.pageNo + 1) > (pageInfo.totalPageCount)){
					str_page=str_page + "<li class='sub_page_next_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-right'>尾页</i></a></li>";	
				}	
				if((pageInfo.pageNo + 1) <= (pageInfo.totalPageCount)){
					str_page=str_page + "<li class='sub_page_next_1 pull-right'><a href='#'onclick='movePage_1("+(pageInfo.pageNo + 1)+");'> <iclass='icon-double-angle-right'>下一页</i></a></li>";	
				}
				if((pageInfo.pageNo + 1) > (pageInfo.totalPageCount)){
					str_page=str_page + "<li class='sub_page_next_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-right'>下一页</i></a></li>";	
				}				
				if(pageInfo.pageNo <= 1){
					str_page=str_page + "<li class='sub_page_prev_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-left'>上一页 </i></a></li>";	
				}
				if(pageInfo.pageNo > 1){
					str_page=str_page + "<li class='sub_page_prev_1 pull-right'><a href='#'onclick='movePage_1("+(pageInfo.pageNo - 1)+");'> <iclass='icon-double-angle-left'>上一页 </i></a></li>";	
				}
				if(pageInfo.pageNo <= 1){
					str_page=str_page + "<li class='sub_page_prev_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-left'>首页 </i></a></li>";	
				}
				if(pageInfo.pageNo > 1){
					str_page=str_page + "<li class='sub_page_prev_1 pull-right'><a href='#'onclick='movePage_1(1);'> <iclass='icon-double-angle-left'>首页 </i></a></li>";	
				}				
				window.$("#sub_page_1").append(str_page);				 
				 var sub_page_totalCount="";
				 if(pageInfo.totalCount > 0){
					 sub_page_totalCount="<div class='dataTables_infot_1' id='sample-table-2_info' >共"+pageInfo.totalCount+"条,第"+pageInfo.pageNo+"页</div>";
				 }
				 window.$("#sub_page_totalCount_1").append(sub_page_totalCount);	
			},
			error : function(msg) {
				alert("获取数据失败: " + msg);
			}
		});
	}


//双击方法
function CallBackSubmit(businessList) {
	var objs = businessList.split(",");
	document.getElementById("duebill_id").value = objs[0];
    document.getElementById("agreement_id").value = objs[1];
	document.getElementById("agreement_amount").value = objs[2];
	document.getElementById("product_name").value = objs[3];
	document.getElementById("repayment_type").value = objs[4];
	document.getElementById("cust_id").value = objs[5];
	document.getElementById("cust_name").value = objs[6];
	document.getElementById("constart").value = objs[7];
	document.getElementById("conend").value = objs[8];
	document.getElementById("duebill_acct").value = objs[9];
	document.getElementById("duebill_amount").value = objs[10];
	document.getElementById("rat_int_val").value = objs[11];
	document.getElementById("rat_exe_val").value = objs[12];
	document.getElementById("rat_ove_val").value = objs[13];
	document.getElementById("rat_emb_val").value = objs[14];
	document.getElementById("loan_acct_no").value = objs[15];
	document.getElementById("status").value = objs[16];  
	document.getElementById("billstart").value = objs[17];
	document.getElementById("billend").value = objs[18];
	document.getElementById("zdzqrq").value = objs[19];
	hideModal();
	//调核心还款账户信息查询，返回页面需要信息
	var duebill_id = document.getElementById("duebill_id").value;
	 $.ajax({
			type : "POST",
			url : "<%=path%>/mvc/getDuebillHx.do?duebill_id="+duebill_id,
			async : false,
			success : function(obj) {
				document.getElementById("outstandingPrincipalBalance").value = obj.outstandingPrincipalBalance;
				document.getElementById("unpaidPrincipalArrears").value = obj.unpaidPrincipalArrears;
				document.getElementById("unpaidInterestArrears").value = obj.unpaidInterestArrears;
				document.getElementById("penaltyArrears").value = obj.penaltyArrears;
				document.getElementById("compoundingInterestArrears").value = obj.compoundingInterestArrears;
				document.getElementById("otherArrears").value = obj.otherArrears;
				document.getElementById("zqcs").value = obj.zqcs;
			},
			error : function(msg) {
				ncms_alert("校验失败: " + msg.a);
			}
		});	 
}
</script>

