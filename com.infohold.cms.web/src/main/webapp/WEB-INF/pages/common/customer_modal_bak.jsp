<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!-- 模态块 -->
<div class="modal fade bs-example-modal-1g" id="Cust_Modal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="breadcrumbs" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="active "></i>客户查询</li>
				</ul>
			</div>
			<div class="modal-body">	
			<form action="#" id = "form">			
				<div class="page-content">			
					<div class="row">
						<div class="form-group">
							<label class="col-sm-2 control-label no-padding-right"
								for="form-field-2"> 客户编号 </label>
							<div class="col-sm-4">
								<input type="text" id="form-field-1" placeholder=""
									class="col-xs-8" name="custid_s" id="custid_s"
									value="${customerEntity.cust_id }" />
							</div>
							<label class="col-sm-2 control-label no-padding-right"
								for="form-field-2"> 客户名称 </label>
							<div class="col-sm-4">
								<input type="text" id="form-field-1" placeholder=""
									class="col-xs-8" name="cust_name_s" id="cust_name_s"
									value="${customerEntity.custchname }" />
							</div>
						</div>
					</div>
				</div>
				<div class="page-content">
					<div class="row">
						<label class="col-sm-10 control-label no-padding-right"> </label>					
							<button class="btn btn-sm btn-primary" type="button" onclick="show_modal(1);">查询</button>
                             <button type="button" class="btn btn-sm btn-primary" data-dismiss="modal">关闭</button>
					</div>
				</div>
				<div class="space-13"></div>
				<!--查询结果列表  -->
				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<div class="table-responsive">
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
										</tr>
									</thead>
									<tbody id="sub_data_1"></tbody>
								</table>
							</div>
							<!--分页信息  -->
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
				</div>
				</form>				
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
jQuery(function($) {
show_modal(1);
});
  function show_modal(pageNo) {
		$(".sub_data_tr_1").remove();
		$.ajax( {
			type : "POST",
			url : "${pageContext.request.contextPath}/mvc/contract_getCustomerList.do?pageNo="+pageNo,
			data : $("#form").serialize(),
			async : false,
			success : function(obj) {
				var pageInfo=obj[0];//分页信息
				var customerList=obj[1];//结果信息
				$(customerList).each(function(index){//输出结果集到表格，此处根据各自需要修改
					var str="<tr class=\"sub_data_tr_1\" ondblclick=\"sure('"+customerList[index].cust_id+"'"+",'"+customerList[index].custchname+"'"+",'"+customerList[index].khlx1+"')\">";
					str=str + "<td>"+customerList[index].cust_id+"</td>";
					str=str + "<td>"+customerList[index].custchname+"</td>";
					str=str + "<td>"+customerList[index].file_type+"</td>";
					str=str + "<td>"+customerList[index].file_number+"</td>";
					str=str + "<td>"+customerList[index].khlx1+"</td>";
					str=str + "</tr>";
				    $("#sub_data_1").append(str);
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
				 $("#sub_page_1").append(str_page);				 
				 var sub_page_totalCount="";
				 if(pageInfo.totalCount > 0){
					 sub_page_totalCount="<div class='dataTables_infot_1' id='sample-table-2_info' >共"+pageInfo.totalCount+"条,第"+pageInfo.pageNo+"页</div>";
				 }
				 $("#sub_page_totalCount_1").append(sub_page_totalCount);
			},
			error : function(msg) {
				ncms_alert("获取数据失败: " + msg);
			}
		});
	}

	function movePage_1(pageNo) {
		show_modal(pageNo);
	};
	//模态框数据双击	
	function sure(cust_id,custchname,khlx1) {
		document.getElementById("cust_id").value = cust_id;
		document.getElementById("custchname").value = custchname; 
		//parent.document.getElementById("khlx1").value = khlx1; 
		
		$("#Cust_Modal").modal('toggle');
		
	}
</script>

