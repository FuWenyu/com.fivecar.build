<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
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
		   