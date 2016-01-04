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
								<th width="15%">名称</th>
								<th width="15%">标题</th>
								<th width="20%">用途</th>
								<th width="15%">创建时间</th>
								<th width="20%">创建人</th>
								<th width="10%"></th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${pictureList}" var="pictureList">
								<tr>
									<td>
										<label class='filelist col-sm-12'><a href="javascript:viewFile('${pictureList.id }','${pictureList.imageName}')">${pictureList.imageName}</a></label>
										<%-- <img alt="as" src="<%=path%>/upload/goodsimg/${pictureList.id }/${pictureList.file_name}"> --%>
										<%-- <a href="javascript:void(0)" onclick="viewFile('${pictureList.id }','${pictureList.file_name}')"> ${pictureList.picture_name}</a> --%>
									</td>
									<%-- <td>${pictureList.from_url}</td> --%>
									<td>${pictureList.title}</td>
									<td>${pictureList.usefo}</td>
									<td>${pictureList.createDate}</td>
									<td>${pictureList.createName}</td>
									<td>
										<!-- 列表按钮区域 -->
										<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
											<%-- <button type="button" class="btn btn-xs btn-primary" onclick="addversionEntity()">新增</button>
											<button type="button" class="btn btn-xs btn-primary" onclick="viewEntity('${pictureList.id}')">查看</button> --%>
											<button type="button" class="btn btn-xs btn-primary" onclick="editEntity('${pictureList.id}')">编辑</button>
											<button type="button" class="btn btn-xs btn-primary" onclick="deleteEntity('${pictureList.id}')">删除</button>
											
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
							 	<button class="btn btn-sm btn-primary" onclick="addPictureEntity();"
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