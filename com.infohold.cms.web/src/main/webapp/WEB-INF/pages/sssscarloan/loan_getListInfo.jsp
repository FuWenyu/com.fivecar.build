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
								<th width="15%">车型名称</th>
								<th width="15%">金融机构</th>
								<th width="10%">裸车价</th>
								<th width="10%">首付</th>
								<th width="5%">首付百分比</th>
								<th width="10%">额外费用</th>
								<th width="12%">创建时间</th>
								<th width="13%">创建人</th>
								<th width="10%"></th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${loanList}" var="loanList">
								<tr>
									<td>${loanList.modelName}</td>
									<td>${loanList.lender}</td>
									<td>${loanList.carprice}</td>
									<td>${loanList.downpayment}</td>
									<td>${loanList.downPaymentPercent}</td>
									<td>${loanList.premium}</td>
									<td>${loanList.createDate}</td>
									<td>${loanList.createName}</td>
									<td>
										<!-- 列表按钮区域 -->
										<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
											<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${vehicleList.id}')">编辑</button>
											<button type="button" class="btn btn-xs btn-primary" onclick="deleteEntity('${vehicleList.id}')">删除</button>
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