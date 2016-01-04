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
		<div id="modal_area"></div>
		<div class="page-content" id="loadPageContent">
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" id="sub_form" action="<%=path%>/mvc/productDef_addSave.do" method="post">
					<input id="move_id" name="move_id" type="hidden" value="${map.move_id }">
					<h3 class="header smaller lighter blue">原客户信息</h3>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="duebill_id"> 移交客户名称 </label>
						<div class="col-sm-3">
							<input name="custchname" id="custchname" placeholder="点击选择客户" type="text"
								class="col-xs-10 col-sm-8" onclick="selectCustomer(1);" value="${map.cust_name }" readonly>
							<input id="cust_id" name="cust_id" type="hidden" value="${map.cust_id }"> 
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="branch_no_old">
							原机构 </label>
						<div class="col-sm-5">
							<input name="branch_no_old" id="branch_no_old" class="col-xs-10 col-sm-5" type="text" value="${sessionScope.userSession.branchName}" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="old_cust_manager"> 原客户经理 </label>
						<div class="col-sm-3">
							<input name="old_cust_manager" id="old_cust_manager" class="col-xs-10 col-sm-8" value="${map.old_cust_manager_name}" type="text"
								readonly>
						</div>
						<!-- <label class="col-sm-2 control-label no-padding-right" for="amount">
							借据金额 </label>
						<div class="col-sm-5">
							<input name="duebill_amount" id="duebill_amount" class="col-xs-10 col-sm-5" type="text" readonly>
						</div> -->
					</div>
					<h3 class="header smaller lighter blue">移交信息</h3>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="new_cust_manager"> 新客户经理 </label>
						<div class="col-sm-3">
							<select name="new_cust_manager" id=new_cust_manager class="col-xs-10 col-sm-8" data-emptyoption="false" data-select-list="${custManagerList}" data-select-value="${map.new_cust_manager}"></select>
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="cust_name">
							新机构 </label>
						<div class="col-sm-5">
							<input name="branch_no_new" id="branch_no_new" class="col-xs-10 col-sm-5" type="text"  value="${map.branch_no_new_name}"  readonly>
						</div>
					</div>
				       <div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"
							for="branchName"> 申请人 </label>
						<div class="col-sm-3">
							<input name="branchName" id="branchName" 
								   class="col-xs-10 col-sm-5" type="text" value="${map.cust_manager_name}" readonly>
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="userName">
							申请时间 </label>
						<div class="col-sm-5">
							<input name="move_date" id="move_date" class="col-xs-10 col-sm-5" type="text" value="${map.move_date}" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="move_reason">申请原因</label>
						<div class="col-sm-3">
							<textarea class="form-control" id="move_reason" name="move_reason">${map.move_reason }</textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="ps">备        注</label>
						<div class="col-sm-3">
							<textarea class="form-control" id="ps" name="ps">${map.ps }</textarea>
						</div>
					</div>
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
								<button class="btn btn-info" type="button"
									onclick="subForm();">
									<i class="icon-ok bigger-110"></i> 提交
								</button>

								&nbsp; &nbsp; &nbsp;
								<button class="btn" type="button" onclick="javascript:history.go(-1);">
									<i class="icon-reply bigger-110"></i> 返回
								</button>
							</div>
						</div>
					</form>
					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- 模态块 -->
<div class="modal fade bs-example-modal-lg" id="Cust_Modal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" onclick="hideModal();">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">客户列表</h4>
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
							for="form-field-1"> 客户名称</label>
						<div class="col-sm-3">
							<input type="text" id="custname_s"  
								class="col-xs-10 col-sm-5" name="custname_s"  value="" />
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
											<th>客户编号</th>
											<th>客户名称</th>
											<th>证件类型</th>
											<th>证件号码</th>
											<th>客户类型</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="custList">

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
	<!-- PAGE CONTENT ENDS -->
	<script type="text/javascript">
	jQuery(function($) {
		//加载机构列表
		/* $("#trade_type").formComponents("select");
		$("#toll_type").formComponents("select");
		$("#toll_currency").formComponents("select"); */
		$("#new_cust_manager").formComponents("select");
	});
	function subForm() {
		if (!checkData('cust_id', '移交客户名称', 'input')) {
			return;
		} 
		
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/customerMove_editSave.do",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					alert("保存成功！");
					window.location = "<%=path%>/mvc/customerMove_getList.do";
				}else{
					alert("保存失败！");
				}
			},
			error : function(msg) {
				alert("分配出错  " + msg);
			}
		});
	}
	function selectCustomer(pageNo){
		showModal($("#Cust_Modal"));
		$.ajax( {
			type : "POST",
			url : "${pageContext.request.contextPath}/mvc/customerMove_getCustomerList.do?pageNo="+pageNo,
			async : false,
			success : function(obj) {
				var pageInfo=obj[0];//分页信息
				var custList=obj[1];//结果信息
				$(obj[1]).each(function(index){
					 var $tr = "<tr class=\"sub_data_tr_1\"><td>"+$(obj[1])[index].cust_id+"</td> "
								+" <td>"+$(obj[1])[index].custchname+"</td> "
								+" <td>"+$(obj[1])[index].file_name+"</td> "
								+" <td>"+$(obj[1])[index].file_number+"</td> "
								+" <td>"+$(obj[1])[index].khlx1+"</td> "
								+" <td><button type=\"button\" onclick=\"CallBackSubmit('"
										+$(obj[1])[index].cust_id+","
										+$(obj[1])[index].custchname+","
										+$(obj[1])[index].khlx1+"');\">选择</button></td> "
								+" </tr>";
					$(window.document).find("#custList").append($tr); 
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
				url : "${pageContext.request.contextPath}/mvc/customerMove_getCustomerList.do?pageNo="+pageNo,
				async : false,
				success : function(obj) {
					var pageInfo=obj[0];//分页信息
					var custList=obj[1];//结果信息

					$(obj[1]).each(function(index){
					
						var $tr = "<tr class=\"sub_data_tr_1\"><td>"+$(obj[1])[index].cust_id+"</td> "
									+" <td>"+$(obj[1])[index].custchname+"</td> "
									+" <td>"+$(obj[1])[index].file_name+"</td> "
									+" <td>"+$(obj[1])[index].file_number+"</td> "
									+" <td>"+$(obj[1])[index].khlx1+"</td> "
									+" <td><button type=\"button\" onclick=\"CallBackSubmit('"
											+$(obj[1])[index].cust_id+","
											+$(obj[1])[index].custchname+","
											+$(obj[1])[index].khlx1+"');\">选择</button></td> "
									+" </tr>";
						$(window.document).find("#custList").append($tr);
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


	function CallBackSubmit(custList){
		var objs = custList.split(",");
		$("#cust_id").val(objs[0]);
		$("#custchname").val(objs[1]);
		$("#khlx1").val(objs[2]);
		hideModal();
	}
	</script>
	</body>
</html>

