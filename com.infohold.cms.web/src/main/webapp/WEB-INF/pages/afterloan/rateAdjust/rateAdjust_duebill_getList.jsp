<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>

		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				
				<form class="form-horizontal" id="queryForm" name="queryform"
				action="<%=path%>/mvc/rateAdjust_duebill_getList.do" method="post">
				<div class="form-group">
					<div class="col-md-1"></div>
					<label class="col-sm-1 control-label no-padding-right"
						for="contract_id"> 合同编号</label>
					<div class="col-sm-4">
						<input type="text" id="contract_id" class="col-xs-10 col-sm-5"
							name="contract_id" />
					</div>
					<label class="col-sm-1 control-label no-padding-right"
						for="product_name"> 产品名称</label>
					<div class="col-sm-4">
						<input type="text" id="product_name" class="col-xs-10 col-sm-5"
							name="product_name" />
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="form-group">
					<div class="col-md-1"></div>
					<label class="col-sm-1 control-label no-padding-right"
						for="cust_name"> 借据编号</label>
					<div class="col-sm-4">
						<input type="text" id="cust_name" class="col-xs-10 col-sm-5"
							name="cust_name" />
					</div>
					<label class="col-sm-1 control-label no-padding-right"
						for="status"> 审批状态</label>
					<div class="col-sm-4">
						<select class="col-xs-10 col-sm-5" id="status" name="status">
							<option value="">请选择...</option>
							<option value="0">已取消</option>
							<option value="1">待审批</option>
							<option value="2">审批中</option>
							<option value="3">审批通过</option>
							<option value="4">审批未通过</option>
							<option value="5">已生效</option>
							<option value="6">退回修改</option>
						</select>
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="form-group">
					<div class="col-md-1"></div>
					<!-- <label class="col-sm-1 control-label no-padding-right"
						for="pro_name"> 产品名称</label> -->
					<div class="col-sm-4">
						<!-- <input type="text" id="pro_name" class="col-xs-10 col-sm-5"
							name="pro_name" /> -->
					</div>
					<div class="col-sm-2"></div>
					<div class="col-sm-4">
						<button class="btn btn-sm btn-primary" onclick="toQry();"
							type="button">查询</button>
					</div>
				</div>
				<!-- /row 横线-->
				<div class="page-header"></div>
			</form>
				<div id="qryContent">
				<div id="sample-table-2_wrapper" class="dataTables_wrapper"
					role="grid">

					<table id="sample-table-2"
						class="table table-striped table-bordered table-hover dataTable"
						aria-describedby="sample-table-2">
						<thead>
							<tr>
							    <th>业务编号</th>
							    <th>借据编号</th>
								<th>合同编号</th>
								<th>客户名称</th>
								<th>产品名称</th>
								<th>借据金额</th>
								<th>借据起始日期</th>
								<th>借据到期日期</th>
								<th>客户经理</th>
								<th>申请时间</th>
								<th>审批状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${rsList}" var="rsList">
							<tr>
								<td>${rsList.rate_id}</td>
								<td>${rsList.biz_id}</td>
								<td>${rsList.contract_id}</td>
								<td>${rsList.cust_name}</td>
								<td>${rsList.product_name}</td>
								<td>${rsList.biz_amount}</td>
								<td>${rsList.start_date}</td>
								<td>${rsList.end_date}</td>
								<td>${rsList.cust_manager_name}</td>
								<td>${rsList.create_date}</td>
								<td>
									<c:if test="${rsList.status  == '0'}">已取消</c:if>
									<c:if test="${rsList.status  == '1'}">待审批</c:if>
									<c:if test="${rsList.status  == '2'}">审批中</c:if>
									<c:if test="${rsList.status  == '3'}">审批通过</c:if>
									<c:if test="${rsList.status  == '4'}">审批未通过</c:if>
									<c:if test="${rsList.status  == '5'}">已生效</c:if>
									<c:if test="${rsList.status  == '6'}">退回修改</c:if>
								</td>	
								<td>
									<div class="btn-group">
										<c:if test="${rsList.status  == '1' || rsList.status  == '6'}">
											<button class="btn btn-sm btn-primary" onclick="editEntity('${rsList.rate_id}');"
												type="button">修改</button>
											<button class="btn btn-sm btn-primary" onclick="approveEntity('${rsList.rate_id}');"
												type="button">提起审批</button>
											<button class="btn btn-sm btn-primary" onclick="stopEntity('${rsList.rate_id}');"
												type="button">取消</button>
										</c:if>
										<button class="btn btn-sm btn-primary" onclick="viewEntity('${rsList.rate_id}');"
												type="button">查看</button>
									</div>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row">
						<div class="col-sm-4">
							<div class="btn-group">
								<button class="btn btn-sm btn-primary" onclick="addEntity();"
									type="button">新增</button>
							</div>
						</div>
						<!-- 分页 -->
						<jsp:include page="../../common/page.jsp"></jsp:include>
					</div>
				</div>
				</div>
				</form>
			</div>
			<!-- PAGE CONTENT ENDS -->
		</div>
		
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
							<input type="hidden" id="rate_id" name="rate_id">
							<textarea rows="5" cols="30" id="reason_approve" name="reason_approve"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-primary" onclick="CallBackSubmit(this);">确定</button>
					<button type="button" class="btn btn-sm btn-default"
						onclick="hideModal();">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		jQuery(function($) {
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
		});
		//根据查询条件查看
		function toQry()
		{
			var param = $("#queryForm").serialize();
			param += "&qry_type=qry";
			$.post("rateAdjust_duebill_getList.do", param, function(result) {			
				$("#qryContent").html(result).hide();
				$("#qryContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		}
		function addEntity(){
			$.post("rateAdjust_duebill_add.do", param, function(result) {			
				$("#tabContent").html(result).hide();
				$("#tabContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		};
		function editEntity(rate_id){
			param={};
			param["rate_id"] = rate_id;
			$.post("rateAdjust_duebill_edit.do", param, function(result) {			
				$("#tabContent").html(result).hide();
				$("#tabContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		};
		function stopEntity(rate_id){		
			var param={};
			param["rate_id"]=rate_id;
			$.ajax({
    			type : "POST",
    			url : "<%=path%>/mvc/rateAdjust_stop.do",
    			data : param,
    			async : false,
    			success : function(data) {
    				if(data.msg == "success"){
	    				alert("取消成功");
	    				movePage($("#pageNo").val());
    				}else{
    					alert(data.msg);
    				}
    			},
    		});	
		};
		function viewEntity(rate_id){
			param={};
			param["rate_id"] = rate_id;
			$.post("rateAdjust_duebill_view.do", param, function(result) {			
				$("#tabContent").html(result).hide();
				$("#tabContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		};
		function approveEntity(rate_id){		
			showModal($("#myModal"));
			$(window.document).find("#rate_id").val(rate_id);
				
		};
		function CallBackSubmit(obj){
			var param={};
			param["rate_id"]=$(obj).closest("#myModal").find("#rate_id").val();
			param["reason_approve"]=$(obj).closest("#myModal").find("#reason_approve").val();
			$.ajax({
    			type : "POST",
    			url : "<%=path%>/mvc/rateAdjust_duebill_approve.do",
    			data : param,
    			async : false,
    			success : function(data) {
    				if(data.msg == "success"){
	    				alert("发起审批成功");
	    				movePage($("#pageNo").val());
    				}else{
    					alert(data.msg);
    				}
    			},
    		});		
			hideModal();
		}
	</script>
</body>
</html>
