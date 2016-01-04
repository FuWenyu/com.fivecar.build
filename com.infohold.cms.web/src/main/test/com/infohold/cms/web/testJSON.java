package com.infohold.cms.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class testJSON {

	
	public static void main(String[] args) {
		String str="{"+
				"    'error': 0,"+
				"    'status': 'success',"+
				"    'date': '2014-05-10',"+
				"    'results': ["+
				"        {"+
				"            'currentCity': '南京',"+
				"            'weather_data': ["+
				"                {"+
				"                    'date': '周六(今天, 实时：19℃)',"+
				"                    'dayPictureUrl': 'http://api.map.baidu.com/images/weather/day/dayu.png',"+
				"                    'nightPictureUrl': 'http://api.map.baidu.com/images/weather/night/dayu.png',"+
				"                    'weather': '大雨',"+
				"                    'wind': '东南风5-6级',"+
				"                    'temperature': '18℃'"+
				"                },"+
				"                {"+
				"                    'date': '周日',"+
				"                    'dayPictureUrl': 'http://api.map.baidu.com/images/weather/day/zhenyu.png',"+
				"                    'nightPictureUrl': 'http://api.map.baidu.com/images/weather/night/duoyun.png',"+
				"                    'weather': '阵雨转多云',"+
				"                    'wind': '西北风4-5级',"+
				"                    'temperature': '21 ~ 14℃'"+
				"                }"+
				"            ]"+
				"        }"+
				"    ]"+
				"}";
		 Map<String, Object> m=parseJSON2Map(str);
		 List<Map<String, Object>> list=(List) m.get("results");
		 String status=(String) m.get("status");
		 for(Map<String, Object> MM : list){
			 System.out.println(MM);
			 List<Map<String, Object>> listaa=(List) MM.get("weather_data");
			 for(Map<String, Object> MMm : listaa){
				 System.out.println(MMm);
			 }
		 }
		 Map<String, Object> ssm=parseJSON2Map(str);
		
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

}
