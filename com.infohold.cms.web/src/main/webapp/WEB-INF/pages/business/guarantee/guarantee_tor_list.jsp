<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>

		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<form id="form_sub" class="col-xs-12" action=""method="post">
							<input type="hidden" id="contract_id" name="contract_id" value="${contract_id}">
							<input type="hidden" id="guarantee_id" name="guarantee_id" value="${guaranteeEntrty.guarantee_id }">
							<input type="hidden" id="flag" name="flag" value="${flag}">
							<input type="hidden" value = "${contractEntrty.gua_type}" name = "contract_gua_type" id="contract_gua_type"></input>
							<input type="hidden" value = "${contractEntrty.amount}" name = "contract_amount" id="contract_amount"></input>
							<input type="hidden" value = "${contractEntrty.start_date}" name = "contract_start_date" id="contract_start_date"></input>
							<input type="hidden" value = "${contractEntrty.end_date}" name = "contract_end_date" id="contract_end_date"></input>
							<h1 class="breadcrumb">	
								<small>
									<span><h5><b>担保合同信息</b></h5></span>
								</small>
							</h1>
							<div class="row">
								
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 担保合同金额  </label>
										<div class="col-sm-4">
											<input type="text" id="guarantee_amount" 
												class="col-xs-10 col-sm-5" name="guarantee_amount" onblur="changeGua_amount()"
												value="${guaranteeEntrty.amount}" readonly="readonly"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 担保份额 </label>
										<div class="col-sm-4">
											<input type="text" id="gua_amount" 
												class="col-xs-10 col-sm-5" name="gua_amount" style="text-align:right"
												value="${guaranteeEntrty.gua_amount}" readonly="readonly"/>
										</div>
										
										<div class="col-md-1"></div>
									</div>
							</div> 
							<div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 保证形式 </label>
										<div class="col-sm-4">
											<select name="gua_form_List" id="gua_form_List"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${gua_form_List}" data-select-value="${guaranteeEntrty.gua_form}" disabled="disabled"></select>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 担保方式 </label>
										<div class="col-sm-4">
										<select name="gua_type_List_guarantee" id="gua_type_List_guarantee"  class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${gua_type_List_guarantee}" data-select-value="${guaranteeEntrty.gua_type}" disabled="disabled"></select>
										</div>
										
										<div class="col-md-1"></div>
									</div>
							</div>
							<div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 起始日期 </label>
										<div class="col-sm-4">
										<input type="text" id="start_date_gua" 
												class="date-picker col-xs-10 col-sm-5" name="start_date_gua" data-date-format="yyyy-mm-dd"
												value="${guaranteeEntrty.start_date}" disabled="disabled"/>
										</div>
										<div class="col-md-0"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 到期日期 </label>
										<div class="col-sm-4">
											<input type="text" id="end_date_gua" 
												class="date-picker col-xs-10 col-sm-5" name="end_date_gua" data-date-format="yyyy-mm-dd"
												value="${guaranteeEntrty.end_date}" disabled="disabled"/>
										</div> 
									</div>
										<div class="col-md-1"></div>
							</div>		
							<div class="row">
								<div class="space-6"></div>
									<div class="form-group">
										<div class="col-md-2"></div>
										<label class="col-sm-1 control-label no-padding-right"
											for="form-field-2"> 争议解决方式</label>
										<div class="col-sm-4">
											<select name="dispute_sol_List" id="dispute_sol_List"  disabled="disabled" class="col-xs-10 col-sm-5" data-emptyoption="false" data-select-list="${dispute_sol_List}" data-select-value="1"></select>
										</div>
										<div class="col-md-0"></div>
										
										<div class="col-md-1"></div>
									</div>
							</div>
							<div class="hr hr32 hr-dotted"></div>
							<div class="space-6"></div>
							<div class="span12">
								<%-- <div class="center">
										<button class="btn btn-sm btn-primary" type="button" onclick="go_back(${contract_id})">返回</button>
								</div> --%>	
							</div>																
				</form>
			</div>
		</div>
		<!-- 抵质押品列表 -->
				<div class="page-content">
					<div class="row-fluid">
						<form class="col-xs-12" id="queryForm" name="queryForm" 
							action="" method="post">
							<input type="hidden" id="contract_id" name="contract_id" value="${contract_id}">						
							<input class="hidden" type="text" name="pageNo_" id="pageNo_" data-min="2" data-max="20"/>
						</form>
							<!--查询结果列表  -->
								<div class="row">
									<div class="col-xs-12">
										<!-- PAGE CONTENT BEGINS -->
										<div class="table-responsive">
											<div id="sample-table-2_wrapper" class="dataTables_wrapper"
												role="grid">
												<table id="sample-table-2"
													class="table table-striped table-bordered table-hover dataTable"
													aria-describedby="sample-table-2">
													<thead>
												<tr>
													<th>保证人编号</th>
													<th>担保份额</th>
													<th>是否担保公司</th>
													<th>操作</th>
												</tr>
													</thead>
													<tbody>
														<c:forEach items="${list}" var="list_tor" >
												<tr>
													<td>${list_tor.guarantor_id}</td>							
													<td>${list_tor.gua_share}</td>
													<td>
														<c:if test="${list_tor.dbgs  == '0'}">否</c:if>
														<c:if test="${list_tor.dbgs  == '1'}">是</c:if>
													</td>
													<td>
													<!-- 列表按钮区域 -->
														<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
														<c:if test="${viewFlag==1}">
														<button type="button" class="btn btn-xs btn-primary" onclick="guarantee_bzr_cancle(${guaranteeEntrty.guarantee_id},${list_tor.guarantor_id})">取消</button>
														</c:if>
														</div>
													</td>
												</tr>
											</c:forEach>
													</tbody>
												</table>
										<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
											<div class="row">
											<div class="col-sm-6">
											<c:if test="${viewFlag==1}">
												<button type="button" class="btn btn-xs btn-primary" onclick="selectGuaTor(${guaranteeEntrty.guarantee_id})">关联担保公司</button>
												<button type="button" class="btn btn-xs btn-primary" onclick="selectTor(1)">关联保证人</button>
											</c:if>
											</div>
											</div>
									    </div>
									</div>
								   </div> 
								<!-- /.row -->
				<!--/// 查询结果列表  -->						
					</div>
				</div>
			</div>
		</div>
		 <jsp:include page="../guarantee/guarantee_tor_modal.jsp"></jsp:include><!-- 引担保公司信息 -->
		 <jsp:include page="../guarantee/guarantee_Bzr_modal.jsp"></jsp:include><!-- 引保证人信息 -->
	<!-- PAGE CONTENT ENDS -->
	<script type="text/javascript">
	jQuery(function($) {
		//加载下拉列表
		$("#gua_form_List").formComponents("select");
		$("#dispute_sol_List").formComponents("select");
		$("#gua_type_List_guarantee").formComponents("select");
		//Date Picker 控件
		$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		});
     })
     
function guarantee_bzr_cancle(guarantee_id,limitId){
	var contract_id = document.getElementById("contract_id").value;
	//取消
		$.ajax( {
			type : "POST",
			url : "<%=path%>/mvc/guarantee_bzr_cancle.do?guarantee_id="+guarantee_id+"&limitId="+limitId,
			data : $("#form_sub").serialize(),
			async : false,
			success : function(result) {
				if(result.msg=="success"){
					f_alert("<%=path%>","success","Guarantee_quertTorList.do?flag=1&guarantee_id="+guarantee_id+"&contract_id="+contract_id);
				}else{
					f_alert("<%=path%>",result.msg,"");			
					}
			},
				error : function(msg) {
					var exp="分配出错 " + msg;
					f_alert("<%=path%>",exp,"");
				}
		});
}
     
	</script>
