<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
			<%-- <jsp:include page="../common/commonList.jsp"></jsp:include> --%>
			<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
					<table id="sample-table-2" class="table table-striped table-bordered table-hover dataTable" aria-describedby="sample-table-2">
						<thead>
							<tr>
								<th width="10%">经营品牌</th>
								<th width="15%">4s店名称</th>
								<th width="15%">联系电话</th>
								<th width="20%">地址</th>
								<th width="12%">创建时间</th>
								<th width="13%">创建人</th>
								<th width="15%"></th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${dealerList}" var="dealerList">
								<tr>
									<td>${dealerList.carbrand}</td>
									<td>${dealerList.dealerName}</td>
									<td>${dealerList.telephone}</td>
									<td>${dealerList.addr}</td>
									<td>${dealerList.createDate}</td>
									<td>${dealerList.createName}</td>
									<td>
										<!-- 列表按钮区域 -->
										<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
											<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${vehicleList.id}')">编辑</button>
											<button type="button" class="btn btn-xs btn-primary" onclick="deleteEntity('${vehicleList.id}')">删除</button>
											<button type="button" class="btn btn-xs btn-primary" onclick="addSalesEntity();">添加销售员</button>
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
						<jsp:include page="../common/page.jsp"></jsp:include>
					</div>
				</div>
			<script type="text/javascript">
			function viewFile(from_url,file_name){
			window.open("<%=path%>/upload/image/"+file_name);
			}	
			</script>