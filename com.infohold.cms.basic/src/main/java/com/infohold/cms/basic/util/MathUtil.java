package com.infohold.cms.basic.util;

import java.util.Random;

public class MathUtil {

	/**
	 * 生成N以内的随机数
	 * @param n
	 * @return
	 */
	public static int getRandomInt(int n){
		Random random = new Random();
		int num=random.nextInt(n);
		return num;
	}
	
	/**
	 * 取整数
	 * @param n
	 * @return
	 */
	public static int getFloorInt(Double n){
		return (int) Math.floor(n);
	}
	
	public static void main(String [] args){
		System.out.println(getFloorInt(1.22));
	}
}
