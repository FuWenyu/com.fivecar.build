<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/commonList.jsp"></jsp:include><!-- 引入公供js -->
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
		<script type="text/javascript">
    //重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
    UEDITOR_CONFIG.UEDITOR_HOME_URL = './ueditor/';
    var _editor = UE.getEditor('position');
    _editor.ready(function () {
        //设置编辑器不可用
        //_editor.setDisabled();
        //隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
        _editor.hide();
        //侦听图片上传
        _editor.addListener('beforeInsertImage', function (t, arg) {
            //将地址赋值给相应的input
            $("#picture").attr("value", arg[0].src);
            //图片预览
            $("#preview").attr("src", arg[0].src);
        })
        //侦听文件上传
        _editor.addListener('afterUpfile', function (t, arg) {
            $("#file").attr("value", _editor.options.filePath + arg[0].url);
        })
    });
    //弹出图片上传的对话框
    function upImage() {
        var myImage = _editor.getDialog("map");
        myImage.open();
    }
    //弹出文件上传的对话框
    function upFiles() {
        var myFiles = _editor.getDialog("attachment");
        myFiles.open();
    }
</script>
	</head>
	<!-- 该页面为iframe嵌套页面，以下代码用于计算iframe高度，不允许修改：
			<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
			<div id="iframeDiv" style="display:none"></div>
			<div class="page-content" id="loadPageContent">
	-->
	<body id="iframe_body" onload="setHash('${pageContext.request.contextPath}')">
		<div id="iframeDiv" style="display:none"></div>
		<div class="page-content" id="loadPageContent">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<form class="form-horizontal" id="sub_form" action="<%=path%>/mvc/version_editSave.do"
					method="post">
					<h3 class="header smaller lighter grey">图片信息修改</h3>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id"> </label>
					</div>
					<%-- <input id="VERSION_FOR" type="hidden" class="" name="VERSION_FOR"   value="${dealer.version_flag}" />	
					<input id="version_ol" type="hidden" class="" name="version_ol"   value="${dealer.version_online}" />	 --%>
					<input id="dealer_id" type="hidden" class="" name="dealer_id" value="${dealer.id}" />
					<input id="orgid" type="hidden" class="" name="orgid" value="${dealer.orgid}" />
					<input id="carbrand1" type="hidden" class="" name="carbrand1" value="${dealer.carbrandid}-${dealer.carbrand}" />
					<input id="resource" type="hidden" class="" name="resource" value="${dealer.resourceid}-${dealer.privilegestile}-${dealer.privileges}" />
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							经营品牌</label>
						<div class="col-sm-9">
							<select class="input-medium"  id="carbrand" name="carbrand">
							<c:forEach items="${brandList}" var="list" varStatus="status">
	                        <option value="${list.id}-${list.brandNamecn}">${list.initial}-${list.brandNamecn}</option>
	               		    </c:forEach>
               		    </select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							经销商全名 </label>
						<div class="col-sm-9">
							<input type="text" id="dealerName" name="dealerName" placeholder="请输入经销商全名 "
								class="col-xs-10 col-sm-5"
								value="${dealer.dealerName}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							联系电话</label>
						
						<div class="col-sm-9">
							<input type="text" id="telephone" name="telephone" placeholder="请输入联系电话 "
								class="col-xs-10 col-sm-5"
								value="${dealer.telephone}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							经销商地址</label>
						
						<div class="col-sm-9">
							<input type="text" id="addr" name="addr" placeholder="请输入经销商地址 "
								class="col-xs-10 col-sm-5"
								value="${dealer.addr}" /> <span style="color: red"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name">
							经销商简介 </label>
						<div class="col-sm-9">
							<input type="text" id=description placeholder="请输入经销商简介"
								class="col-xs-10 col-sm-5" name="description" value="${dealer.description}" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="name">
							五车专享特权</label>
						<div class="col-sm-9">
						<select class="input-medium"  id="anchor" name="anchor">
							<c:forEach items="${resourcesList}" var="list" varStatus="status">
	                        <option value="${list.id}-${list.title}-${list.resourceName}">${list.resourceName }</option>
	               		    </c:forEach>
               		    </select>
               		    </div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="id">
							4s店地图</label>
						<div class="col-sm-9">
						<button class="btn btn-sm btn-primary" onclick="upImage();" type="button">添加地图信息</button>
								 <textarea name="position" id="position">${dealer.position}</textarea>
						</div>
					</div>
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button class="btn btn-info" type="button" onclick="subForm();">
								<i class="icon-ok bigger-110"></i> 提交
							</button>
		
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="button" onclick="javascript:window.location = '<%=path%>/mvc/padealer.do';">
								<i class="icon-reply bigger-110"></i> 返回
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		</div>
	<script type="text/javascript">
		window.jQuery|| document.write("<script src='<%=path%>/js/jquery-2.0.3.min.js'>" + "<"+"script>");
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
	<script src="<%=path%>/js/framework_menu.js"></script>
	<script src="<%=path%>/js/framework_pubFunction.js"></script>
	<script src="<%=path%>/js/fuelux/data/fuelux.tree-sampledata.js"></script>
	<script src="<%=path%>/js/ajaxfileupload.js"></script>
	<script src="<%=path%>/js/fuelux/fuelux.tree.min.js"></script>
	<script src="<%=path%>/js/framework_form.js"></script>
	<script src="<%=path%>/js/framework_modal.js"></script>
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
	<!-- PAGE CONTENT ENDS -->
	<script type="text/javascript">
		/*********页面加载区域**********/
		jQuery(function($) {
			var carbrand1 = document.getElementById('carbrand1').value;
			var resource = document.getElementById('resource').value;
			checkOption('carbrand',carbrand1);
			checkOption('anchor',resource);
			
			$(window).resize(function() {
				setHash('${pageContext.request.contextPath}');
			});
		});
		/*********自定于方法**********/
		//表单提交
		function subForm() {
			if (!checkData('carbrand', '经营品牌', 'input')) {
				return;
			}
			
			if (!checkData('anchor', '五车专享特权', 'input')) {
				return;
			}
			
			if (!checkData('dealerName', '经销商全名', 'input')) {
				return;
			}
			if (!checkData('dealerName', '经销商全名', 'illegal')) {
				return;
			}
			if (!limitCheck('dealerName', '经销商全名', 64)) {
				return;
			}
			
			if (!checkData('telephone', '联系电话', 'input')) {
				return;
			}
			if (!checkData('telephone', '联系电话', 'number')) {
				return;
			}
			if (!limitCheck('telephone', '联系电话', 11)) {
				return;
			}
			
			if (!checkData('addr', '经销商地址 ', 'input')) {
				return;
			}
			if (!checkData('description', '经销商简介 ', 'input')) {
				return;
			}
			$.ajax({
				type : "POST",
				url : "<%=path%>/mvc/padealer_editSave.do",
				data : $("#sub_form").serialize(),
				async : false,
				dataType:'json',
				success : function(data) {
					if(data.msg == "success"){
						alert("保存成功！");
						window.location = "<%=path%>/mvc/padealer.do";
					}else{
						alert("保存失败:"+data.msg);
					}
				},
				error : function(msg) {
					alert("分配出错  " + msg.msg);
				}
			});
		}
		function checkOption(id,value)
		{
			var select = document.getElementById(id);
			var options = select.options;
			for(var i= 0;i<options.length;i++)
			{
				if(options[i].value == value)
				{
					options[i].selected = true;
					break;
				}
			}
		}
	</script>
	</body>
</html>
