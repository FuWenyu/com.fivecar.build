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
				<form id="sub_form" class="col-xs-12" action="" method="post">
				<input class="hidden" type="text" id="tradeCode" name="tradeCode"
					data-min="2" data-max="20" value="T33004" /> 
				<input class="hidden" type="text" name="class_id" id="class_id"
					data-min="2" data-max="20" value="" /> 
					<h1 class="breadcrumb">	
						<small>
							<span><h5><b>基本信息</b></h5></span>
						</small>
					</h1>
					<div class="row">
						<div class="form-group">
							<div class="col-md-2"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 客户编号 </label>
							<div class="col-sm-4">
								<input type="text" id="cust_id" placeholder="" readonly="readonly"
									class="col-xs-10 col-sm-5" name="cust_id" 
									value="" />
							</div>
							<div class="col-md-0"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 客户名称 </label>
							<div class="col-sm-4">
							<input type="text" id="cust_name"  placeholder="" readonly="readonly"
									class="col-xs-10 col-sm-5" name="cust_name" 
									value="" />
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
					<div class="space-6"></div>
					<div class="row">
						<div class="form-group">
							<div class="col-md-2"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 借据编号 </label>
							<div class="col-sm-4">
								<input type="text" id="duebill_id" placeholder="请点击选择五级分类记录"
									class="col-xs-10 col-sm-5" name="duebill_id"
									onclick="show('classModal');" value="" />
							</div>
							<div class="col-md-0"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 贷款余额(元)</label>
							<div class="col-sm-4"> 
							<input type="text" id="balance"  placeholder="" readonly="readonly"
									class="col-xs-10 col-sm-5" name="balance" value="" />
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
					<div class="space-6"></div>
					<div class="row">
						<div class="form-group">
							<div class="col-md-2"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 上期分类结果 </label>
							<div class="col-sm-4">
								<input type="text" id="last_level" readonly="readonly"
									class="col-xs-10 col-sm-5" name="last_level" value="" />
							</div>
							<div class="col-md-0"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 本期预分类结果 </label>
							<div class="col-sm-4">
							<input type="text" id="curr_level_batch"  readonly="readonly"
									class="col-xs-10 col-sm-5" name="curr_level_batch"  value="" />
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
					<div class="row">
						<div class="form-group">
							<div class="col-md-2"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 当前分类结果 </label>
							<div class="col-sm-4">
								<input type="text" id="curr_level_manual"
									class="col-xs-10 col-sm-5" name="curr_level_manual"
									readonly="readonly" value="" />
							</div>
							<div class="col-md-0"></div>
							<div class="col-sm-4">
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
					<div class="page-header"></div>
					<h1 class="breadcrumb">	
						<small>
							<span><h5><b>分类描述信息</b></h5></span>
						</small>
					</h1>
					<div class="row" id = "corporate">
						<div class="form-group">
							<div class="col-md-2"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 调查后分类 </label>
							<div class="col-sm-4">
								<select name="level" id="level" class="col-xs-10 col-sm-5 abc"
									data-emptyoption="false"
									data-select-value="${contractEntrty.product_code  }"
									data-select-list="${classLevelList }">
								</select> 
							</div>
							<div class="col-md-0"></div>
							<div class="col-sm-4"></div>
							<div class="col-md-1"></div>
						</div>
					</div>
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-2"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 借款人经营条件分析</label>
							<div class="col-sm-4">
								<textarea rows="2" cols="78" id="jkrjyqkfx"
									name="jkrjyqkfx" maxlength="512"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-2"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 担保分析</label>
							<div class="col-sm-4">
								<textarea rows="2" cols="78" id="dbfx" name="dbfx"
									maxlength="512"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-2"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 还款来源</label>
							<div class="col-sm-4">
								<textarea rows="2" cols="78" id="hkly" name="hkly"
									maxlength="512"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-2"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 清收计划</label>
							<div class="col-sm-4">
								<textarea rows="2" cols="78" id="qsjh" name="qsjh"
									maxlength="512"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-2"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 保全措施</label>
							<div class="col-sm-4">
								<textarea rows="2" cols="78" id="bqcs" name="bqcs"
									maxlength="512"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-2"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 趋势预测</label>
							<div class="col-sm-4">
								<textarea rows="2" cols="78" id="qsyc" name="qsyc"
									maxlength="512"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-2"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 监管情况</label>
							<div class="col-sm-4">
								<textarea rows="2" cols="78" id="jgqk" name="jgqk"
									maxlength="512"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-2"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 操作风险</label>
							<div class="col-sm-4">
								<textarea rows="2" cols="78" id="czfx" name="czfx"
									maxlength="512"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-2"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 分类意见</label>
							<div class="col-sm-4">
								<textarea rows="2" cols="78" id="flyj" name="flyj"
									maxlength="512"></textarea>
							</div>
						</div>
					</div>
					<div class="page-header"></div>
					<div class="center">
						<button class="btn btn-sm btn-primary" type="button"
							onclick="javascript:Add();">保存</button>
						<button class="btn btn-sm btn-primary" type="button"
							onclick="javascript:history.go(-1);">返回</button>
					</div>
					</form>
			</div>
		</div>
	</div>
	<!-- 五级分类模态框 -->
	<div class="modal fade bs-example-modal-lg" id="classModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" onclick="hideModal();">
						<span aria-hidden="true">&times;</span>
						<span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">选择五级分类记录</h4>
				</div>
				<div class="modal-body">
				<form action="#" id = "form_1" name ="form_1" method="post">
				<div class="row">
					<div class="form-group">
					<div class="col-sm-1"></div>
						<label class="col-sm-1 control-label no-padding-right"
							for="form-field-1"> 客户名称 </label>
						<div class="col-sm-4">
							<input type="text" id="cust_name"  
								class="col-xs-10 col-sm-5" name="cust_name" 
								data-toggle="modal" data-target="#myModal"
								value="" />
						</div>
						<label class="col-sm-1 control-label no-padding-right"
							for="form-field-1"> 借据编号</label>
						<div class="col-sm-3">
							<input type="text" id="duebill_id"  
								class="col-xs-10 col-sm-5" name="duebill_id" 
								data-toggle="modal" data-target="#myModal"
								value="" />
						</div>
						<div class="col-sm-1">
							<button class="btn btn-sm btn-primary" type="button"
								onclick="javaScript:loadMainContent.window.show_modal_query(1,$('#cust_name').val(),$('#duebill_id').val());">查询</button>
						</div>
					<div class="col-sm-1"></div>
					</div>
				</div>
				<div class="space-6"></div>
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
											<th class="center"><label> <input type="checkbox"
												class="ace ace-checkbox-2" />
												<span class="lbl"></span></label></th>
											<th>项目编号</th>
											<th>客户名称</th>
											<th>预分类贷款余额</th>
											<th>上期分类结果</th>
											<th>本期预分类结果</th>
											<th>当前分类结果</th>
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
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-default"
						onclick="javascript:loadMainContent.window.CallBackSubmit();">确认</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	jQuery(function($){
		$("#level").formComponents("select");
	});
	function Add(){
		if (!checkData('jkrjyqkfx', '借款人经营情况分析', 'input')) {
			return;
		}
		if (!checkData('dbfx', '担保分析', 'input')) {
			return;
		}
		if (!checkData('hkly', '还款来源', 'input')) {
			return;
		}
		if (!checkData('qsjh', '清收计划', 'input')) {
			return;
		}
		if (!checkData('bqcs', '保全措施', 'input')) {
			return;
		}
		if (!checkData('qsyc', '趋势预测', 'input')) {
			return;
		}
		if (!checkData('jgqk', '监管情况', 'input')) {
			return;
		}
		if (!checkData('czfx', '操作风险', 'input')) {
			return;
		}
		if (!checkData('flyj', '分类意见', 'input')) {
			return;
		}
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/loanClass_adjustAddSave.do",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.reCode == "success"){
					alert("保存成功！");
					window.location = "<%=path%>/mvc/loanClass_adjustList.do?tradeCode=T33001";
				}else{
					alert("保存失败！"+data.expMsg);
				}
			},
			error : function(msg) {
				alert("保存出错  " + msg);
			}
		});
	}	
	function show(obj){
		showModal($("#"+obj));
	}
	show_modal(1);
	function show_modal(pageNo) {
		$(".sub_data_tr_1").remove();
			$.ajax( {
				type : "POST",
				url : "${pageContext.request.contextPath}/mvc/loanClass_loanClassList.do?tradeCode=T33003&pageNo="+pageNo,
				async : false,
				success : function(obj) {
					var pageInfo=obj[0];//分页信息
					var loanClassList=obj[1];//结果信息
					$(loanClassList).each(function(index){//输出结果集到表格，此处根据各自需要修改
						var str="<tr class=\"sub_data_tr_1\" >";
						str=str + "<td class=\"center\"><label> <input type=\"checkbox\" name=\"checkbox\" class=\"ace ace-checkbox-2\" value='"
							+loanClassList[index].cust_id+","+loanClassList[index].cust_name+","
							+loanClassList[index].duebill_id+","+loanClassList[index].balance+","
							+loanClassList[index].last_level_name+","+loanClassList[index].curr_batch_name+","
							+loanClassList[index].curr_manual_name+","+loanClassList[index].class_id
							+"' /><span class=\"lbl\"></span></label></td>";
						str=str + "<td>"+loanClassList[index].duebill_id+"</td>";
						str=str + "<td>"+loanClassList[index].cust_name+"</td>";
						str=str + "<td>"+loanClassList[index].balance+"</td>";
						str=str + "<td>"+loanClassList[index].last_level_name+"</td>";
						str=str + "<td>"+loanClassList[index].curr_batch_name+"</td>";
						str=str + "<td>"+loanClassList[index].curr_manual_name+"</td>";
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
					$("#sub_page_1").append(str_page);				 
					 var sub_page_totalCount="";
					 if(pageInfo.totalCount > 0){
						 sub_page_totalCount="<div class='dataTables_infot_1' id='sample-table-2_info' >共"+pageInfo.totalCount+"条,第"+pageInfo.pageNo+"页</div>";
					 }
					 $("#sub_page_totalCount_1").append(sub_page_totalCount);	
				},
				error : function(msg) {
					alert("获取数据失败: " + msg);
				}
			});
		}
	function show_modal_query(pageNo,cust_name,duebill_id) {
		parent.window.$(".sub_data_tr_1").remove();
			$.ajax( {
				type : "POST",
				url : "${pageContext.request.contextPath}/mvc/loanClass_loanClassList.do?tradeCode=T33003&pageNo="+pageNo+"&cust_name="+cust_name+"&duebill_id="+duebill_id,
				async : false,
				success : function(obj) {
					var pageInfo=obj[0];//分页信息
					var loanClassList=obj[1];//结果信息
					$(loanClassList).each(function(index){//输出结果集到表格，此处根据各自需要修改
						var str="<tr class=\"sub_data_tr_1\" >";
						str=str + "<td class=\"center\"><label> <input type=\"checkbox\" name=\"checkbox\" class=\"ace ace-checkbox-2\" value='"
							+loanClassList[index].cust_id+","+loanClassList[index].cust_name+","
							+loanClassList[index].duebill_id+","+loanClassList[index].balance+","
							+loanClassList[index].last_level_name+","+loanClassList[index].curr_batch_name+","
							+loanClassList[index].curr_manual_name+","+loanClassList[index].class_id
							+"' /><span class=\"lbl\"></span></label></td>";
						str=str + "<td>"+loanClassList[index].duebill_id+"</td>";
						str=str + "<td>"+loanClassList[index].cust_name+"</td>";
						str=str + "<td>"+loanClassList[index].balance+"</td>";
						str=str + "<td>"+loanClassList[index].last_level_name+"</td>";
						str=str + "<td>"+loanClassList[index].curr_batch_name+"</td>";
						str=str + "<td>"+loanClassList[index].curr_manual_name+"</td>";
						str=str + "</tr>";
						parent.window.$("#sub_data_1").append(str);
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

		function movePage_1(pageNo) {
			show_modal_query(pageNo,$("cust_name").val(),$("duebill_id").val());
		};
		function CallBackSubmit() {
			var obj="";
			var array = parent.document.getElementsByName("checkbox");
			for(var i=0;i<array.length;i++){
				if(array[i].checked){
					obj = array[i].value;
					break;
				}
			}
			if(obj==""){
				alert("请选择一条记录");
				return false;
			}
			var objs = obj.split(",");
			document.getElementById("cust_id").value = objs[0];
			document.getElementById("cust_name").value = objs[1]; 
			document.getElementById("duebill_id").value = objs[2];
			document.getElementById("balance").value = objs[3];
			document.getElementById("last_level").value = objs[4]; 
			document.getElementById("curr_level_batch").value = objs[5]; 
			document.getElementById("curr_level_manual").value = objs[6]; 
			document.getElementById("class_id").value = objs[7]; 
			hideModal();
		}
	</script>
</body>
</html>
