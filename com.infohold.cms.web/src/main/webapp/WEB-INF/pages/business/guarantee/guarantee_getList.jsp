<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

		<div class="row">
			<div class="col-xs-12">
					<!--查询结果列表  -->
					<input type="hidden" id="contract_id" name="contract_id" value="${contract_id}">
						<div class="table-responsive">
											<div id="sample-table-2_wrapper" class="dataTables_wrapper"
												role="grid">
												<table id="sample-table-2"
													class="table table-striped table-bordered table-hover dataTable"
													aria-describedby="sample-table-2">
													<thead>
													<th>担保合同编号</th>
													<th>担保金额</th>
													<th>担保方式</th>
													<th>起始日期</th>
													<th>到期日期</th>
													<th>状态</th>
													<th>操作</th>
												</tr>
													</thead>
													<tbody>
														<c:forEach items="${guaranteeList}" var="guaranteeList" >
												<tr>
													<td>${guaranteeList.guarantee_id}</a></td>											
													<td>${guaranteeList.gua_amount}</td>
													<td>${guaranteeList.gua_name}</td>
													<td>${guaranteeList.start_date}</td>
													<td>${guaranteeList.end_date}</td>
													<td><span class="label label-sm label-warning">${guaranteeList.status_name}</span></td>
													<td>
													<!-- 列表按钮区域 -->
														<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
														<c:if test="${viewFlag==1}">
															<button type="button" class="btn btn-xs btn-primary" onclick="guarantee(2,${guaranteeList.guarantee_id})">编辑</button>
															<button type="button" class="btn btn-xs btn-primary" onclick="guarantee(3,${guaranteeList.guarantee_id},${viewFlag})">取消</button>
														</c:if>
														<button type="button" class="btn btn-xs btn-primary" onclick="guarantee(7,${guaranteeList.guarantee_id},${viewFlag})">查看</button>
														<button type="button" class="btn btn-xs btn-primary" onclick="guarantee(4,${guaranteeList.guarantee_id},${viewFlag})">保证人管理</button>
														<button type="button" class="btn btn-xs btn-primary" onclick="guarantee(5,${guaranteeList.guarantee_id},${viewFlag})">担保物管理</button>
														</div>
													</td>		
												</tr>
											</c:forEach>
													</tbody>
												</table>
											<c:if test="${viewFlag==1}">	
											<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
												<div class="row">
												<div class="col-sm-6">
												<a class="btn btn-sm btn-primary" onclick="guarantee(1)">新增</a>
												</div>
												</div>
									    	</div>
									    	</c:if>
								   </div> 
								   		
					<!--列表结束-->
				</div>
			</div>
		</div>
	
	
	<script type="text/javascript">
		/*********页面加载区域**********/
		jQuery(function($) {
			/* $('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
			}); */
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
		});
		function guarantee(obj,guarantee_id,viewFlag){
			var contract_id = document.getElementById("contract_id").value;
			if(obj==1){
			
				$.post("<%=path%>/mvc/guarantee_add.do?flag=1&contract_id="+contract_id, function(result) {
					$("#tabContent").html(result);
					setHash('${pageContext.request.contextPath}');
				});
				return;
			}
			

			if(obj==2){
				$.post("<%=path%>/mvc/guarantee_edit.do?flag=1&guarantee_id="+guarantee_id+"&contract_id="+contract_id, function(result) {
					$("#tabContent").html(result);
					setHash('${pageContext.request.contextPath}');
				});
			}
			if(obj==7){
				$.post("<%=path%>/mvc/guarantee_view.do?flag=1&guarantee_id="+guarantee_id+"&contract_id="+contract_id+"&viewFlag="+viewFlag, function(result) {
					$("#tabContent").html(result);
					setHash('${pageContext.request.contextPath}');
				});
			}
			if(obj==3){
				$.ajax({
					type : "POST",
					url : "<%=path%>/mvc/guarantee_cancle.do?guarantee_id="+guarantee_id+"&contract_id="+contract_id,
					async : false,
					success : function(data) {
						if(data.msg == "success"){
							$.post("<%=path%>/mvc/guarantee_getList.do?contract_id="+contract_id+"&viewFlag=1",function(result) {
								$("#tabContent").html(result);
							});
							
						}else if(data.msg == "2"){
							alert("担保合同下存在保证人或抵质押物，不可以取消");
							$.post("<%=path%>/mvc/guarantee_getList.do?contract_id="+contract_id+"&viewFlag=1",function(result) {
								$("#tabContent").html(result);
							});
						}
						else{
							f_alert("<%=path%>",data.msg,"");
						}
					},
					error : function(msg) {
						alert("修改保存失败: " + msg);
					}
				});
			}
			if(obj==4){
				$.post("<%=path%>/mvc/Guarantee_quertTorList.do?guarantee_id="+guarantee_id+"&contract_id="+contract_id+"&viewFlag="+viewFlag, function(result) {
					$("#tabContent").html(result);
					setHash('${pageContext.request.contextPath}');
				});
			}
			if(obj==5){
				$.post("<%=path%>/mvc/guarantee_quertColList.do?flag=1&guarantee_id="+guarantee_id+"&contract_id="+contract_id+"&viewFlag="+viewFlag, function(result) {
					$("#tabContent").html(result);
					setHash('${pageContext.request.contextPath}');
				});

			}
		}	

	</script>