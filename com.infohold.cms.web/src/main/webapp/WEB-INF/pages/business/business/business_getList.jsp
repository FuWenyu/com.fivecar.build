<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8" />
	<!-- basic styles -->
	<link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="<%=path%>/css/font-awesome.min.css" />
	<link rel="stylesheet" href="<%=path%>/css/ace-fonts.css" />
	<link rel="stylesheet" href="<%=path%>/css/ace.min.css" />
	<link rel="stylesheet" href="<%=path%>/css/ace-rtl.min.css" />
	<link rel="stylesheet" href="<%=path%>/css/ace-skins.min.css" />
	<link rel="stylesheet" href="<%=path%>/css/datepicker.css" />
	<link rel="stylesheet" href="<%=path%>/css/bootstrap-timepicker.css" />
	<link rel="stylesheet" href="<%=path%>/css/daterangepicker.css" />
	<link rel="stylesheet" href="<%=path%>/css/jquery-ui-1.10.3.full.min.css" />
	<script src="<%=path%>/js/ace-extra.min.js"></script>
	</head>
	<!-- 该页面为iframe嵌套页面，以下代码用于计算iframe高度，不允许修改：
			<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
			<div id="iframeDiv" style="display:none"></div>
			<div class="page-content" id="loadPageContent">
	-->
	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				<!-- 查询条件begin -->
						<form class="col-xs-12" id="queryForm" name="queryForm" action="" method="post">
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 客户编号 </label>
									<div class="col-sm-4">
										<input type="text" id="custid" placeholder="" data-toggle="modal" data-target="#myModal"
											class="col-xs-10 col-sm-5" name="custid" />
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 产品名称 </label>
									<div class="col-sm-4">
									<select name="pro_List" id="pro_List"  class="col-xs-10 col-sm-5" data-emptyoption="true" data-select-list="${pro_List}" data-select-value=""></select>
									</div>
									<div class="col-md-1"></div>
								</div>
							</div>
							<div class="row">
								<div class="space-6"></div>
								<div class="form-group">
									<div class="col-md-1"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 客户名称 </label>
									<div class="col-sm-4">
										<input type="text" id="custname" placeholder="" data-toggle="modal" data-target="#myModal"
											class="col-xs-10 col-sm-5" name="custname"  />
									</div>
									<div class="col-md-0"></div>
									<label class="col-sm-1 control-label no-padding-right"
										for="form-field-2"> 业务编号 </label>
									<div class="col-sm-4">
									<input type="text" id="businessid" placeholder="" data-toggle="modal" data-target="#myModal"
											class="col-xs-10 col-sm-5" name="businessid"  />
									</div>
									<div class="col-md-1"></div>
								</div>
							</div>
							<div class="space-1"></div>
							<div class="space-2"></div>
							<div class="row">
								<div class="form-group">
									<label class="col-sm-10 control-label no-padding-right"
										for="form-field-2"> </label>
									<div class="col-sm-1">
										<button class="btn btn-sm btn-primary" onclick="toQry();" type="button">查询</button>
									</div>
									<div class="col-md-1"></div>
								</div>
							</div>
							<!-- /row 横线-->
							<div class="page-header"></div>
						</form>
						<!-- 查询条件end -->
						<!--查询结果列表  -->
				<div id="qryContent">
					<div id="sample-table-2_wrapper" class="dataTables_wrapper"
						role="grid">
						<input type="hidden" id="id" name="id" />
						<table id="sample-table-2"
							class="table table-striped table-bordered table-hover dataTable"
							aria-describedby="sample-table-2">
							<thead>
								<tr>
									<th>选择</th>
									<th>业务编号</th>
									<th>客户名称</th>
									<th>客户编号</th>
									<th>产品名称</th>
									<th>申请金额</th>
									<th>担保方式</th>
									<th>循环标志</th>
									<th>申请状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${bizBussinessList}" var="bizBusinessEntity">
									<tr>
										<td>
										<input type="checkbox" id="checkbox" name="checkbox"  onclick="getId()" value="${bizBusinessEntity.businessid}" style="zoom:100%;">
										</td>
										<td>${bizBusinessEntity.businessid}</td>
										<td>${bizBusinessEntity.custname}</td>
										<td>${bizBusinessEntity.custid}</td>
										<td>${bizBusinessEntity.prodname}</td>
										<td>${bizBusinessEntity.amount}</td>
										<td>${bizBusinessEntity.zydbfs}</td>
										<td>${bizBusinessEntity.xhbz}</td>
										<td><span class="label label-sm label-warning">${bizBusinessEntity.status_name}</span></td>
										<td>
											<!-- 列表按钮区域 -->
											<div
												class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
												<button type="button" class="btn btn-xs btn-primary"
													onclick="editEntity('${bizBusinessEntity.businessid}','${bizBusinessEntity.sqzt}','${bizBusinessEntity.zydbfsvalue}')">编辑</button>
												<button type="button" class="btn btn-xs btn-primary"
													onclick="viewEntity('${bizBusinessEntity.businessid}','${bizBusinessEntity.sqzt}','${bizBusinessEntity.zydbfsvalue}')">查看</button>
												<button type="button" class="btn btn-xs btn-primary"
													onclick="deleteEntity('${bizBusinessEntity.businessid}','${bizBusinessEntity.sqzt}')">取消</button>
												<button type="button" class="btn btn-xs btn-primary"
													onclick="startWork('${bizBusinessEntity.bfrkbz}','${bizBusinessEntity.businessid}','${bizBusinessEntity.sqzt}','${bizBusinessEntity.bzxs}','${bizBusinessEntity.bzrsl}','${bizBusinessEntity.dbje}','${bizBusinessEntity.amount}','${bizBusinessEntity.zydbfs}','${bizBusinessEntity.fsjl}')">发起补录</button>
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
									<button class="btn btn-sm btn-primary" onclick="addEntity();"
										type="button">新增</button>
									<button class="btn btn-sm btn-primary" onclick="yingxiangck();"
										type="button">查看影像</button>
								</div>
							</div>
							<!-- 分页 -->
							<jsp:include page="../../common/page.jsp"></jsp:include>
						</div>
					</div>
				</div>
				<!--列表结束-->
				</div>
			</div>
		</div>
	
	<script type="text/javascript">
		window.jQuery|| document.write("<script src='<%=path%>/js/jquery-2.0.3.min.js'>"+ "<"+"script>");
	</script>
	<script type="text/javascript">
		var $assets = "assets";//this will be used in fuelux.tree-sampledata.js
	</script>
	<script type="text/javascript">
		if ("ontouchend" in document)
			document.write("<script src='<%=path%>/js/jquery.mobile.custom.min.js'>" + "<"+"script>");
	</script>
	<script src="<%=path%>/js/bootstrap.min.js"></script>
	<script src="<%=path%>/js/typeahead-bs2.min.js"></script>
	<script src="<%=path%>/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="<%=path%>/js/jquery-ui-1.10.3.full.min.js"></script>
	<script src="<%=path%>/js/jquery.ui.touch-punch.min.js"></script>
	<script src="<%=path%>/js/jquery.slimscroll.min.js"></script>
	<script src="<%=path%>/js/jquery.easy-pie-chart.min.js"></script>
	<script src="<%=path%>/js/jquery.sparkline.min.js"></script>
	<script src="<%=path%>/js/flot/jquery.flot.min.js"></script>
	<script src="<%=path%>/js/flot/jquery.flot.pie.min.js"></script>
	<script src="<%=path%>/js/flot/jquery.flot.resize.min.js"></script>
	<script src="<%=path%>/js/ace-elements.min.js"></script>
	<script src="<%=path%>/js/ace.min.js"></script>
	<script src="<%=path%>/js/fuelux/data/fuelux.tree-sampledata.js"></script>
	<script src="<%=path%>/js/ajaxfileupload.js"></script>
	<script src="<%=path%>/js/fuelux/fuelux.tree.min.js"></script>
	<script src="<%=path%>/js/jquery.maskedinput.min.js"></script>
	<script src="<%=path%>/js/jquery.validate.min.js"></script>
	<script src="<%=path%>/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="<%=path%>/js/date-time/bootstrap-timepicker.min.js"></script>
	<script src="<%=path%>/js/date-time/moment.min.js"></script>
	<script src="<%=path%>/js/date-time/daterangepicker.min.js"></script>
	<script src="<%=path%>/js/bootbox.min.js"></script>
	<script src="<%=path%>/js/bootstrap-wysiwyg.min.js"></script>
	<script src="<%=path%>/js/markdown/markdown.min.js"></script>
	<script src="<%=path%>/js/markdown/bootstrap-markdown.min.js"></script>
	<script src="<%=path%>/js/jquery.hotkeys.min.js"></script>
	<script src="<%=path%>/js/jquery.dataTables.min.js"></script>
	<script src="<%=path%>/js/jquery.dataTables.bootstrap.js"></script>
	<script src="<%=path%>/js/framework_menu.js"></script>
	<script src="<%=path%>/js/framework_pubFunction.js"></script>
	<script src="<%=path%>/js/framework_form.js"></script>
	<script src="<%=path%>/js/framework_modal.js"></script>
	<script type="text/javascript">
		/*********页面加载区域**********/
		jQuery(function($) {
			//Date Picker 控件
			$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
			//加载下拉列表
			$("#pro_List").formComponents("select");
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
		});
		//根据查询条件查看
		function toQry()
		{
			var param = $("#queryForm").serialize();
			param += "&qry_type=qry";
			$.post("business_getList.do", param, function(result) {
				$("#qryContent").html(result).hide();
				$("#qryContent").fadeIn('fast');
				setHash('${pageContext.request.contextPath}');
			});
		}
		function addEntity(){
			window.location="<%=path%>/mvc/business_add.do";
		};
		function editEntity(businessid,status,zydbfsvalue){
			if(status==8||status==11){
				window.location="<%=path%>/mvc/business_edit.do?zydbfs="+zydbfsvalue+"&businessid="+businessid;
			}else{
				alert("该状态不可修改");				
			}
		};
		function viewEntity(businessid,status){
			window.location="<%=path%>/mvc/business_view.do?businessid="+businessid+"&viewOrEdit=view&pageNo="+$("#pageNo").val();
		};
		//取消
		function approveEntity(businessid,status){
			 var param={};
				param["businessid"]=businessid;
				if(status==8){
					
					$.post("business_updateStatue.do",param,function(result){
						if(result.msg=="success"){
							f_alert("<%=path%>","success","business_getList.do?pageNo="+$("#pageNo").val());
						}else{
							f_alert("<%=path%>","删除失败!","");			
						}
					}); 
				}else{
					alert("该状态不可以提起审批");
				}
		};
		//提起审批
		function startWork(bfrkbz,businessid,status,bzxs,bzrsl,dbje,amount,zydbfs,fsjl){
			
			 var param={};
			param["businessid"]=businessid;
			param["moban"]="business";//影像模版
			if(status==8||status==11){
				
				if (zydbfs=="抵押"||zydbfs=="质押") {
					if (fsjl==0) {
						f_alert("<%=path%>","担保方式非信用，请添加附属信息!","");	
						return;
					}
					//bfrkbz为1关联抵质押品状态均已入库
					alert(bfrkbz);
					if(bfrkbz=="1"){
						if (parseFloat(amount)>parseFloat(dbje)) {
							f_alert("<%=path%>","担保金额不足!","");	
							return;
						}
					}
					
				}else if(zydbfs=="保证"){
					if (fsjl==0) {
						f_alert("<%=path%>","担保方式非信用，请添加附属信息!","");	
						return;
					}
					if(bzxs=="2"||bzxs=="3"){
						if (bzrsl<2) {
							f_alert("<%=path%>","保证人数量不足!","");	
							return;
						} else {
							if (parseFloat(amount)>parseFloat(dbje)) {
								f_alert("<%=path%>","担保金额不足!","");	
								return;
							}
						}
					}
				}
				
				
				$.post("business_updateStatue.do?doOperate=startWork",param,function(result){
					if(result.msg=="success"){
						f_alert("<%=path%>","success","business_getList.do?pageNo="+$("#pageNo").val());
					}else{
						f_alert("<%=path%>","发起补录失败!","");			
					}
				}); 
			}else{
				alert("该状态不可以发起补录！");
			}
		};
		function deleteEntity(businessid,status){
			 var param={};
			param["businessid"]=businessid;
			if(status==8){
				
				$.post("business_updateStatue.do?doOperate=cancle",param,function(result){
					if(result.msg=="success"){
						f_alert("<%=path%>","success","business_getList.do?pageNo="+$("#pageNo").val());
					}else{
						f_alert("<%=path%>","删除失败!","");			
					}
				}); 
			}else{
				alert("该状态不可以取消");
			}
		};
		function editFsxx(businessid,sqzt,zydbfs){
				if(zydbfs=="信用"){
					f_alert("<%=path%>","担保方式为信用，不需要维护附属信息!","");	
				}else if(zydbfs=="质押"){
					window.location="<%=path%>/mvc/business_view.do?businessid="+businessid+"&zydbfs=4&viewOrEdit=edit&pageNo="+$("#pageNo").val();
				}else if(zydbfs=="抵押"){
					window.location="<%=path%>/mvc/business_view.do?businessid="+businessid+"&zydbfs=3&viewOrEdit=edit&pageNo="+$("#pageNo").val();
				}else if(zydbfs=="保证"){
					window.location="<%=path%>/mvc/business_view.do?businessid="+businessid+"&zydbfs=2&viewOrEdit=edit&pageNo="+$("#pageNo").val();
				}
			
		}
		
		//获得主键
		function getId() {
				var checkbox=document.getElementById("checkbox").value;
				document.getElementById("id").value=checkbox;
				
		}
		//影像查看
		function yingxiangck(){
			var id=document.getElementById("id").value;
			if (id==null||id=="") {
				f_alert("<%=path%>","请选择一条记录!","");	
				return false;
			}else{
				window.location="<%=path%>/mvc/forwardToYingXiang.do?transId="+id+"&moban=business&opRight=1";
			}
			
		}
		//上传影像
		function yingxiang(id,sqzt){
			if(sqzt==8||sqzt==11){
				window.location="<%=path%>/mvc/forwardToYingXiang.do?transId="+id+"&moban=business&opRight=2";
			}else{
				f_alert("<%=path%>","该状态不可以上传影像!","");
			}
		}
	</script>
	</body>
</html>
