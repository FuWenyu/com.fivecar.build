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
				<th>角色编号</th>
				<th>角色名称</th>
				<th>操作</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${roleList}" var="roleEnity">
				<tr>
					<td>${roleEnity.role_code}</td>
					<td>${roleEnity.name}</td>
					<td>
						<!-- 列表按钮区域 -->
						<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
							<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${roleEnity.id}')">编辑</button>
							<button type="button" class="btn btn-xs btn-primary" onclick="deleteEntity('${roleEnity.id}')">删除</button>
							<button type="button" class="btn btn-xs btn-primary" onclick="roleMenu('${roleEnity.id}')">配置菜单</button>
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