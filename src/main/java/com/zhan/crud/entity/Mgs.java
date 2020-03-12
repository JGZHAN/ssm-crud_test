package com.zhan.crud.entity;

import java.util.HashMap;
import java.util.Map;

public class Mgs {
//	code状态码，100为请求成功，200为请求失败
	private int code;
//	提示信息
	private String message;
//	返回给浏览器的数据
	private Map<String, Object> map=new HashMap<String, Object>();
	
	public Mgs add(String key,Object value) {
		this.getMap().put(key, value);
		return this;
		
	}
	public static Mgs sussess() {
		Mgs mgs=new Mgs();
		mgs.setCode(100);
		mgs.setMessage("处理成功");
		return mgs;
	}
	public static Mgs fail() {
		Mgs mgs=new Mgs();
		mgs.setCode(200);
		mgs.setMessage("处理失败");
		return mgs;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	
	
	
	
}
