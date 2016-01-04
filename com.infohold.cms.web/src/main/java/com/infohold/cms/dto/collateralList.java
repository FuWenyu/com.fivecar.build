package com.infohold.cms.dto;

import java.math.BigDecimal;

public class collateralList {
	/**
	 *    押品编号
	 */
	private String  collateral_id;
	
	/**
	 *    抵押金额
	 */
	private BigDecimal   gua_share;

	public String getCollateral_id() {
		return collateral_id;
	}

	public void setCollateral_id(String collateral_id) {
		this.collateral_id = collateral_id;
	}

	public BigDecimal getGua_share() {
		return gua_share;
	}

	public void setGua_share(BigDecimal gua_share) {
		this.gua_share = gua_share;
	}
	
	
	
}
