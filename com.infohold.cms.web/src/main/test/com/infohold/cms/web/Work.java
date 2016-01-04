package com.infohold.cms.web;




import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.UUID;

import oracle.sql.DATE;

/**
 * 填写工作量
 * */

public class Work {

	private static final int DAYS = 1;

	public static void main(String[] args) throws ParseException {
		String beginDate = "20150617";
		String userid = "2c948ac53da52bc0013da52bc0270032";//王守业
		String ITPaperId = "CCDC_0022";//信用服务平台
		int hours = 8;//工时
		String work_type = "wt_6";//产品研发
		String project_id = "2c948ac53da57ad2SYSAAA0000000019";//信用服务平台
		//String content = "融资服务平台之公共模块：附件上传、下载、删除后台实现方式更改，由保存到应用服务器改为保存到数据库中。";
		//String content = "融资服务平台之担保公司端：缺陷修复，接口联调；";
		//String content = "融资服务平台之运营中心端开发：缺陷修复，接口联调；";
		String content = "信用服务平台开发：支持SIT测试；";
		Work work = new Work();
		// 查询UUID
		String ITUUID = work.getUUID(ITPaperId);
		String[] dates = work.getDates(beginDate);
		work.workLoad(dates, userid, content, ITUUID ,hours ,work_type,project_id);
	}

	/**
	 * 数据库连接
	 * */
	private Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@10.172.51.2:1521:orcl", "pmanager",
					"pmanager");
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 查询需求uuid
	 * */
	private String getUUID(String ITPaperId) {
		Connection conn = getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String UUID = null;
		try {
			String sql = "select ID from pm_it_paper where REQ_ID=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ITPaperId);
			rs = stmt.executeQuery();
			if (rs.next())
				UUID = rs.getString("ID");
			return UUID;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * 生成UUID,流水
	 * */

	private String generateUUID() {
		String uuid = UUID.randomUUID().toString();
		return uuid.replaceAll("-", "");
	}

	/**
	 * 计算日期
	 * 
	 * @throws ParseException
	 * */
	private String[] getDates(String beginDate) throws ParseException {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmdd");
		SimpleDateFormat sdf_to = new SimpleDateFormat("yyyy-mm-dd");
		c.setTime(sdf.parse(beginDate));
		String[] dates = new String[DAYS];
		for (int i = 0; i < DAYS; i++) {
			dates[i] = sdf_to.format(c.getTime());
			c.add(Calendar.DAY_OF_YEAR, 1);
		}
		return dates;
	}

	/**
	 * 工作量
	 * */
	private void workLoad(String[] dates, String userid, String content,
			String ITUUID,int hours,String work_type,String project_id) {
		Connection conn = getConnection();
		PreparedStatement stmt = null;
		int[] rs = null;
		try {
			String sql = "insert into pm_workload values (?,?,?,?,?,?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			conn.setAutoCommit(false);
			for (int i = 0; i < DAYS; i++) {
				stmt.setString(1, generateUUID());
				stmt.setString(2, userid);
				stmt.setString(3, work_type);
				stmt.setString(4, ITUUID);
				stmt.setString(5, content);
				stmt.setInt(6, hours);
				stmt.setString(7, "");
				stmt.setObject(8, new DATE(dates[i] + " 00:00:00"));
				stmt.setObject(9, new DATE(dates[i] + " 00:00:00"));
				stmt.setString(10, "w_1");
				stmt.setString(11, project_id);
				stmt.addBatch();
			}
			rs = stmt.executeBatch();
			stmt.clearBatch();
			conn.commit();
			for (int i = 0; i < rs.length; i++) {
				if (rs[i] == 0)
					System.out.println("执行失败");
				else
					System.out.println("执行成功");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.setAutoCommit(true);
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
