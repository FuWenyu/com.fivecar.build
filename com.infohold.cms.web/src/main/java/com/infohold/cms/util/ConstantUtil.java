package com.infohold.cms.util;

/**
 * 常量工具类
 */
public class ConstantUtil {
	/**
	 * webservice返回码
	 */
	// 成功
	public static final String WEBSERVICE_RETURN_SUCCESS = "1";
	// 失败
	public static final String WEBSERVICE_RETURN_FAILED = "0";

	/**
	 * 认证状态
	 */
	// 未认证
	public static final String ACCREDIT_STATUS_NO = "0";
	// 已认证
	public static final String ACCREDIT_STATUS_YES = "1";
	// 认证中
	public static final String ACCREDIT_STATUS_UNDERWAY = "2";
	// 认证失败
	public static final String ACCREDIT_STATUS_FAILED = "3";
	// 更换中
	public static final String ACCREDIT_STATUS_REPLACE = "4";

	/**
	 * 账户类别
	 */
	// 个人
	public static final String ACCOUNT_TYPE_PERSON = "1";
	// 企业
	public static final String ACCOUNT_TYPE_ENTERPRISE = "2";

	/**
	 * 安全级别
	 */
	// 低
	public static final String SECURITY_LEVEL_LOW = "0";
	// 中
	public static final String SECURITY_LEVEL_MIDDLE = "1";
	// 高
	public static final String SECURITY_LEVEL_HIGH = "2";

	/**
	 * 是否选项
	 */
	// 否
	public static final String YESORNO_OPTION_NO = "0";
	// 是
	public static final String YESORNO_OPTION_YES = "1";

	/**
	 * 与核算交互相关参数
	 */
	// 柜员号
	public static final String BRANCH_NO = "9999";
	// 柜员号
	public static final String CHANNEL_NO = "TFSPPORTAL";
	// 币种
	public static final String MONEY_TYPE_CHINA = "CNY";

	/**
	 * 核算返回码
	 */
	// 成功
	public static final long IFAP_RETURN_SUCCESS = 0;

	/**
	 * 转让选项
	 */
	// 未转让
	public static final String CHANGE_FLAG_NO = "0";
	// 转让中
	public static final String CHANGE_FLAG_DOING = "1";
	// 已转让
	public static final String CHANGE_FLAG_YES = "2";
	// 转让失败
	public static final String CHANGE_FLAG_FAIL = "3";

	/**
	 * 转账标识
	 */
	// 未转账
	public static final String TRANSFER_FLAG_NO = "0";
	// 已转账
	public static final String TRANSFER_FLAG_YES = "1";
	/**
	 * 投资类型
	 */
	// 0-投资原项目
	public static final String INVEST_STATUS_NORMAL = "0";
	// 1-投资转让项目
	public static final String INVEST_STATUS_TRANSFER = "1";

	/**
	 * 设置标识
	 */
	// 未设置
	public static final String SETTING_FLAG_NO = "0";
	// 已设置
	public static final String SETTING_FLAG_YES = "1";

	/**
	 * 项目状态
	 */
	// 未满标
	public static final String PROJECT_STATUS_NOTFULL = "1";
	// 已满标
	public static final String PROJECT_STATUS_FULL = "2";
	// 流标处理中
	public static final String PROJECT_STATUS_RUNING = "3";
	// 已流标
	public static final String PROJECT_STATUS_RUN = "4";
	// 放款中
	public static final String PROJECT_STATUS_LOANING = "5";
	// 已放款
	public static final String PROJECT_STATUS_LOAN = "6";
	// 结清
	public static final String PROJECT_STATUS_OVER = "7";
	// 流标处理失败
	public static final String ROJECT_STATUS_RUNING_FAIL = "8";
	// 放款处理失败
	public static final String PROJECT_STATUS_LOANING_FAIL = "9";

	/**
	 * 证件类型
	 */
	// 身份证
	public static final String CERT_TYPE_IDCARD = "01";

	/**
	 * 登录类型
	 */
	// 电脑
	public static final String LOGIN_TYPE_PC = "1";
	// 手机APP
	public static final String LOGIN_TYPE_MOBILE = "2";
	// PAD
	public static final String LOGIN_TYPE_PAD = "3";
	// 微信公众账号
	public static final String LOGIN_TYPE_WECHAT = "4";

	/**
	 * 逾期标识
	 */
	// 未逾期
	public static final String OVER_FLAG_NO = "0";
	// 已逾期
	public static final String OVER_FLAG_YES = "1";

	/**
	 * 满标标识
	 */
	// 未满标
	public static final String FULL_FLAG_NO = "N";
	// 已满标
	public static final String FULL_FLAG_YES = "Y";

	/**
	 * 放款审批状态
	 */
	// 待审核
	public static final String GRANT_STATUS_NO = "0";
	// 审批中
	public static final String GRANT_STATUS_DOING = "1";
	// 审批完成
	public static final String GRANT_STATUS_YES = "2";

	/**
	 * 交易附言
	 */
	// 充值
	public static final String BUSINESS_NARRATIVE_RECHARGE = "充值";
	// 取现
	public static final String BUSINESS_NARRATIVE_TAKINGCASH = "取现";
	// 收款
	public static final String BUSINESS_NARRATIVE_GATHERING = "收款";
	// 付款
	public static final String BUSINESS_NARRATIVE_PAYMENT = "付款";
	// 投资冻结
	public static final String BUSINESS_NARRATIVE_INVESTFREEZE = "投资冻结";
	// 投资冻结
	public static final String BUSINESS_NARRATIVE_LOANSETTLEMENT = "贷款结清";
	// 投资冻结
	public static final String BUSINESS_NARRATIVE_ARREARSTORETURN = "正常还款";
	// 投资冻结
	public static final String BUSINESS_NARRATIVE_TRANSFERITEM = "债权转让";

	/**
	 * 交易类型（门户自己使用的分类类型，不是核算接口的交易类型）
	 */
	// 充值
	public static final String BUSINESS_TYPE_RECHARGE = "1";
	// 取现
	public static final String BUSINESS_TYPE_TAKINGCASH = "2";
	// 收款
	public static final String BUSINESS_TYPE_GATHERING = "3";
	// 付款
	public static final String BUSINESS_TYPE_PAYMENT = "4";
	// 生效标志。0未生效；1生效;2结清注销
	public static final String CONTRACT_USABLE_UNEFFECT = "0";
	public static final String CONTRACT_USABLE_EFFECT = "1";
	public static final String CONTRACT_USABLE_OVER = "2";
	// 手续费代码
	// 10001 VIP会员费
	// 10002 提现手续费
	// 10003 大额提现手续费
	// 10004 借款服务费
	// 10006 转让服务费
	// 10007 印花税
	// 10008 投资（利息）管理费
	public static final int CHARGE_CODE_VIP = 10001;
	public static final int CHARGE_CODE_TAKINGCASH = 10002;
	public static final int CHARGE_CODE_LARGE_TAKINGCASH = 10003;
	public static final int CHARGE_CODE_LOAN = 10004;
	public static final int CHARGE_CODE_TRANSFER = 10006;
	public static final int CHARGE_CODE_STAMP = 10007;
	public static final int CHARGE_CODE_INVEST = 10008;
}
