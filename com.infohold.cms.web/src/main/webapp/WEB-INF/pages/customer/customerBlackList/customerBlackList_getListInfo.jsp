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
				<th>客户编号</th>
				<th>客户名称</th>
				<th>申请类别</th>
				<th>申请状态</th>
				<th>申请时间</th>
				<th>申请人</th>
				<th>申请机构</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${customerBlackListList}" var="customerBlackListEntity">
									<tr>
										<td>${customerBlackListEntity.custid}</td>
										<td>${customerBlackListEntity.custname}</td>
										<td>${customerBlackListEntity.sqlb}</td>
										<td>${customerBlackListEntity.sqzt}</td>
										<td>${customerBlackListEntity.sqsj}</td>
										<td>${sqrmc}</td>
										<td>${sqjgmc}</td>
					<td>
						<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
												<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${customerBlackListEntity.xh}')">编辑</button>
												<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${customerBlackListEntity.xh}')">查看</button>
												<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${customerBlackListEntity.xh}')">取消</button>
												<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${customerBlackListEntity.xh}')">提交审批</button>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
		<div class="row">
			<div class="col-sm-4">
				<button class="btn btn-sm btn-primary" onclick="addEntity();" type="button">新增</button>
			</div>
			 <jsp:include page="../../common/page.jsp"></jsp:include>
	    </div>
    </div>
</div>
					