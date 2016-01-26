package com.infohold.cms.basic.constant;

import java.io.Serializable;

/**
 * 交易码定义常量类
 */
public enum TradeCodeDef implements Serializable {

	// 交易码定义,长度六位：
	// T1xxxx开头；
	T10001(), T10002(), T10003(), T10004(), T10005(), T10006(), T10007(), T10008(), T10009(), T10010(),
	//图片处理模块
	T20001(), T20002(), T20003, T20004(), T20005(), T20006(),T20007(),T20008(),T20009(),T20010(),T20011(),
	//资源管理模块
	T21001(), T21002(), T21003, T21004(), T21005(), T21006(),T21007(),T21008(),T21009(),T21010(),
	//4s店品牌管理模块
	T22001(), T22002(), T22003, T22004(), T22005(), T22006(),T22007(),T22008(),T22009(),T22010(),
	//4s店车辆管理模块
	T23001(), T23002(), T23003, T23004(), T23005(), T23006(),T23007(),T23008(),T23009(),T23010(),
	//4s店信息管理
	T24001(), T24002(), T24003, T24004(), T24005(), T24006(),T24007(),T24008(),T24009(),T24010(),
	//4s店销售员管理
	T25001(), T25002(), T25003, T25004(), T25005(), T25006(),T25007(),T25008(),T25009(),T25010(),
	//4s店车型管理
	T26001(), T26002(), T26003, T26004(), T26005(), T26006(),T26007(),T26008(),T26009(),T26010(),
	
	//平行进口车品牌管理模块
	T31001(), T31002(), T31003, T31004(), T31005(), T31006(),T31007(),T31008(),T31009(),T31010(),
	//平行进口车车辆管理模块
	T32001(), T32002(), T32003, T32004(), T32005(), T32006(),T32007(),T32008(),T32009(),T32010(),
	//平行进口车信息管理
	T33001(), T33002(), T33003, T33004(), T33005(), T33006(),T33007(),T33008(),T33009(),T33010(),
	//平行进口车销售员管理
	T34001(), T34002(), T34003, T34004(), T34005(), T34006(),T34007(),T34008(),T34009(),T34010(),
	//平行进口车车型管理
	T35001(), T35002(), T35003, T35004(), T35005(), T35006(),T35007(),T35008(),T35009(),T35010(),
	
// 版本管理模块
	T30001(), T30002(), T30003(), T30004(), T30005(), T30006(),
	//APP客户端用户模块
	T40001(),T40002(),
	// 角色管理模块
	T50001(), T50002(), T50003(), T50004(), T50005(), T50006(), T50007(), T50008(), T50009(), T50010(),
	// 用户管理模块
	T50011(), T50012(), T50013(), T50014(), T50015(), T50016(), T50017(), T50018(), T50019(), T50020(),
	// 机构管理模块
	T50021(), T50022(), T50023(), T50024(), T50025(), T50026(), T50027(), T50028(), T50029(), T50030(),
	// 任务管理模块
	T51001(), T51002(), T51003(), T51004(), T51005(), T51006(), T51007(), T51008(), T51009(), T51010(), T51011,
	// RBAC数据同步
	T50031(), T50032(),
	// webService接口通信
	T60001(), ECIF1001(),ECIF1002(),ECIF1003(),ECIF1004(),ECIF1005(),ECIF1006(),ECIF1007(),

	// 系统框架公共交易
	T90001(), T90002(), T90003(), T90004(), T90005(), T99999(), T99998(), T99997(), T99996(), T();

