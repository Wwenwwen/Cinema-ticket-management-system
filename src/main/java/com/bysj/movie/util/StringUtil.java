package com.bysj.movie.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;


import com.alibaba.fastjson.JSONObject;
import com.bysj.movie.bean.CodeMsg;

/**
 * 项目通用工具类
 * @author Administrator
 *
 */
public class StringUtil {
	
	
	/**
	 * 返回指定格式的日期字符串
	 * @param date
	 * @param formatter
	 * @return
	 */
	public static String getFormatterDate(Date date,String formatter){
		SimpleDateFormat sdf = new SimpleDateFormat(formatter);
		return sdf.format(date);
	}
	
	/**
	 * 判断请求是否是ajax
	 * @param request
	 * @return
	 */
	public static boolean isAjax(HttpServletRequest request){
		String header = request.getHeader("X-Requested-With");
		if("XMLHttpRequest".equals(header))return true;
		return false;
	}
	
	/**
	 * 从流读取字符串
	 * @param inputStream
	 * @return
	 */
	public static String getStringFromInputStream(InputStream inputStream){
		String string = "";
		try {
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream,"GB2312"));
			String buf = null;
			try {
				while((buf = bufferedReader.readLine()) != null){
					string += buf;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
					bufferedReader.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return string;
	}
	
	/**
	 * 获取指定格式时间再指定分钟后的时间字符串
	 * @param date
	 * @param formatter
	 * @param minites
	 * @return
	 */
	public static String getFormatterDate(String date,String formatter,int minites){
		SimpleDateFormat sdf = new SimpleDateFormat(formatter);
		String ret = null;
		try {
			Date parse = sdf.parse(date);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(parse);
			calendar.add(Calendar.MINUTE, minites);
			ret = sdf.format(calendar.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
	
	/**
	 * 获取指定分钟前的时间
	 * @param date
	 * @param afterMinites
	 * @return
	 */
	public static Date getBeforeDate(Date date,int beforeMinites){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MINUTE, -beforeMinites);
		return calendar.getTime();
	}
	
	/**
	 * 获取制定天数前的日期
	 * @param date
	 * @param beforeDays
	 * @return
	 */
	public static Date getBeforeDaysDate(Date date,int beforeDays){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, -beforeDays);
		return calendar.getTime();
	}
	
	/**
	 * 生成唯一字符串
	 * @return
	 */
	public static String generateSn(){
		return UUID.randomUUID().toString().toUpperCase().replace("-", "");
	}
	
	public static String getMac(){
		String mac = "";
		try {
			InetAddress localHost = InetAddress.getLocalHost();
			byte[] hardwareAddress = NetworkInterface.getByInetAddress(localHost).getHardwareAddress();
			StringBuffer sb = new StringBuffer("");
			for(int i=0; i<hardwareAddress.length; i++) {
			    //字节转换为整数
			    int temp = hardwareAddress[i]&0xff;
			    String str = Integer.toHexString(temp);
			    //System.out.println("每8位:"+str);
			    if(str.length()==1) {
			      sb.append("0"+str);
			    }else {
			      sb.append(str);
			    }
			  }
			mac = sb.toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mac.toUpperCase();
	}
	

	
	public static String readFileToString(File file){
		String string = "";
		if(file != null){
			try {
				BufferedReader br = new BufferedReader(new FileReader(file));
			    String line = null;
			    while ((line = br.readLine()) != null) {
			    	string += line;
			    }
			    br.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return string;
	}
	

}
