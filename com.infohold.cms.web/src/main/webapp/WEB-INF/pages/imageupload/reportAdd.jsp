<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/commonList.jsp"></jsp:include><!-- 引入公供js -->
	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="sub_form" action="" method="post">
					<input type="hidden" id="report_id" name="report_id" value="${map.report_id }"/>
					<input type="hidden" id="cust_id" name="cust_id"/>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="cust_name"> 客户名称 </label>
							<div class="col-sm-3">
								<input type="text" id="cust_name" placeholder="点击选择客户" class="col-xs-10 col-sm-8" name="cust_name" onclick="selectCustem();" readonly/>
							</div>
						<label class="col-sm-1 control-label no-padding-right" for="task_id"> 任务号 </label>
							<div class="col-sm-6">
								<input type="text" id="task_id" placeholder="" class="col-xs-10 col-sm-4" name="task_id" readonly/>
							</div>
			       </div>
			       <div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="amount"> 申请金额</label>
							<div class="col-sm-3">
								<input type="text" id="amount" placeholder="" class="col-xs-10 col-sm-8" name="amount"  readonly/>
							</div>
						<label class="col-sm-1 control-label no-padding-right" for="tel"> 联系电话 </label>
							<div class="col-sm-6">
								<input type="text" id="tel" placeholder="" class="col-xs-10 col-sm-4" name="tel" readonly/>
							</div>
			       </div>
			       <div class="form-group">
								<label class="col-sm-2 control-label no-padding-right"
									for="authExeCause">调查结果</label>
								<div class="col-sm-10">
									<textarea rows="6" cols="72" id="ps"
										name="ps"></textarea>
								</div>
				   </div>
				   <div class="form-group">
							<label class="col-sm-2 control-label no-padding-right" for="fileInput">上传文件</label>
							<div class="col-sm-3" id="upload">
								<div class="ace-file-input col-sm-12" id="fileInputDiv">
									<input type="file" id="fileInput" name="myfile" class="ace-file-input col-sm-12" onblur="clean()">
						
								</div>
							</div>
							<div class="col-sm-4">
								<h6 class="inline blue">请上传|xls|doc|gif|png|jpg|jpeg格式附件。</h6>
							</div>
					</div>
					<div class="form-group">
								<label class="col-sm-2 control-label no-padding-right" for="btn"></label>
									<div class="col-sm-3">
											&nbsp;&nbsp;&nbsp;&nbsp;<button id="fileUpLoadBtn" type="button" class="btn btn-xs">上传文件</button>
								</div>
								<div class="col-sm-4">
								
								</div>
					</div>
					<div class="form-group hide" id="fileListGroup">
								<label class="col-sm-2 control-label no-padding-right" for="btn">已上传文件</label>
								<div class="col-sm-3" id="upload1">
							
								</div>
								<div class="col-sm-4">
								
								</div>
					</div>
				  
			      	<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 提交
							</button>
		
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="javascript:goBack();">
								<i class="icon-reply bigger-110"></i> 返回
							</button>
						</div>
					</div>
				</form>
				<!-- PAGE CONTENT ENDS -->
				</div>
			</div>
		</div>
	<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" onclick="hideModal();"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="myModalLabel">客户列表</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12">
							<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
								<table id="sample-table-2" class="table table-striped table-bordered table-hover dataTable" aria-describedby="sample-table-2">
									<thead>
										<tr>
											<!-- <th class="center">选择</th> -->
											<!-- <label> <input type="radio" class="ace" /> <span class="lbl"></span></label> -->
											<th>客户编号</th>
											<th>客户名称</th>
											<th>申请金额(元)</th>
											<th>联系电话</th>
											<th>任务号</th>
											<th>客户经理名称</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="custList">
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-sm btn-primary" onclick="callBackfunction();">选择</button> -->
					<button type="button" class="btn btn-sm btn-default" onclick="hideModal();">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	
	jQuery(function($) {
		
		//上传文件控件
		$('#fileInput').ace_file_input({
			no_file:'空...',
			btn_choose:'选择',
			btn_change:'更改',
			droppable:false,
			onchange:null,
			thumbnail:false
		});
		
		$("#fileUpLoadBtn").on("click.upLoad",function(){
			//附件格式控制，ID，白名单
			var fileInput=$("#fileInput").val();
			var array=fileInput.split(".");
			if("|xls|doc|gif|png|jpg|jpeg|jasper".indexOf(array[1])==-1){
				myalert("此文件格式不支持上传！");
				return;
			}; 
			var fileInput = $("#fileInput").val();
			if(fileInput==null ||fileInput=="" ){
				$("#fileInputDiv").next().remove();
				$("#fileInputDiv").after("<div class=\"help-block red\" >&nbsp;&nbsp;&nbsp;*&nbsp;&nbsp;请上传附件");
				return false;
			}
			param = {};
			param["biz_id"]=$("#report_id").val();
			param["biz_type"]="1";
			//ajax上传文件
			$.ajaxFileUpload({
				url : "fileUpLoad.do",
				type : "POST",
				secureuri : false,
				fileElementId : 'fileInput',
				data : param,
				dataType : 'JSON',
				success : function(data,status){
					var obj = $.parseJSON($(data).html());
					if(obj.reCode == "failed"){
						myalert(obj.expMsg,initFileInput);
						/* initFileInput(); */
					}else{
						$("#fileListGroup").removeClass("hide");
						$("#upload1").append("<label class='filelist col-sm-12'><a href=\"downloadFile.do?att_id="+obj.fileVo.attId+"\">"+obj.fileVo.attName+" &nbsp;&nbsp;&nbsp;</a><a class=\"remove\" data-attid="+obj.fileVo.attId+" data-fileName="+obj.fileVo.fileName+" href=\"#\" onclick=\"removeFile(this);\"><i class=\"icon-remove\"></i></a></label>");
						initFileInput();
					}
					
				},
				error : function(data,status,e){
					initFileInput();
				}
			});
		});
		$(window).resize(function() {
			setHash('${pageContext.request.contextPath}');
		});
	});
	function selectCustem(){
		showModal($("#myModal"));
		$.ajax( {
			type : "POST",
			url : "${pageContext.request.contextPath}/mvc/queryCuster.do",
			async : false,
			success : function(obj) {
				$(obj).each(function(index){
					var $tr = "<tr><td>"+$(obj)[index].cust_id+"</td> "
								+" <td>"+$(obj)[index].login_name+"</td> "
								+" <td>"+$(obj)[index].amount+"</td> "
								+" <td>"+$(obj)[index].tel+"</td> "
								+" <td>"+$(obj)[index].task_id+"</td> "
								+" <td>"+$(obj)[index].name+"</td> "
								+" <td><button type=\"button\" onclick=\"callBackfunction('"+$(obj)[index].login_name+","+$(obj)[index].task_id+","+$(obj)[index].amount+","+$(obj)[index].tel+","+$(obj)[index].cust_id+","+$(obj)[index].flag+"');\">选择</button></td> "
								+" </tr>";
					$(window.parent.document).find("#custList").append($tr);
				});
			},
			error : function(msg) {
				myalert("获取数据失败: " + msg);
			}
		});
	}
	function subForm() {
		if($("#cust_id").val() == ""){
			myalert("请选择客户");
			return;
		}
		var upload=document.getElementById("upload1").innerHTML.trim();
		if((($("#ps").val() == "")||($("#ps").val() == null)) && (upload == ""||upload == null||upload.length==0)){
			myalert("调查结果与附件不能同时为空！");
			return;
		}
		if((($("#fileInput").val() != "")&&($("#fileInput").val() != null))&& (upload == ""||upload == null||upload.length==0)){
			myalert("附件没有上传！");
			return;
		}
		$.ajax({
			type : "POST",
			url : "<%=path%>/mvc/business_loanReportAddSave.do",
			data : $("#sub_form").serialize(),
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.msg == "success"){
					myalert("保存成功！",goBack);
				}else{
					myalert("保存失败！");
				}
			},
			error : function(msg) {
				myalert("分配出错  " + msg);
			}
		});
	}
	function CallBackSubmit(obj){
		var objs = obj.split(",");
		if(objs[5]<1){
			myalert("该客户没有维护基本信息，请先维护客户信息！");
			return false;
		}
		$("#cust_name").val(objs[0]);
		$("#task_id").val(objs[1]);
		$("#amount").val(objs[2]);
		$("#tel").val(objs[3]);
		$("#cust_id").val(objs[4]);
		hideModal();
	}
	function removeFile(obj){
		var param={};
		param["att_id"]=$(obj).data("attid");
		$.ajax( {
			type : "POST",
			url : "removeFile.do",
			data : param,
			async : false,
			success : function(flag) {
				if(flag){
					myalert("删除成功",initFileInput);
					$(obj).parents("label").remove();
					$("#fileUpLoadBtn").show();
				}else{
					myalert("删除失败",initFileInput);
				}
				
			},
			error : function(msg) {
				myalert("表单提交失败："+msg,initFileInput);
			}
		}); 
	}
	function initFileInput(){
		var html = "<div class=\"ace-file-input col-sm-12\" id=\"fileInputDiv\"> "+
		"<input type=\"file\" id=\"fileInput\" name=\"myfile\" class=\"ace-file-input col-sm-12\" onblur=\"clean()\"> "+
		"<div id=\"fileInput_font\" class=\"help-block red\" onclick=\"clean()\"></div></div>"; 
		$("#fileInputDiv").remove(); 
		$("#upload").html(html); 
		$('#fileInput').ace_file_input({
			no_file:'空...',
			btn_choose:'选择',
			btn_change:'更改',
			droppable:false,
			onchange:null,
			thumbnail:false 
		}); 
		setHash('${pageContext.request.contextPath}');
	}
	function goBack(){
		window.location = "<%=path%>/mvc/business_loanReportList.do";
	}
	</script>
</body>
</html>
