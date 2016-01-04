<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<div id="sample-table-2_wrapper" class="dataTables_wrapper"role="grid">
	<table id="sample-table-2" class="table table-striped table-bordered table-hover dataTable"
		aria-describedby="sample-table-2">
		<thead>
			<tr>
				<th>客户编号</th>
				<th>客户名称</th>
				<th>组织机构代码</th>
				<th>文件类型</th>
				<th>文件号码</th>
				<th>维护日期</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${customerList}" var="customerList">
				<tr>
					<td>
						<a href="javascript:viewEntity('${customerList.id}')" >${customerList.cust_id}</a>
					</td>
					<td>${customerList.custchname}</td>
					<td>${customerList.organizationcode}</td>
					<td><fmt:message key='cor_id_type.${customerList.file_type}' /></td>
					<td>${customerList.file_number}</td>
					<td>${customerList.update_date}</td>
					<td><div class="btn-group">
						<button class="btn btn-sm btn-primary" onclick="editEntity('${customerList.id}')" type="button">维护</button>
						<button class="btn btn-sm btn-primary" onclick="deleteEntity('${customerList.id}')" type="button">删除</button>
					</div></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
		<div class="row">
			<div class="col-sm-4">
				
			</div>
			 <jsp:include page="../../common/page.jsp"></jsp:include>
	    </div>
    </div>
</div>
				