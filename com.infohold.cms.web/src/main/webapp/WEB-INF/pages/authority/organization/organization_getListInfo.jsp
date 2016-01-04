<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
	<table id="sample-table-2"
		class="table table-striped table-bordered table-hover dataTable" aria-describedby="sample-table-2">
		<thead>
			<tr>
				<th>机构编号</th>
				<th>机构名称</th>
				<th>上级机构编号</th>
				<th>机构等级</th>
				<th>操作</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${organizationList}" var="organizationEntity">
				<tr>
					<td>${organizationEntity.orgid}</td>
					<td>${organizationEntity.name}</td>
					<td>${organizationEntity.porgid}</td>
					<td>${organizationEntity.orgtype}</td>
					<td>
						<!-- 列表按钮区域 -->
						<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
							<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${organizationEntity.id}')">编辑</button>
							<button type="button" class="btn btn-xs btn-primary" onclick="deleteEntity('${organizationEntity.id}')">删除</button>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="row">
		<div class="col-sm-4">
		<div class="btn-group">
				<!-- 列表底部按钮区域 -->
				<button class="btn btn-sm btn-primary" onclick="addEntity();" type="button">新增</button>
			</div>
		</div>
		<!-- 分页 -->
		<jsp:include page="../../common/page.jsp"></jsp:include>
	</div>
</div>