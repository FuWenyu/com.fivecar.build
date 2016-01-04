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
								<th width="15%">版本号</th>
								<th width="15%">系统标记</th>
								<th width="10%">启用状态</th>
								<th width="20%">更新时间</th>
								<th width="20%">版本地址</th>
								<th width="20%"></th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${versionList}" var="versionList">
								<tr>
									<td>${versionList.version_no}</td>
									<td>${versionList.version_flag}</td>
									<td>${versionList.version_online}</td>
									<td>${versionList.version_date}</td>
									<td>${versionList.version_url}</td>
									<td>
										<!-- 列表按钮区域 -->
										<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
<!-- 											<button type="button" class="btn btn-xs btn-primary" onclick="addversionEntity()">新增</button> -->
											<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${versionList.version_id}')">查看</button>
											<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${versionList.version_id}')">编辑</button>
											<button type="button" class="btn btn-xs btn-primary" onclick="deleteEntity('${versionList.version_id}')">删除</button>
											
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
							 	<button class="btn btn-sm btn-primary" onclick="addversionEntity();"
									type="button">新增</button> 
							</div>
						</div>
						<!-- 分页 -->
						<jsp:include page="../common/page.jsp"></jsp:include>
					</div>
				</div>