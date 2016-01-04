<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<div class="modal fade bs-example-modal-1g" id="groupCustomerMember_view" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="active "></i> <a href="#">集团成员客户</a></li>
					</ul>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="sub_form1" name="sub_form1" action="#" method="post">
						<div class="row">
							<div class="form-group col-sm-6">
								<div class="form-group">
									<label class="col-sm-4 control-label" for="groupid1">集团编号</label>
									<div class="col-sm-6 input-group">
										<input type="text" id="groupid1" name="groupid1" class="form-control" placeholder="集团编号"  readonly="readonly">
								</div>
							</div>
						</div>
						<div class="form-group col-sm-6">
						</div>
					</div>	
					<div class="row">
						<div class="form-group col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="group_relationship1">集团关联关系类型</label>
								<div class="col-sm-6 input-group">
									<input type="text" id="group_relationship1" name="group_relationship1" class="form-control"   readonly="readonly">
								</div>
							</div>
						</div>
						<div class="form-group col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="group_custtype1">集团成员类型</label>
								<div class="col-sm-6 input-group">
									<input type="text" id="group_custtype1" name="group_custtype1" class="form-control"   readonly="readonly">
								</div>
							</div>
						</div>
					</div>	
					<div class="row">
						<div class="form-group col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="is_mycust1">是否本行集团客户</label>
								<div class="col-sm-6 input-group">
									<input type="text" id="is_mycust1" name="is_mycust1" class="form-control"   readonly="readonly">
									<input type="hidden" id="is_mycust2" name="is_mycust2" class="form-control" >
								</div>
							</div>
						</div>
						<div class="form-group col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="cust_id1">客户编号</label>
								<div class="col-sm-6 input-group">
									<input type="text" id="cust_id1" name="cust_id1" class="form-control"   readonly="readonly">
								</div>
							</div>
						</div>
					</div>	
				 	<div class="row">
						<div class="form-group col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="cust_name1">客户名称</label>
								<div class="col-sm-6 input-group">
									<input type="text" id="cust_name1" name="cust_name1" class="form-control"   readonly="readonly">
								</div>
							</div>
						</div>
						<div class="form-group col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="organizationcode1">组织机构代码</label>
								<div class="col-sm-6 input-group">
								<input type="text" id="organizationcode1" name="organizationcode1" class="form-control"   readonly="readonly">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="file_type1">文件类型</label>
								<div class="col-sm-6 input-group">
								<input type="text" id="file_type1" name="file_type1" class="form-control"   readonly="readonly">
								</div>
							</div>
						</div>
						<div class="form-group col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="file_number1">文件编号</label>
								<div class="col-sm-6 input-group">
									<input type="text" id="file_number1" name="file_number1" class="form-control"   readonly="readonly">
								</div>
							</div>
						</div>
					</div>		
					<div class="row">
						<div class="form-group col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="branch_noname1">经办机构</label>
								<div class="col-sm-6 input-group">
									<input type="text" id="branch_noname1" name="branch_noname1" class="form-control"   readonly="readonly">
								</div>
							</div>
						</div>
						<div class="form-group col-sm-6">
							<div class="form-group">
								<label class="col-sm-4 control-label" for="cust_managername1">经办客户经理</label>
								<div class="col-sm-6 input-group">
									<input type="text" id="cust_managername1" name="cust_managername1" class="form-control"   readonly="readonly">
								</div>
							</div>
						</div>
					</div>	
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-default" onclick="hideModal();">关闭</button>
			</div>
		</div>
	</div>
</div>
