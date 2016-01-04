<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
			<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
					<table id="sample-table-2" class="table table-striped table-bordered table-hover dataTable" aria-describedby="sample-table-2">
						<thead>
							<tr>
								<th width="25%">登录ID</th>
								<th width="25%">用户名称</th>
								<th width="25%">登录状态</th>
								<th width="25%"></th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${userList}" var="userList">
								<tr>
									<td>${userList.loginid}</td>
									<td>${userList.name}</td>
									<td>
										<c:if test="${userList.status == '0'}">离线</c:if>
										<c:if test="${userList.status == '1'}">在线</c:if>
									</td>
									<td>
										<!-- 列表按钮区域 -->
										<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
											<%-- <a class="blue" href="#" title="编辑用户" onclick="editEntity('${userList.userid}')"> <i class="icon-edit bigger-130"></i></a> 
											<a class="red" href="#" title="删除用户" onclick="deleteEntity('${userList.userid}')"> <i class="icon-trash bigger-130"></i></a> --%>
											<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${userList.userid}')">查看</button>
											<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${userList.userid}')">编辑</button>
											<button type="button" class="btn btn-xs btn-primary" onclick="deleteEntity('${userList.userid}')">删除</button>
											<button type="button" class="btn btn-xs btn-primary" onclick="resetPwd('${userList.userid}')">密码重置</button>
											<button type="button" class="btn btn-xs btn-primary" onclick="setOffline('${userList.userid}')">置离线</button>
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
								<button class="btn btn-sm btn-primary" onclick="addEntity();"
									type="button">新增</button>
							</div>
						</div>
						<!-- 分页 -->
						<jsp:include page="../../common/page.jsp"></jsp:include>
					</div>
				</div>