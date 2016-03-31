package com.infohold.cms.basic.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 字符串工具类
 * */
public class StrUtil {


	/**
	 * 根据权限计算菜单值
	 * */
	public static int setMenu(String[] privs) {
		StringBuffer buffer = new StringBuffer();
		for (String str : privs) {
			buffer.append(str);
		}
		return Integer.valueOf(buffer.toString(), 2).intValue();
	}

	public static String addLeftStr(String strSource, String chrAdd,
			int intLength) {
		if (intLength <= 0)
			return null;
		if (strSource.length() > intLength) {
			return strSource;
		}

		int i = 0;
		StringBuffer strbufTemp = new StringBuffer("");

		while (i < intLength - strSource.length()) {
			strbufTemp = strbufTemp.append(chrAdd);
			i++;
		}

		return strbufTemp.toString() + strSource;
	}

	public static String addRightStr(String strSource, char chrAdd,
			int intLength) {
		if (intLength <= 0)
			return null;
		if (strSource.length() > intLength) {
			return strSource;
		}

		int i = 0;
		StringBuffer strbufTemp = new StringBuffer(strSource);

		while (i < intLength - strSource.length()) {
			strbufTemp = strbufTemp.append(chrAdd);
			i++;
		}

		return strbufTemp.toString();
	}

	/**
	 * 判断输入是否为空 或null
	 * 
	 * @param obj
	 * @return boolean
	 */
	public static boolean isNullOrEmpty(Object obj) {
		if (obj instanceof Object[]) {
			Object[] o = (Object[]) obj;
			for (int i = 0; i < o.length; i++) {
				Object object = o[i];
				if (object instanceof Date) {
					if (object.equals(new Date(0)))
						return true;
				} else if ((object == null) || (("").equals(object))) {
					return true;
				}
			}
		} else {
			if (obj instanceof Date) {
				if (obj.equals(new Date(0))) {
					return true;
				}
			} else if ((obj == null) || (("").equals(obj))) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 获取Exception Stack
	 * */
	public static String getStackTrace(Exception e) {
		StackTraceElement[] elements = e.getStackTrace();
		StringBuffer sb = new StringBuffer();
		if(e.getMessage()!=null)
			sb.append(e.getMessage());
		for (StackTraceElement element : elements) {
			sb.append(element.toString()).append("\r\n");
		}
		return sb.toString();
	}

	/**
	 * 正则表达式截取
	 * */
	public static String getStr(String str, String partten) {
		Pattern pattern = Pattern.compile(partten);
		Matcher matcher = pattern.matcher(str);
		String returnStr = null;
		if (matcher.find())
			returnStr = matcher.group(1);
		return returnStr;
	}

	 
    /**
     * 将JSON字符串转为MAP对象
     * @param jsonStr
     * @return
     */
    public static Map<String, Object> parseJSON2Map(String jsonStr){  
        Map<String, Object> map = new HashMap<String, Object>();  
        //最外层解析  
        JSONObject json = JSONObject.fromObject(jsonStr);  
        for(Object k : json.keySet()){  
            Object v = json.get(k);   
            //如果内层还是数组的话，继续解析  
            if(v instanceof JSONArray){  
                List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();  
                Iterator<JSONObject> it = ((JSONArray)v).iterator();  
                while(it.hasNext()){  
                    JSONObject json2 = it.next();  
                    list.add(parseJSON2Map(json2.toString()));  
                }  
                map.put(k.toString(), list);  
            } else {  
                map.put(k.toString(), v);  
            }  
        }  
        return map;  
    }  
    
    /**
     * 将MAP对象转换成JSON字符串
     * @param map
     * @return
     */
    public static String parseMapToJSON(Map<String, Object> map){  
/*        Map<String, Object> map = new HashMap<String, Object>();  
        map.put("a", "1");
        map.put("b", "2");*/
        JSONObject str=JSONObject.fromObject(map);
        String data=str.toString().replace("\"","'");
        return data;
    }  
    /**
     * 将String 转换成MAP对象
     * @param map
     * @return
     */
    public static Map<String, Object> getMap(String param) {
        Map<String, Object> map = new HashMap<String, Object>();
        if ("".equals(param) || null == param) {
            return map;
        }
        String[] params = param.split("&");
        for (int i = 0; i < params.length; i++) {
            String[] p = params[i].split("=");
            if (p.length == 2) {
                map.put(p[0], p[1]);
            }
        }
        return map;
    }
	
	/**
	 * 测试入口
	 * */
	public static void main(String[] args) {
		String str = "{\"companyCode\":\"000001\",\"certificateNumber\":\"220381198607181111\",\"bankCode\":\"00002\",\"applyId\":\"123456\",\"status\":\"02\",\"loanAccount\":\"\"}";
		String partten = "certificateNumber\":\"([^\"]+)\"";
		//System.out.println(getStr(str, partten));
	//	System.out.println(parseMapToJSON());
	}
}
