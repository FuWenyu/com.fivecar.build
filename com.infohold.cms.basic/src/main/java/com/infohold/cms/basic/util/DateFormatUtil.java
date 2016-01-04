package com.infohold.cms.basic.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateFormatUtil {

	public static String getCurrentTime() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		return sdf.format(date);
	}

	public static String getCurrentDate() {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return df.format(date);
	}

	public static String getCurrentDateTime() {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		return df.format(date);
	}

	public static String format(Date date) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		if (date == null)
			return "";
		return df.format(date);
	}
	
	public static Date format(String date,String format) {
		SimpleDateFormat df = new SimpleDateFormat(format);
		if (date == null)
			return null;
		try {
			return df.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String getTime(Date date) {
		DateFormat df = new SimpleDateFormat("HH:mm:ss");
		return df.format(date);
	}

	public static String getFormatDate(Date date, String format) {
		DateFormat df = new SimpleDateFormat(format);
		return df.format(date);
	}

	public static String getCurrDate() {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS");
		Date date = new Date();
		return df.format(date);
	}

	public static String getDate() {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return df.format(date);
	}

	public static Date DateToStr(String date) {
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		try {
			return df.parse(date);
		} catch (ParseException e) {
			return null;
		}
	}

	public static Date getDate(String format) {
		DateFormat df = new SimpleDateFormat(format);
		Date date = new Date();
		String str = df.format(date);
		try {
			return df.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String getFormatDate(String format) {
		DateFormat df = new SimpleDateFormat(format);
		Date date = new Date();
		String str = df.format(date);
		return str;
	}

	/**
	 * 以输入时间为准，向后滚动需要的天数后返回日期的格式字符串 返回日期格式 yyyyMMdd
	 * 
	 * @param days
	 *            :向后滚动的天数
	 * @param inputDate
	 *            :需要滚动的基准日期格式为yyyyMMdd
	 * 
	 */
	public static String rolDate(String inputDate, long days) {
		java.util.Date inday = bocmDateToCal(inputDate).getTime();
		long l = inday.getTime();
		long rol = l + days * 24 * 60 * 60 * 1000;
		java.util.Date rolDay = new java.util.Date(rol);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(rolDay);
		int i = calendar.get(Calendar.YEAR);
		int j = calendar.get(Calendar.MONTH) + 1;
		int k = calendar.get(Calendar.DATE);
		return "" + i + (j >= 10 ? "" + j : "0" + j)
				+ (k >= 10 ? "" + k : "0" + k);

	}

	public static Calendar bocmDateToCal(String s) {
		int i = Integer.parseInt(s.substring(0, 4));
		int j = Integer.parseInt(s.substring(4, 6)) - 1;
		int k = Integer.parseInt(s.substring(6, 8));
		Calendar calendar = Calendar.getInstance();
		calendar.clear();
		calendar.set(i, j, k, 0, 0, 0);
		return calendar;
	}

	/**
	 * 根据日期和格式，返回date类型对象
	 * 
	 * @param date
	 * @param format
	 * @return
	 */
	public static Date getDateByFormat(String date, String format) {
		DateFormat df = new SimpleDateFormat(format);
		try {
			return df.parse(date);
		} catch (ParseException e) {
			return null;
		}
	}
	
	/**
	 * 获取年份加减结果
	 * @param currDte 当前日期
	 * @param n 加减值
	 * @return
	 */
	public static Date addYear(Date currDte,int n){
		GregorianCalendar gregorianCalendar = new GregorianCalendar();
		gregorianCalendar.setTime(currDte);
		gregorianCalendar.add(1,n);
		return gregorianCalendar.getTime();
	}
	
	/**
	 * 获取月份加减结果
	 * @param currDte 当前日期
	 * @param n 加减值
	 * @return
	 */
	public static Date addMonth(Date currDte,int n){
		GregorianCalendar gregorianCalendar = new GregorianCalendar();
		gregorianCalendar.setTime(currDte);
		gregorianCalendar.add(2,n);
		return gregorianCalendar.getTime();
	}
	
	/**
	 * 获取当期日期天数加减结果
	 * @param currDte 当前日期
	 * @param n 加减值
	 * @return
	 */
	public static Date addDay(Date currDte,int n){
		GregorianCalendar gregorianCalendar = new GregorianCalendar();
		gregorianCalendar.setTime(currDte);
		gregorianCalendar.add(5,n);
		return gregorianCalendar.getTime();
	}

	public static void main(String [] args){
//		GregorianCalendar gregorianCalendar = new GregorianCalendar();
//		gregorianCalendar.setTime(getDate("yyyy-MM-dd HH:mm:ss"));
//		gregorianCalendar.add(1,1);
//		gregorianCalendar.getTime();
//		System.out.println(gregorianCalendar.getTime()	);
//		Date curDate=getDate("yyyy-MM-dd HH:mm:ss");
		System.out.println(format(	format("20150323","yyyyMMdd")));
		}
}
