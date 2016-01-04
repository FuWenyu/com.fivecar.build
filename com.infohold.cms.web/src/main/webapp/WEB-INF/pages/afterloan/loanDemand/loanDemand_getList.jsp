<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
	<jsp:include page="../../common/commonList.jsp"></jsp:include>
	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<!-- 行开始 -->
		<div class="row">
			<div class="col-xs-12">
			    <!-- 查询条件begin -->
				<form class="form-horizontal" id="queryForm"  name="queryForm" action="<%=path%>/mvc/loanDemad_getList.do" method="post">
                   <div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-1"></div>
							<label class="col-sm-1 control-label no-padding-right" for="cust_name"> 客户名称</label>
							<div class="col-sm-4">
								<input type="text" id="cust_name" class="col-xs-10 col-sm-5" name="cust_name" value="" />
							</div>
							<div class="col-md-0"></div>
							<label class="col-sm-1 control-label no-padding-right" for="cust_id"> 客户编号</label>
							<div class="col-sm-4">
								<input type="text" id="cust_id" class="col-xs-10 col-sm-5" name="cust_id" value="" />
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
					<div class="space-3"></div>
					<div class="row">
						<div class="space-6"></div>
						<div class="form-group">
							<div class="col-md-1"></div>
							<label class="col-sm-1 control-label no-padding-right" for="contract_no"> 合同编号</label>
							<div class="col-sm-4">
								<input type="text" id="contract_no" class="col-xs-10 col-sm-5" name="contract_no" value="" />
							</div>
							<label class="col-sm-1 control-label no-padding-right" for="duebill_acct"> 借据编号</label>
							<div class="col-sm-4">
								<input type="text" id="duebill_acct" class="col-xs-10 col-sm-5" name="duebill_acct" value="" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group">
							<label class="col-sm-10 control-label no-padding-right" for="form-field-2"> </label>
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
		    <div class="row" id = "result">
				<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
					<div id="qryContent">	
		   			 	<div class="table-responsive">
								<input type="hidden" id="checkboxID" name="checkboxID" /> 
							<table id="sample-table-2" class="table table-striped table-bordered table-hover dataTable" aria-describedby="sample-table-2">
								<thead>
									<tr>
										<th class="center">
										<label>
											<input type="checkbox" class="ace" id="checkboxAll"	name="checkboxAll" onclick="selectAll(this)"/> <span class="lbl"></span>
										</label>
										</th>
										<th>借据编号</th>
										<th>合同编号</th>
										<th>客户编号</th>
										<th>客户名称</th>
										<th>产品名称</th>
										<th>合同金额(元)</th>
										<th>借据金额(元)</th>
										<th>币种</th>
										<th>借据起始日期</th>
										<th>借据终止日期</th>
										<th>申请机构</th>
										<th>客户经理</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${contractList}" var="contractList">
											<tr>
												<td class="center">
													<label> 
													<input type="checkbox" class="ace"  id="checkbox" name="checkbox" value="${contractList.duebill_acct}" onclick="selectOne(this)" /> <span class="lbl"></span>
													</label>
												</td>
												<td>${contractList.duebill_acct}</td>
												<td>${contractList.con_acct}</td>
												<td>${contractList.custid}</td>
												<td>${contractList.cust_name}</td>
												<td>${contractList.product_name}</td>
												<td>${contractList.amount}</td>
												<td>${contractList.duebill_amount}</td>
												<td><c:if test="${contractList.currency==null}">人民币</c:if>${contractList.currency}</td>
												<td>${contractList.start_date}</td>
												<td>${contractList.end_date}</td>
												<td>${contractList.branch_noname}</td>
												<td>${contractList.cust_managername}</td>
											</tr>
									</c:forEach>
								</tbody>
							</table>
					<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
					   <div class="row">
							<div class="col-sm-4">
								<div class="btn-group">
									<!-- 列表底部按钮区域 -->
									<button class="btn btn-sm btn-primary" onclick="CSXX();"
										type="button">催收信息</button>
								</div>
							</div>
							<!-- 分页 -->
							<jsp:include page="../../common/page.jsp"></jsp:include>
						</div>
					</div>
						 </div>
					</div>
		       </div>
		    </div>
		</div><!-- 行结束-->
	</div>
	</div>
	<script src="<%=path%>/js/ncms.common.js"></script>
	<script type="text/javascript">
	function querySubmit(){
		var param = $("#queryForm").serialize();
		param += "&qry_type=qry";
		$.post("loanDemad_getList.do", param, function(result) {			
			$("#qryContent").html(result).hide();
			$("#qryContent").fadeIn('fast');
			setHash('${pageContext.request.contextPath}');
		});
		
	}
	//跳转至新增页面
	function CSXX(){
		var duebill_acct = $("#checkboxID").val();
			if(duebill_acct == ""){
				cms_alert("<%=path%>","请选择一条记录！","");
				return false;
			}
		window.location="<%=path%>/mvc/loanDemand_get.do?duebill_acct="+duebill_acct;
	};
	</script>
</body>
</html>
