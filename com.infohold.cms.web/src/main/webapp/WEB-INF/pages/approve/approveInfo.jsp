<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<div class="modal fade bs-example-modal-1g" id="Modal_approve" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="breadcrumbs" id="breadcrumbs">
			<button type="button" class="close" onclick="hideModal();"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<ul class="breadcrumb">
					<li><i class="active "></i> <a href="#">审批意见</a></li>
				</ul>
			</div>
			<div class="modal-body">
			<form id="form_1" name="form_1" method="post" action="#" class="form-horizontal">
				<input type="hidden" id="biz_id" name="biz_id" value=""/>
				<input type="hidden" id="biz_code" name="biz_code" value=""/>
				<div class="page-content">
					<div class="form-group">
						<div class="row">		
							<textarea rows="7" cols="60" id="reason_approve" name="reason_approve"></textarea>
						</div>
					</div>
					<div class="space-6"></div>
					<div class="form-group">
						<div class="row hidden" id="roleback">
							<label class="col-sm-4 control-label" for="backType">回退方式：</label>	
							<select id="backType" name="backType" class="col-sm-4">
								<option value="">---请选择---</option>
								<option value="1">回退到上一审批人</option>
								<option value="2">回退到初始审批人</option>
							</select>
						</div>
					</div>	
				</div>			
				<!-- /row 横线-->
				<div class="page-header"></div>			
				<div class="row">
					<label class="col-sm-3 control-label no-padding-right"
						for="form-field-2"> </label>
					<div class="col-sm-8">
						<button type="button" class="btn btn-sm btn-primary" onclick="CallBackSubmit(1);">同意</button>
						<button type="button" class="btn btn-sm btn-primary" onclick="CallBackSubmit(2);">回退</button>
						<button type="button" class="btn btn-sm btn-primary" onclick="CallBackSubmit(3);">终止</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>