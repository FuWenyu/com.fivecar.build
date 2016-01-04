<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

											<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
											<input type="hidden" id="id" name="id" />
												<table id="sample-table-2"
													class="table table-striped table-bordered table-hover dataTable"
													aria-describedby="sample-table-2">
													<thead>
													<tr>
													<th>选择</th>
													<th>业务编号</th>
													<th>客户名称</th>
													<th>产品名称</th>
													<th>申请金额</th>
													<th>担保方式</th>
													<th>循环标志</th>
													<th>申请状态</th>
													<th>操作</th>
												</tr>
													</thead>
													<tbody>
														<c:forEach items="${bizBussinessList}" var="bizBusinessEntity" >
												<tr>
													<td>
													<input type="checkbox" id="checkbox" name="checkbox"  onclick="getId()" value="${bizBusinessEntity.businessid}" style="zoom:100%;">
													</td>
													<td>${bizBusinessEntity.businessid}</td>
													<td>${bizBusinessEntity.custname}</td>
													<td>${bizBusinessEntity.prodname}</td>
													<td>${bizBusinessEntity.amount}</td>
													<td>${bizBusinessEntity.zydbfs}</td>
													<td>${bizBusinessEntity.xhbz}</td>
													<td><span class="label label-sm label-warning">${bizBusinessEntity.status_name}</span></td>
													<td>
													<!-- 列表按钮区域 -->
														<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
												<button type="button" class="btn btn-xs btn-primary"
													onclick="editEntity('${bizBusinessEntity.businessid}','${bizBusinessEntity.sqzt}','${bizBusinessEntity.zydbfsvalue}')">编辑</button>
												<button type="button" class="btn btn-xs btn-primary"
													onclick="viewEntity('${bizBusinessEntity.businessid}','${bizBusinessEntity.sqzt}','${bizBusinessEntity.zydbfsvalue}')">查看</button>
												<button type="button" class="btn btn-xs btn-primary"
													onclick="deleteEntity('${bizBusinessEntity.businessid}','${bizBusinessEntity.sqzt}')">取消</button>
												<button type="button" class="btn btn-xs btn-primary"
													onclick="startWork('${bizBusinessEntity.bfrkbz}','${bizBusinessEntity.businessid}','${bizBusinessEntity.sqzt}','${bizBusinessEntity.bzxs}','${bizBusinessEntity.bzrsl}','${bizBusinessEntity.dbje}','${bizBusinessEntity.amount}','${bizBusinessEntity.zydbfs}')">发起补录</button>
												<button type="button" class="btn btn-xs btn-primary"
													onclick="editFsxx('${bizBusinessEntity.businessid}','${bizBusinessEntity.sqzt}','${bizBusinessEntity.zydbfs}')">附属信息管理</button>
												<button type="button" class="btn btn-xs btn-primary"
													onclick="yingxiang('${bizBusinessEntity.businessid}','${bizBusinessEntity.sqzt}')">上传影像</button>
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
														<button class="btn btn-sm btn-primary" onclick="yingxiangck();" type="button">查看影像</button>
													</div>
												</div>
												<!-- 分页 -->
												<jsp:include page="../../common/page.jsp"></jsp:include>
											</div>
									</div>				