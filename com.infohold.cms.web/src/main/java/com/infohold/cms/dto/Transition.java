package com.infohold.cms.dto;

/**
 * Transition generated by hbm2java
 */
public class Transition {

    /**
     * 运营中心数据
     */
    private String    pid;

    private String   transitionId;

    private String   transitionName;

    private String   transitionDesc;

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getTransitionId() {
		return transitionId;
	}

	public void setTransitionId(String transitionId) {
		this.transitionId = transitionId;
	}

	public String getTransitionName() {
		return transitionName;
	}

	public void setTransitionName(String transitionName) {
		this.transitionName = transitionName;
	}

	public String getTransitionDesc() {
		return transitionDesc;
	}

	public void setTransitionDesc(String transitionDesc) {
		this.transitionDesc = transitionDesc;
	}


}
