package com.infohold.cms.basic.constant;

import java.io.Serializable;

/**
 * 系统异常错误码定义
 */
public enum SysErrorCodeDef implements Serializable {

	//异常码定义
	E001(),
	E002(),
	E003(),
	E004(), 
	E005(), 
	
	E006(), 
	E007(), 
	E008(), 
	E009(),
	E010(),
	E011(),
	E012(),
	E013(),
	E014(),
	E015(),
	E016(),
	E017(),
	E018(),
	E019(),
	E020(),
	E021(),
	E022(),
	E023(),
	E024(),
	E025(),
	E026(),
	E027(),
	E028(),
	E029(),
	E030(),
	E031(),
	E032(),
	E033(),
	E034(),
	E035(),
	E100(),
	E101(),
	E102(),
	E997(),
	E998(),
	E103(), 
	E999
	;

	/**
	 * 返回中文
	 * @return
	 */
	public String cnname() {
		switch (this) {
		case E001:
			return "交易码 tradeCode不允许为空！";
		case E002:
			return "登录失败，用户名或密码错误";
		case E003:
			return "交易码未在系统中定义";
		case E004:
			return "工作流内部错误";
		case E005:
			return "输入信息有误";
		case E006:
			return "上传文件过大，最大为10MB";
		case E007:
			return "核算系统开户不成功";
		case E008:
			return "文件删除失败";
		case E009:
			return "上传文件为空";
		case E010:
			return "上传文件格式非法";
		case E011:
			return "文件不存在";
		case E012:
			return "读取文件失败";
		case E013:
			return "上传文件失败";
		case E014:
			return "调用核算系统开户失败";
		case E015:
			return "项目融资服务建立失败";
		case E016:
			return "未完成银行账户认证，不能进行融资申请";
		case E017:
			return "登录失败，该用户已登录。";
		case E018:
			return "登录失败，该用户已停用。";
		case E019:
			return "调核算接口失败！";
		case E020:
			return "调核算贷款归还欠款接口失败！";
		case E021:
			return "通知核算进行风险准备金计提失败！";
		case E022:
			return "流程启动失败";
		case E023:
			return "流程推动失败";
		case E024:
			return "流程回退失败";
		case E025:
			return "流程终止失败";
		case E026:
			return "任务查询失败";
		case E027:
			return "任务审批详情查询失败";
		case E028:
			return "客户额度查询失败";
		case E029:
			return "客户额度关联失败";
		case E030:
			return "贷款结清，调用核算试算失败";
		case E031:
			return "欠款信息查询调用核算失败";
		case E032:
			return "欠款归还调用核算失败";
		case E033:
			return "还款冲账调用核算失败";
		case E034:
			return "展期申请记账调用核算失败";
		case E035:
			return "结清调用核算失败";
		case E100:
			return "客户不存在";
		case E101:
			return "客户非信贷客户!";
		case E102:
			return "调用核算系统查询客户接口失败";
		case E103:
			return "工作流任务认领失败";
		case E997:
			return "不允许为空";
		case E998:
			return "系统存储异常";
		case E999:
			return "系统内部异常";
		default:
			return "参数错误";
		}
	}
	
}
