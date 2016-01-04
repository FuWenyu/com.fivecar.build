package com.infohold.cms.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.basic.util.MD5Util;
import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.entity.UserEntity;

/**
 * 
 * 描述:登录DAO
 * @author yangyantao
 */
@Repository(value = "loginDao")
public class LoginDao extends BaseDao<BaseEntity> {

	/**
	 * 查询用户信息
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> queryUserInfo(Map<String,Object> map) {
		String loginid=map.get("user_id")+"";
		String user_password=map.get("user_pass")+"";
		String sql ="SELECT "
					+" u.userid, "
					+" u.loginid, "
					+" u.name, "
					+" u.password, "
					+" u.organizationid, "
					+ "o.name as branch_name ,"
					+" u.status "
					+" FROM "
					+" auth_user u,"
					+"	auth_organization o"
					+" WHERE "
					+" u.organizationid=o.orgid  "
					//+" AND type='0'"
					+" AND status <> '2' "
					+" AND u.loginid =  '"+loginid+"' "
					+" AND u.password = '"+MD5Util.encryption(user_password)+"' ";	
		return super.queryForList(sql);
	}
	
	/**
	 * 查询用户角色信息
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> queryUserRoleInfo(Map<String,Object> map) {
		String loginid=map.get("user_id")+"";
		String sql =" select a.userid user_id,"
				+ " a.name user_name,"
				+ " c.id role_id,"
				+ " c.role_code role_code,"
				+ " c.name role_name"
				+ " from auth_user a,auth_user_role b,auth_role c"
				+ " where a.userid=b.userid "
				+ " and b.roleid=c.id"
				+ " and a.loginid='"+loginid+"'"
				;
		return super.queryForList(sql);
	}
	
	/**
	 * 用户签退
	 * @param id，用户主键
	 * @return
	 */
	public void logOut(String id) {
		UserEntity entity = new UserEntity();
		entity = (UserEntity) super.get(entity.getClass(), id);
		entity.setStatus("0");
		super.update(entity);
	}
	
	/**
	 * 用户签退
	 * @param id，用户主键
	 * @return
	 */
	public void logIn(String id) {
		UserEntity entity = new UserEntity();
		entity = (UserEntity) super.get(entity.getClass(), id);
		entity.setStatus("1");
		super.update(entity);
	}

	/**
	 * 立项提醒列表
	 * @param transData
	 * @return
	 */
	public List<Map<String, Object>> remind_approve() {
		String sql ="SELECT "
					+" biz_loan_contract.contract_id ," // `合同编号`, "
					+" biz_loan_contract.product_name ," // `产品名称`, "
					+" biz_loan_contract.amount ," // `项目金额`, "
					+" biz_loan_contract.periods ," // `项目期限`, "
					+" biz_loan_contract.periods_type ," // `期限类型`, "
					+" biz_loan_contract.rat_exe_val ," // `利率`, "
					+" pub_cust_person.cust_name ," // `客户名称`, "
					+" pub_guarantee_org.branch_name" // `担保公司名称` "
					+" FROM "
					+" biz_loan_contract,pub_cust_person,pub_guarantee_org,biz_loan_apply,biz_guarantee_task "
					+" WHERE "
					+" biz_loan_apply.apply_id=biz_guarantee_task.apply_id AND  "
					+" biz_guarantee_task.task_id = biz_loan_contract.task_id AND  "
					+" biz_loan_contract.cust_id = pub_cust_person.cust_id AND  "
					+" pub_cust_person.branch_no = pub_guarantee_org.branch_no AND  "
					+" biz_loan_apply.status = 3";
		return super.queryForList(sql);
	}

	/**
	 * 放款提醒列表
	 * @param transData
	 * @return
	 */
	public List<Map<String, Object>> remind_credit() {
		String sql ="SELECT "
					+" biz_loan_project.contract_id, " // `合同编号`,
					+" biz_loan_contract.product_name, " // `产品名称`,
					+" biz_loan_contract.amount, " // `项目金额`,
					+" biz_loan_contract.periods, " // `项目期限`,
					+" biz_loan_contract.periods_type, " // `期限类型`,
					+" biz_loan_contract.rat_exe_val, " // `利率`,
					+" pub_cust_person.cust_name, " // `客户名称`,
					+" pub_guarantee_org.branch_name " // `担保公司名称`
					+" FROM "
					+" biz_loan_project,biz_loan_contract,pub_cust_person,pub_guarantee_org "
					+" WHERE "
					+" biz_loan_project.contract_id = biz_loan_contract.contract_id AND " 
					+" biz_loan_project.cust_id = pub_cust_person.cust_id  AND  "
					+" pub_cust_person.branch_no = pub_guarantee_org.branch_no AND  "
					+" biz_loan_project.status = 1 ";
		return super.queryForList(sql);
	}
	
	/**
	 * 代偿提醒列表
	 * @param transData
	 * @return
	 */
	public List<Map<String, Object>> remind_quid() {
		String sql ="";
		return super.queryForList(sql);
	}

	/**
	 * 已生效业务数、已放款业务总金额
	 * @return
	 */
	public Map<String, Object> getEfficient_businessCount() {
		String sql ="SELECT "
					+"	count(biz_loan_project.project_id) efficient_businessCount, "
					+"	SUM(biz_loan_project.project_amount) hasloan_businessAmount "
					+"FROM "
					+"	biz_loan_project "
					+"WHERE "
					+"	biz_loan_project.status = 6";
		return queryForMap(sql);
	}

	/**
	 * 已结清业务数、业务总金额
	 * @return
	 */
	public Map<String, Object> getSettlement_businessCount() {
		String sql ="SELECT "
					+"	count(biz_loan_project.project_id) settlement_businessCount, "
					+"	SUM(biz_loan_project.project_amount) settlement_businessAmount "
					+"FROM "
					+"	biz_loan_project "
					+"WHERE "
					+"	biz_loan_project.status = 7";
		return queryForMap(sql);
	}
	
	/**
	 * 获取首页公告列表
	 * @param page 
	 * @return
	 */
	public List<Map<String, Object>> getNoticeList(Page page) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT "
					+" biz_news_notice.id_, "
					+" biz_news_notice.title, "
					+" biz_news_notice.create_date "
					+" FROM "
					+" biz_news_notice "
					+" WHERE "
					+" biz_news_notice.dest_sys_flag = 3 "
					+" ORDER BY "
					+" biz_news_notice.create_date DESC");
		return super.excutePageQuery(sql.toString(), page);
	}

	/**
	 * 获取公告详细信息
	 * @param id_
	 * @return
	 */
	public Map<String, Object> getNoticeById(String id_) {
		String sql = "select * from biz_news_notice where biz_news_notice.id_="+id_;
		return super.queryForMap(sql);
	}


}
