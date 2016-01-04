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
						<div class="col-md-0"></div>
								<label class="col-sm-1 control-label no-padding-right"
									for="form-field-2"> 合同编号 </label>
							<div class="col-sm-4">
									<input type="text" id="con_acct_model" placeholder=""
										class="col-xs-10 col-sm-5" name="con_acct_model"/>
							</div>
							<div class="col-md-0"></div>
								<label class="col-sm-1 control-label no-padding-right"
									for="form-field-2"> 客户名称 </label>
							<div class="col-sm-4">
							<input type="text" id="cust_name_model" placeholder=""
										class="col-xs-10 col-sm-5" name="cust_name_model"/>
							</div>
						<div class="col-sm-1">
							<button class="btn btn-sm btn-primary" type="button" onclick="javaScript:loadMainContent.window.show_modal_query(1);">查询</button>
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
											<th>业务编号</th>
											<th>合同编号</th>
											<th>客户名称</th>
											<th>产品名称</th>
											<th>合同金额</th>
											<th>起始日期</th>
											<th>到期日期</th>
											<th>合同状态</th>
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
function selectCon(pageNo){
	showModal($("#myModal"));
	$.ajax( {
		type : "POST",
		url : "${pageContext.request.contextPath}/mvc/Guarantee_Change_getCon.do?pageNo="+pageNo,
		async : false,
		success : function(obj) {
				var pageInfo=obj[0];//分页信息
				var List=obj[1];//结果信息
				$(List).each(function(index){//输出结果集到表格，此处根据各自需要修改
					var $tr = "<tr><td>"+List[index].contract_id+"</td> "
					+" <td>"+List[index].con_acct+"</td> "
					+" <td>"+List[index].custchname+"</td> "
					+" <td>"+List[index].product_name+"</td> "
					+" <td>"+List[index].amount+"</td> "
					+" <td>"+List[index].start_date+"</td> "
					+" <td>"+List[index].end_date+"</td> "
					+" <td>"+List[index].status_name+"</td> "
					+" <td><button type=\"button\" onclick=\"callBackfunction('"
					+List[index].contract_id+"');\">选择</button></td> "
					+" </tr>";
					$(window.parent.document).find("#sub_data").append($tr);
				});
			//输出分页信息，下面的不需要动				
			 $(".sub_page_prev_1").remove();
			$(".sub_page_next_1").remove();
			$(".sub_page_next_1").remove();
			$(".dataTables_infot_1").remove();
			var str_page="";
			if((pageInfo.pageNo + 1) <= (pageInfo.totalPageCount)){
				str_page=str_page + "<li class='sub_page_next_1 pull-right'><a href='#'onclick='loadMainContent.window.movePage_1("+(pageInfo.totalPages)+");'> <iclass='icon-double-angle-right'>尾页</i></a></li>";	
			}
			if((pageInfo.pageNo + 1) > (pageInfo.totalPageCount)){
				str_page=str_page + "<li class='sub_page_next_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-right'>尾页</i></a></li>";	
			}	
			if((pageInfo.pageNo + 1) <= (pageInfo.totalPageCount)){
				str_page=str_page + "<li class='sub_page_next_1 pull-right'><a href='#'onclick='loadMainContent.window.movePage_1("+(pageInfo.pageNo + 1)+");'> <iclass='icon-double-angle-right'>下一页</i></a></li>";	
			}
			if((pageInfo.pageNo + 1) > (pageInfo.totalPageCount)){
				str_page=str_page + "<li class='sub_page_next_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-right'>下一页</i></a></li>";	
			}				
			if(pageInfo.pageNo <= 1){
				str_page=str_page + "<li class='sub_page_prev_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-left'>上一页 </i></a></li>";	
			}
			if(pageInfo.pageNo > 1){
				str_page=str_page + "<li class='sub_page_prev_1 pull-right'><a href='#'onclick='loadMainContent.window.movePage_1("+(pageInfo.pageNo - 1)+");'> <iclass='icon-double-angle-left'>上一页 </i></a></li>";	
			}
			if(pageInfo.pageNo <= 1){
				str_page=str_page + "<li class='sub_page_prev_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-left'>首页 </i></a></li>";	
			}
			if(pageInfo.pageNo > 1){
				str_page=str_page + "<li class='sub_page_prev_1 pull-right'><a href='#'onclick='loadMainContent.window.movePage_1(1);'> <iclass='icon-double-angle-left'>首页 </i></a></li>";	
			}				
			$(window.parent.document).find("#sub_page_1").append(str_page);				 
			 var sub_page_totalCount=""; 
			 if(pageInfo.totalCount > 0){
				 sub_page_totalCount="<div class='dataTables_infot_1' id='sample-table-2_info' >共"+pageInfo.totalCount+"条,第"+pageInfo.pageNo+"页</div>";
			 }
			 $(window.parent.document).find("#sub_page_totalCount_1").append(sub_page_totalCount);	

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
	parent.window.$(".sub_data_tr_1").remove();
		$.ajax( {
			type : "POST",
			data : $(window.parent.document).find("#form_cust_model").serialize(),
			url : "${pageContext.request.contextPath}/mvc/contract_getCustomerList.do?pageNo="+pageNo,
			async : false,
			success : function(obj) {
				var pageInfo=obj[0];//分页信息
				var List=obj[1];//结果信息
				$(List).each(function(index){//输出结果集到表格，此处根据各自需要修改
					var $tr = "<tr><td>"+List[index].contract_id+"</td> "
					+" <td>"+List[index].con_acct+"</td> "
					+" <td>"+List[index].custchname+"</td> "
					+" <td>"+List[index].product_name+"</td> "
					+" <td>"+List[index].amount+"</td> "
					+" <td>"+List[index].start_date+"</td> "
					+" <td>"+List[index].end_date+"</td> "
					+" <td>"+List[index].cust_manager_name+"</td> "
					+" <td>"+List[index].status_name+"</td> "
					+" <td><button type=\"button\" onclick=\"callBackfunction('"
					+List[index].contract_id+"');\">选择</button></td> "
					+" </tr>";
					$(window.parent.document).find("#sub_data").append($tr);
				});
				//输出分页信息，下面的不需要动				
				parent.window.$(".sub_page_prev_1").remove();
				parent.window.$(".sub_page_next_1").remove();
				parent.window.$(".sub_page_next_1").remove();
				parent.window.$(".dataTables_infot_1").remove();
				var str_page="";
				if((pageInfo.pageNo + 1) <= (pageInfo.totalPageCount)){
					str_page=str_page + "<li class='sub_page_next_1 pull-right'><a href='#'onclick='loadMainContent.window.movePage_1("+(pageInfo.totalPages)+");'> <iclass='icon-double-angle-right'>尾页</i></a></li>";	
				}
				if((pageInfo.pageNo + 1) > (pageInfo.totalPageCount)){
					str_page=str_page + "<li class='sub_page_next_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-right'>尾页</i></a></li>";	
				}	
				if((pageInfo.pageNo + 1) <= (pageInfo.totalPageCount)){
					str_page=str_page + "<li class='sub_page_next_1 pull-right'><a href='#'onclick='loadMainContent.window.movePage_1("+(pageInfo.pageNo + 1)+");'> <iclass='icon-double-angle-right'>下一页</i></a></li>";	
				}
				if((pageInfo.pageNo + 1) > (pageInfo.totalPageCount)){
					str_page=str_page + "<li class='sub_page_next_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-right'>下一页</i></a></li>";	
				}				
				if(pageInfo.pageNo <= 1){
					str_page=str_page + "<li class='sub_page_prev_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-left'>上一页 </i></a></li>";	
				}
				if(pageInfo.pageNo > 1){
					str_page=str_page + "<li class='sub_page_prev_1 pull-right'><a href='#'onclick='loadMainContent.window.movePage_1("+(pageInfo.pageNo - 1)+");'> <iclass='icon-double-angle-left'>上一页 </i></a></li>";	
				}
				if(pageInfo.pageNo <= 1){
					str_page=str_page + "<li class='sub_page_prev_1 disabled pull-right'><a href='#'onclick=''> <iclass='icon-double-angle-left'>首页 </i></a></li>";	
				}
				if(pageInfo.pageNo > 1){
					str_page=str_page + "<li class='sub_page_prev_1 pull-right'><a href='#'onclick='loadMainContent.window.movePage_1(1);'> <iclass='icon-double-angle-left'>首页 </i></a></li>";	
				}				
				parent.window.$("#sub_page_1").append(str_page);				 
				 var sub_page_totalCount="";
				 if(pageInfo.totalCount > 0){
					 sub_page_totalCount="<div class='dataTables_infot_1' id='sample-table-2_info' >共"+pageInfo.totalCount+"条,第"+pageInfo.pageNo+"页</div>";
				 }
				 parent.window.$("#sub_page_totalCount_1").append(sub_page_totalCount);	
			},
			error : function(msg) {
				alert("获取数据失败: " + msg);
			}
		});
	}


//双击方法
function CallBackSubmit(contract_id) {
	window.location="<%=path%>/mvc/Guarantee_Change_getConAndGua.do?contract_id="+contract_id;
	hideModal();
	
}
</script>

