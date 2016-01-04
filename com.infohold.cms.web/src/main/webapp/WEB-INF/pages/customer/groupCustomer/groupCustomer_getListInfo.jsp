<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<div id="sample-table-2_wrapper" class="dataTables_wrapper"role="grid">
	<table id="sample-table-2"
		class="table table-striped table-bordered table-hover dataTable"
		aria-describedby="sample-table-2">
		<thead>
			<tr>
				<th>集团编号</th>
				<th>集团名称</th>
				<th>组织机构代码</th>
				<th>创建日期</th>
				<th>维护日期</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${groupCustomerList}" var="groupCustomerList">
				<tr>
					<td>
						<a href="javascript:viewEntity('${groupCustomerList.groupid}')" >${groupCustomerList.groupid}</a>
					</td>
					<td>${groupCustomerList.groupname}</td>
					<td>${groupCustomerList.organizationcode}</td>
					<td>${groupCustomerList.create_date}</td>
					<td>${groupCustomerList.update_date}</td>
					<td><div class="btn-group">
						<button class="btn btn-sm btn-primary" onclick="editEntity('${groupCustomerList.groupid}');" type="button">维护</button>
						<button class="btn btn-sm btn-primary" onclick="CYGL('${groupCustomerList.groupid}')" type="button">成员管理</button>
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
				