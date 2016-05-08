package com.infohold.cms.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.infohold.cms.basic.common.Page;
import com.infohold.cms.basic.dao.BaseDao;
import com.infohold.cms.basic.entity.BaseEntity;
import com.infohold.cms.entity.CarLoanEntity;
import com.infohold.cms.entity.CarLoanInfoEntity;

/**
 * 4s店品牌Dao
 * @author fwy
 *
 */
@SuppressWarnings("unchecked")
@Repository("loanDao")
public class CarLoanDao extends BaseDao<BaseEntity> {
	
	/**
	 * 贷款信息列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryloanList(String modelid,Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select loan.modelid,");
		sql.append("loan.id,");
		sql.append("loan.modelName,");
		sql.append("loan.carprice,");
		sql.append("loan.downpayment,");
		sql.append("loan.downPaymentPercent,");
		sql.append("loan.premium,");
		sql.append("loan.lenderId,");
		sql.append("loan.lender,");
		sql.append("loan.lenderLogo,");
		sql.append("loan.loan12,");
		sql.append("loan.loan24,");
		sql.append("loan.loan36,");
		sql.append("loan.loan48,");
		sql.append("loan.createDate,");
		sql.append("loan.createName ");
		sql.append("from fc_ssss_loan loan ");
		sql.append("where loan.modelid = ");
		sql.append("'");
		sql.append(modelid);
		sql.append("'");
		sql.append(" order by loan.createDate desc");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 金融机构查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> querylenderList(Page page,String orgid){
		page.setPageSize(999);
		StringBuffer sql = new StringBuffer();
		sql.append("select led.id,");
		sql.append("led.lenderName,");
		sql.append("led.telephone,");
		sql.append("led.imageName,");
		sql.append("led.privileges,");
		sql.append("led.privilegesurl,");
		sql.append("led.privilegestile,");
		sql.append("led.url,");
		sql.append("led.urlreal,");
		sql.append("led.description ");
		sql.append("from fc_ssss_lender led ");
		sql.append(" where led.orgid=");
		sql.append("'");
		sql.append(orgid);
		sql.append("'");
		sql.append(" order by led.createDate desc");
	
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 贷款信息列表查询
	 * @param map
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> queryloanList1(String modelid,Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select loan.modelid,");
		sql.append("loan.id,");
		sql.append("loan.modelName,");
		sql.append("loan.carprice,");
		sql.append("loan.downpayment,");
		sql.append("loan.downPaymentPercent,");
		sql.append("loan.premium,");
		sql.append("loan.lenderId,");
		sql.append("loan.lender,");
		sql.append("loan.lenderLogo,");
		sql.append("loan.loan12,");
		sql.append("loan.loan24,");
		sql.append("loan.loan36,");
		sql.append("loan.loan48 ");
		sql.append("from fc_ssss_loan loan ");
		sql.append("where loan.modelid = ");
		sql.append("'");
		sql.append(modelid);
		sql.append("'");

		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 保存贷款信息
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean saveloanEntity(CarLoanEntity entity) {
		super.save(entity);
		return true;
	}
	
	/**
	 * 贷款信息删除
	 * @param id
	 * @return
	 */
	public boolean deleteloanEntity(String id) {
		String deleteUser_HQL = "delete from CarLoanEntity v where v.id = ?";
		excuteUpdate(deleteUser_HQL,id);
		return true;
	}
	/**
	 * 通过ID查询贷款信息信息
	 * @return
	 */

	public CarLoanEntity getloanEntity(String id) {
		CarLoanEntity entity = new CarLoanEntity();
		entity = (CarLoanEntity) super.get(CarLoanEntity.class, id);
		return entity;
	}
	
	/**
	 * 贷款信息更新
	 * @param id，用户主键
	 * @return
	 */
	public boolean loan_update(CarLoanEntity entity) {
		super.update(entity);
		return true;
	}
	/**
	 * 4s店信息查询for页面
	 * @param id，用户主键
	 * @return
	 */
	public List<Map<String, Object>> queryloanListPage(String cardbrandid,Page page){
		StringBuffer sql = new StringBuffer();
		sql.append("select loan.modelid,");
		sql.append("loan.modelName,");
		sql.append("loan.carprice,");
		sql.append("loan.downpayment,");
		sql.append("loan.downPaymentPercent,");
		sql.append("loan.loanInstitution,");
		sql.append("loan.premium,");
		sql.append("loan.loan12,");
		sql.append("loan.loan24,");
		sql.append("loan.loan36,");
		sql.append("loan.loan48,");
		sql.append("loan.createDate,");
		sql.append("loan.createName ");
		sql.append("from fc_ssss_loan loan ");
		sql.append("where loan.carbrandid = ");
		sql.append("'");
		sql.append(cardbrandid);
		sql.append("'");
		sql.append(" order by loan.createDate desc");
		return super.excutePageQuery(sql.toString(),page);
	}
	/**
	 * 图文信息查询
	 * @return
	 */
	public List<Map<String, Object>> getResources() {
		StringBuffer sql = new StringBuffer();
		sql.append("select pm.id,");
		sql.append("pm.title,");
		sql.append("pm.resourceName ");
		sql.append("from fc_app_resources pm ");
		sql.append(" where pm.purpose = ");
		sql.append("'");
		sql.append("ssss");
		sql.append("'");
		sql.append(" order by pm.id desc ");
		return super.queryForList(sql.toString());
	}
	/**
	 * 保存贷款信息
	 * @param VersionEntity
	 * @return boolean
	 */
	public boolean saveloanInfoEntity(CarLoanInfoEntity entity) {
		super.save(entity);
		return true;
	}
	
}
