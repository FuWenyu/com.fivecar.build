<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/commonList.jsp"></jsp:include>
<body id="iframe_body"
	onload="setHash('${pageContext.request.contextPath}')">
	<div id="iframeDiv" style="display: none"></div>
	<div class="page-content" id="loadPageContent">
		<!-- 行开始 -->
		<div class="row">
			<div class="col-xs-12">
				<!-- 查询条件begin -->
				<form class="form-horizontal" id="queryForm" name="queryForm"
					action="#" method="post">
					<input class="hidden" type="text" id="tradeCode" name="tradeCode"
						data-min="2" data-max="20" value="T33001" />
					<input class="hidden" type="text" id="pageNo" name="pageNo"
						data-min="2" data-max="20" value="${page.pageNo }" />
						
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-1"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 客户名称</label>
							<div class="col-sm-4">
								<input type="text" id="cust_name" class="col-xs-10 col-sm-5"
									name="cust_name" value="" />
							</div>
							<div class="col-md-0"></div>
							<label class="col-sm-1 control-label no-padding-right"
								for="form-field-2"> 借据编号</label>
							<div class="col-sm-4">
								<input type="text" id="duebill_id" class="col-xs-10 col-sm-5"
									name="duebill_id" value="" />
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
					<div class="row">
						<div class="form-group">
							<label class="col-sm-10 control-label no-padding-right"
								for="form-field-2"> </label>
							<div class="col-sm-1">
								<button class="btn btn-sm btn-primary" type="button"
									onclick="querySubmit();">查询</button>
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
					<!-- /row 横线-->
					<div class="page-header"></div>
				</form>
				<!-- 查询条件end -->
				<div class="row" id="result">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<div id="qryContent">
							<div class="table-responsive">
								<table id="sample-table-2"
									class="table table-striped table-bordered table-hover dataTable"
									aria-describedby="sample-table-2">
									<thead>
										<tr>
											<th>借据编号</th>
											<th>客户名称</th>
											<th>预分类贷款余额(元)</th>
											<th>本期预分类结果</th>
											<th>当前分类结果</th>
											<th>调整后分类结果</th>
											<th>调整时间</th>
											<th>是否为新增不良</th>
											<th>审批状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${loanClassAdjustList}"
											var="loanClassAdjustList">
											<tr>
												<td><a
													href="javascript:viewEntity(${loanClassAdjustList.duebill_id});">${loanClassAdjustList.duebill_id}</a></td>
												<td>${loanClassAdjustList.cust_name}</td>
												<td>${loanClassAdjustList.balance}</td>
												<td>${loanClassAdjustList.curr_batch_name}</td>
												<td>${loanClassAdjustList.curr_manual_name}</td>
												<td>${loanClassAdjustList.level_name}</td>
												<td>${loanClassAdjustList.create_date}</td>
												<td>
													<c:if test="${loanClassAdjustList.curr_level_manual<=2 }">
														<c:if test="${loanClassAdjustList.level<3}">
															否</c:if>
														<c:if test="${loanClassAdjustList.level>=3}">
															是</c:if>
													</c:if>
													<c:if test="${loanClassAdjustList.curr_level_manual>2 }">
														否
													</c:if>
												</td>
												<td class="hidden-240"><span
													class="label label-sm label-warning">${loanClassAdjustList.name_}</span>
												</td>
												<td><c:if test="${ loanClassAdjustList.status==0}">
														<button type="button" class="btn btn-sm btn-primary"
															onclick="upApprove(${loanClassAdjustList.adjust_id},${loanClassAdjustList.cust_id});">提起审批</button>
														<button type="button" class="btn btn-sm btn-primary"
															onclick="deleteEntity(${loanClassAdjustList.adjust_id});">取消分类调整</button>
													</c:if></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div id="sample-table-2_wrapper" class="dataTables_wrapper"
									role="grid">
									<div class="row">
										<div class="col-sm-4">
											<div class="btn-group">
												<button type="button" class="btn btn-sm btn-primary"
													onclick="addEntity();">新增分类调整</button>
											</div>
										</div>
										<jsp:include page="../common/page.jsp"></jsp:include>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 行结束-->
	</div>
	<!-- 提起审批 模态框 开始-->
	<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" onclick="hideModal();">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">发起审批意见</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12 center">
							<input type="hidden" id="adjust_id" name="adjust_id">
							<input type="hidden" id="cust_id" name="cust_id">
							<textarea rows="5" cols="30" id="reason_approve" 
								name="reason_approve"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-primary"
						onclick="callBackfunction(this);">提交</button>
					<button type="button" class="btn btn-sm btn-default"
						onclick="hideModal();">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 提起审批 模态框 结束-->
	<script type="text/javascript">
	function addEntity(){
		window.location="<%=path%>/mvc/loanClass_adjustAdd.do?tradeCode=T33002";
	}
	
	function viewEntity(contract_id,task_id){
		window.location="<%=path%>/mvc/business_contractTab.do?view=true&contract_id="+contract_id+"&task_id="+task_id;
	}
	
	//删除五级分类调整
	function deleteEntity(adjust_id){
		if(window.confirm('确定删除该五级分类调整？')){
			var param = {};
			param["tradeCode"] = "T33006";
			param["adjust_id"] = adjust_id;
			$.post("<%=path%>/mvc/loanClass_adjustDelete.do",param,function(result){
				movePage($("#pageNo").val());
			});
		}
	}
	
	//提起审批
	function upApprove(adjust_id,cust_id){
		showModal($("#myModal"));
		$(window.parent.document).find("#adjust_id").val(adjust_id);
		$(window.parent.document).find("#cust_id").val(cust_id);
	}
	
	//模态框回调提交
	function CallBackSubmit(obj){
		var param = {};
		param["tradeCode"] = "T33005";
		param["adjust_id"] = $(obj).closest("#myModal").find("#adjust_id").val();
		param["cust_id"] = $(obj).closest("#myModal").find("#cust_id").val();
		param["reason_approve"] = $(obj).closest("#myModal").find("#reason_approve").val();
		
		$.post("<%=path%>/mvc/loanClass_adjustApprove.do",param,function(result){
			if(result.reCode =="success") {
				alert("操作成功！");
				movePage($("#pageNo").val());
			}
			else
				alert("操作失败！"+result.expMsg);
		});
		hideModal();
	}
	
	//查询
	function querySubmit(){
		var param = $("#queryForm").serialize();
		param += "&qry_type=qry";
		$.post("loanClass_adjustList.do", param, function(result) {	
			$("#qryContent").html(result).hide();
			$("#qryContent").fadeIn('fast');
			setHash('${pageContext.request.contextPath}');
		});
	}
	</script>
</body>
</html>