	/**
	 * 返回中文
	 * 
	 * @return
	 */
	public String cnname() {
		switch (this) {
		
		case T20001:
			return "图片查询";
		case T20002:
			return "图片保存";
		case T20003:
			return "图片删除";
		case T20004:
			return "图片更新";
		case T20005:
			return "图片编辑";
		case T20006:
			return "图片上传";
		case T20007:
			return "图文资源";
		case T20008:
			return "首页条目";
		case T20009:
			return "条目查询";
		case T20010:
			return "条目连接";
		case T20011:
			return "首页广告";
			
		case T21001:
			return "资源查询";
		case T21002:
			return "资源保存";
		case T21003:
			return "资源删除";
		case T21004:
			return "资源编辑跳转";
		case T21005:
			return "资源编辑保存";
		case T21006:
			return "资源上传";
		case T21007:
			return "首页广告";
		case T21008:
			return "首页条目";
		case T21009:
			return "条目查询";
		case T21010:
			return "条目连接";
			
		case T22001:
			return "品牌列表查询";
		case T22002:
			return "品牌新增查询";
		case T22003:
			return "品牌保存";
		case T22004:
			return "品牌删除";
		case T22005:
			return "品牌编辑查询";
		case T22006:
			return "品牌编辑保存";
		case T22007:
			return "品牌app请求";
		case T22008:
			return "暂不用";
		case T22009:
			return "暂不用";
		case T22010:
			return "暂不用";
			
		case T23001:
			return "车辆列表查询";
		case T23002:
			return "车辆新增查询";
		case T23003:
			return "车辆保存";
		case T23004:
			return "车辆删除";
		case T23005:
			return "车辆编辑查询";
		case T23006:
			return "车辆编辑保存";
		case T23007:
			return "车辆app请求";
		case T23008:
			return "车辆webview";
		case T23009:
			return "暂不用";
		case T23010:
			return "暂不用";
			
		case T24001:
			return "4s店列表查询";
		case T24002:
			return "4s店新增查询";
		case T24003:
			return "4s店保存";
		case T24004:
			return "4s店删除";
		case T24005:
			return "4s店编辑查询";
		case T24006:
			return "4s店编辑保存";
		case T24007:
			return "4s店app请求";
		case T24008:
			return "暂不用";
		case T24009:
			return "暂不用";
		case T24010:
			return "暂不用";
			
		case T25001:
			return "4s店销售员列表查询";
		case T25002:
			return "4s店销售员新增查询";
		case T25003:
			return "4s店销售员保存";
		case T25004:
			return "4s店销售员删除";
		case T25005:
			return "4s店销售员编辑查询";
		case T25006:
			return "4s店销售员编辑保存";
		case T25007:
			return "4s店销售员app请求";
		case T25008:
			return "暂不用";
		case T25009:
			return "暂不用";
		case T25010:
			return "暂不用";
			
		case T26001:
			return "4s店车型列表查询";
		case T26002:
			return "4s店车型新增查询";
		case T26003:
			return "4s店车型保存";
		case T26004:
			return "4s店车型删除";
		case T26005:
			return "4s店车型编辑查询";
		case T26006:
			return "4s店车型编辑保存";
		case T26007:
			return "4s店车型app请求";
		case T26008:
			return "暂不用";
		case T26009:
			return "暂不用";
		case T26010:
			return "暂不用";
			
			
		case T31001:
			return "进口车品牌列表查询";
		case T31002:
			return "进口车品牌新增查询";
		case T31003:
			return "进口车品牌保存";
		case T31004:
			return "进口车品牌删除";
		case T31005:
			return "进口车品牌编辑查询";
		case T31006:
			return "进口车品牌编辑保存";
		case T31007:
			return "进口车品牌app请求";
		case T31008:
			return "暂不用";
		case T31009:
			return "暂不用";
		case T31010:
			return "暂不用";
			
		case T32001:
			return "进口车车辆列表查询";
		case T32002:
			return "进口车车辆新增查询";
		case T32003:
			return "进口车车辆保存";
		case T32004:
			return "进口车车辆删除";
		case T32005:
			return "进口车车辆编辑查询";
		case T32006:
			return "进口车车辆编辑保存";
		case T32007:
			return "进口车车辆app请求";
		case T32008:
			return "进口车车辆webview";
		case T32009:
			return "暂不用";
		case T32010:
			return "暂不用";
			
		case T33001:
			return "进口车列表查询";
		case T33002:
			return "进口车新增查询";
		case T33003:
			return "进口车保存";
		case T33004:
			return "进口车删除";
		case T33005:
			return "进口车编辑查询";
		case T33006:
			return "进口车编辑保存";
		case T33007:
			return "进口车app请求";
		case T33008:
			return "暂不用";
		case T33009:
			return "暂不用";
		case T33010:
			return "暂不用";
			
		case T34001:
			return "进口车销售员列表查询";
		case T34002:
			return "进口车销售员新增查询";
		case T34003:
			return "进口车销售员保存";
		case T34004:
			return "进口车销售员删除";
		case T34005:
			return "进口车销售员编辑查询";
		case T34006:
			return "进口车销售员编辑保存";
		case T34007:
			return "进口车销售员app请求";
		case T34008:
			return "暂不用";
		case T34009:
			return "暂不用";
		case T34010:
			return "暂不用";
			
		case T35001:
			return "进口车车型列表查询";
		case T35002:
			return "进口车车型新增查询";
		case T35003:
			return "进口车车型保存";
		case T35004:
			return "进口车车型删除";
		case T35005:
			return "进口车车型编辑查询";
		case T35006:
			return "进口车车型编辑保存";
		case T35007:
			return "进口车车型app请求";
		case T35008:
			return "暂不用";
		case T35009:
			return "暂不用";
		case T35010:
			return "暂不用";
			
		case T30001:
			return "版本查询";
		case T30002:
			return "版本新增";
		case T30003:
			return "版本删除";
		case T30004:
			return "版本编辑";
		case T30005:
			return "版本编辑跳转";
		case T40001:
			return "APP用户注册";
		case T40002:
			return "APP用户登录";
			
		case T50001:
			return "角色查询";
		case T50002:
			return "角色菜单配置";
		case T50003:
			return "角色菜单配置保存";
		case T50004:
			return "角色新增";
		case T50005:
			return "角色新增提交";
		case T50006:
			return "角色详细信息";
		case T50007:
			return "角色编辑保存";
		case T50008:
			return "角色删除";
			
		case T50021:
			return "机构查询";
		case T50022:
			return "机构新增";
		case T50023:
			return "机构新增提交";
		case T50024:
			return "机构详细信息";
		case T50025:
			return "机构编辑保存";
		case T50026:
			return "机构删除";
		case T50030:
			return "角色用户信息同步";
		case T50031:
			return "角色菜单信息同步";
			
		case T50011:
			return "用户查询";
		case T50012:
			return "用户新增";
		case T50013:
			return "用户新增保存";
		case T50014:
			return "用户删除";
		case T50015:
			return "用户编辑";
		case T50016:
			return "用户查看";
		case T50017:
			return "用户编辑保存";
		case T50018:
			return "用户密码重置";
		case T50019:
			return "用户置离线";
		case T50020:
			return "用户修改密码保存";	
			
		case T51001:
			return "任务管理_任务领取";
		case T51002:
			return "任务管理_审批";
		case T51003:
			return "任务管理_已办任务查询";
		case T51004:
			return "任务管理_任务详情";
		case T51005:
			return "任务管理_客户信息";
		case T51006:
			return "任务管理_业务信息";
		case T51011:
			return "任务领取记录查询";
		case T60001:
			return "客户列表查询";
		case ECIF1001:
			return "ECIF1001用户注册";
		case ECIF1002:
			return "ECIF1002安全问题设置接口";
		case ECIF1003:
			return "ECIF1003安全问题认证接口";
		case ECIF1004:
			return "ECIF1004客户密码重置/修改接口";
		case ECIF1005:
			return "ECIF1005个人客户详细信息查询";
		case ECIF1006:
			return "ECIF1006个人客户360完整视图查询";
		case ECIF1007:
			return "ECIF1007个人客户信息修改";
		case T90004:
			return "生成主键";
		case T90005:
			return "生成流水号";
		case T90001:
			return "附件上传";
		case T90002:
			return "附件下载";
		case T90003:
			return "附件删除";
			
		case T99996:
			return "影像信息";
		case T99997:
			return "用户签退";
		case T99998:
			return "页面跳转";
		case T99999:
			return "用户登录";
		default:
			return "参数错误";
		}
	}
}
