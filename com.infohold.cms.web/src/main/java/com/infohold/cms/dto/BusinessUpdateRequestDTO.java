package com.infohold.cms.dto;

/**
 * 业务申请补录请求数据
 * @author ZhangHongChao
 *
 */
public class BusinessUpdateRequestDTO {

		/**
		 * 公共请求信息
		 */
		private SessionContext sessionContext;
		
		/**
		 * 流水号
		 */
		private String userReferenceNumber;
		/**
		 * 返回码1成功0失败
		 */
		private String replyCode;
		
		/**
		 * 返回信息
		 */
		private String replyExp;
		/**
		 * 贷款用途
		 */
		private String DKYT;
		/**
		 * 还款方式
		 */
		private String HKFS;
		/**
		 * 利率计算方式
		 */
		private String ZXLLJSFS;
		/**
		 * 执行利率变动方式
		 */
		private String ZXLLBDFS;
		/**
		 * 执行利率变动系数
		 */
		private String ZXLLBDXS;
		/**
		 * 执行利率值
		 */
		private String ZXLL;
		/**
		 * 逾期利率变动方式
		 */
		private String YQLLBDFS;
		/**
		 * 逾期利率变动系数
		 */
		private String YQLLBDXS;
		/**
		 * 逾期利率值
		 */
		private String YQLL;
		/**
		 * 挪用利率变动方式
		 */
		private String NYLLBDFS;
		/**
		 * 挪用利率变动系数
		 */
		private String NYLLBDXS;
		/**
		 * 挪用利率值
		 */
		private String NYLL;
		/**
		 * 利率调整生效时间
		 */
		private String LLTZSJ;
		/**
		 * 复利标志
		 */
		private String FLBZ;
		
		/**
		 * 任务号
		 */
		private String taskSeq;
		
		/**
		 * 任务
		 */
		private Transition[] transition;
		
		public String getTaskSeq() {
			return taskSeq;
		}
		public void setTaskSeq(String taskSeq) {
			this.taskSeq = taskSeq;
		}
		public Transition[] getTransition() {
			return transition;
		}
		public void setTransition(Transition[] transition) {
			this.transition = transition;
		}
		public SessionContext getSessionContext() {
			return sessionContext;
		}
		public void setSessionContext(SessionContext sessionContext) {
			this.sessionContext = sessionContext;
		}
		public String getUserReferenceNumber() {
			return userReferenceNumber;
		}
		public void setUserReferenceNumber(String userReferenceNumber) {
			this.userReferenceNumber = userReferenceNumber;
		}
		public String getDKYT() {
			return DKYT;
		}
		public void setDKYT(String dKYT) {
			DKYT = dKYT;
		}
		public String getHKFS() {
			return HKFS;
		}
		public void setHKFS(String hKFS) {
			HKFS = hKFS;
		}
		public String getZXLLJSFS() {
			return ZXLLJSFS;
		}
		public void setZXLLJSFS(String zXLLJSFS) {
			ZXLLJSFS = zXLLJSFS;
		}
		public String getZXLLBDFS() {
			return ZXLLBDFS;
		}
		public void setZXLLBDFS(String zXLLBDFS) {
			ZXLLBDFS = zXLLBDFS;
		}
		public String getZXLLBDXS() {
			return ZXLLBDXS;
		}
		public void setZXLLBDXS(String zXLLBDXS) {
			ZXLLBDXS = zXLLBDXS;
		}
		public String getZXLL() {
			return ZXLL;
		}
		public void setZXLL(String zXLL) {
			ZXLL = zXLL;
		}
		public String getYQLLBDFS() {
			return YQLLBDFS;
		}
		public void setYQLLBDFS(String yQLLBDFS) {
			YQLLBDFS = yQLLBDFS;
		}
		public String getYQLLBDXS() {
			return YQLLBDXS;
		}
		public void setYQLLBDXS(String yQLLBDXS) {
			YQLLBDXS = yQLLBDXS;
		}
		public String getYQLL() {
			return YQLL;
		}
		public void setYQLL(String yQLL) {
			YQLL = yQLL;
		}
		public String getNYLLBDFS() {
			return NYLLBDFS;
		}
		public void setNYLLBDFS(String nYLLBDFS) {
			NYLLBDFS = nYLLBDFS;
		}
		public String getNYLLBDXS() {
			return NYLLBDXS;
		}
		public void setNYLLBDXS(String nYLLBDXS) {
			NYLLBDXS = nYLLBDXS;
		}
		public String getNYLL() {
			return NYLL;
		}
		public void setNYLL(String nYLL) {
			NYLL = nYLL;
		}
		public String getLLTZSJ() {
			return LLTZSJ;
		}
		public void setLLTZSJ(String lLTZSJ) {
			LLTZSJ = lLTZSJ;
		}
		public String getFLBZ() {
			return FLBZ;
		}
		public void setFLBZ(String fLBZ) {
			FLBZ = fLBZ;
		}
		public String getReplyCode() {
			return replyCode;
		}
		public void setReplyCode(String replyCode) {
			this.replyCode = replyCode;
		}
		public String getReplyExp() {
			return replyExp;
		}
		public void setReplyExp(String replyExp) {
			this.replyExp = replyExp;
		}




}