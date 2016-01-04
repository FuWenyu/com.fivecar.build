package com.infohold.cms.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Calendar;
/*
 * 
 * 时间、日期的工具类。
 * 
 * */
public class DateUtil {

	public String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}

	public String getCurrentTime() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}
	
	public Timestamp getTimestamp() {
		Date date = new Date();
		Timestamp tt = new Timestamp(date.getTime());
		return tt;
	}
	
	public String paresDate(Timestamp date, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}

	public String parseDate(String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date date = new Date();
		return sdf.format(date);
	}

	public Date parseDate(String dateString, String pattern) {
		SimpleDateFormat simpledateformat = new SimpleDateFormat(pattern);
		try {
			return (java.util.Date) simpledateformat.parse(dateString);
		} catch (ParseException e) {
			throw new IllegalArgumentException(e.getMessage());
		}
	}

	/**
	 * 计算两个日期相差的月数
	 * */
	public int monthSpace(String begin, String end) {
		Calendar c_begin = Calendar.getInstance();
		c_begin.setTime(parseDate(begin, "yyyy-MM-dd"));
		Calendar c_end = Calendar.getInstance();
		c_end.setTime(parseDate(end, "yyyy-MM-dd"));
		if (c_begin.compareTo(c_end) > 0)// 如果begin>end异常
			return -1;
		int begin_year = c_begin.get(Calendar.YEAR);
		int begin_month = c_begin.get(Calendar.MONTH);
		int begin_day = c_begin.get(Calendar.DATE);
		int end_year = c_end.get(Calendar.YEAR);
		int end_month = c_end.get(Calendar.MONTH);
		int end_day = c_end.get(Calendar.DATE);
		int monthday = (end_year - begin_year) * 12 + (end_month - begin_month);
		if (begin_day < end_day)
			monthday++;
		return monthday;
	}
	/**
	 * 计算两个日期相差的月数格式差别
	 * */
	public int monthSpaceOther(String begin, String end) {
		Calendar c_begin = Calendar.getInstance();
		c_begin.setTime(parseDate(begin, "yyyyMMdd"));
		Calendar c_end = Calendar.getInstance();
		c_end.setTime(parseDate(end, "yyyyMMdd"));
		if (c_begin.compareTo(c_end) > 0)// 如果begin>end异常
			return -1;
		int begin_year = c_begin.get(Calendar.YEAR);
		int begin_month = c_begin.get(Calendar.MONTH);
		int begin_day = c_begin.get(Calendar.DATE);
		int end_year = c_end.get(Calendar.YEAR);
		int end_month = c_end.get(Calendar.MONTH);
		int end_day = c_end.get(Calendar.DATE);
		int monthday = (end_year - begin_year) * 12 + (end_month - begin_month);
		if (begin_day < end_day)
			monthday++;
		return monthday;
	}

	/**
	 * 以输入时间为准，向后滚动需要的天数后返回日期的格式字符串 返回日期格式 yyyyMMdd
	 *
	 * @param days:向后滚动的天数
	 * @param inputDate:需要滚动的基准日期格式为yyyyMMdd
	 *
	 */
	public String rolDate(String inputDate, long days) {
		java.util.Date inday = bocmDateToCal(inputDate).getTime();
		long l = inday.getTime();
		long rol = l + days * 24 * 60 * 60 * 1000;
		java.util.Date rolDay = new java.util.Date(rol);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(rolDay);
		int i = calendar.get(Calendar.YEAR);
		int j = calendar.get(Calendar.MONTH) + 1;
		int k = calendar.get(Calendar.DATE);
		return ""
			+ i
			+ (j >= 10 ? "" + j : "0" + j)
			+ (k >= 10 ? "" + k : "0" + k);

	}
	
	/**
	 * 以输入时间为准，向后滚动需要的年后返回日期的格式字符串 返回日期格式 yyyyMMdd
	 *
	 * @param days:向后滚动的年
	 * @param inputDate:需要滚动的基准日期格式为yyyyMMdd
	 *
	 */
	public String rolYearDate(String inputDate, long years) {
		java.util.Date inday = bocmDateToCal(inputDate).getTime();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(inday);
		int i = calendar.get(Calendar.YEAR)+1;
		int j = calendar.get(Calendar.MONTH) + 1;
		int k = calendar.get(Calendar.DATE);
		return ""
			+ i
			+ (j >= 10 ? "" + j : "0" + j)
			+ (k >= 10 ? "" + k : "0" + k);

	}
	
    public Calendar bocmDateToCal(String s)
    {
        int i = Integer.parseInt(s.substring(0, 4));
        int j = Integer.parseInt(s.substring(4, 6)) - 1;
        int k = Integer.parseInt(s.substring(6, 8));
        Calendar calendar = Calendar.getInstance();
        calendar.clear();
        calendar.set(i, j, k, 0, 0, 0);
        return calendar;
    }
    
    public void main(String args[])
    {
    	BigDecimal Amt = new BigDecimal(100);// 借款金额

    	System.out.println(Amt.divide(new BigDecimal(3),2,BigDecimal.ROUND_HALF_UP));
    	
    }
}
