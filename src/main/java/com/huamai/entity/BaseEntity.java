package com.huamai.entity;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

import javax.persistence.Id;


/**
 * 实体基类
 * 
 * @author zhaolong
 * 
 */
@SuppressWarnings("serial")
public abstract class BaseEntity implements Serializable {
	
	protected Integer id;
	
	@Id
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 实体打印
	 */
	@Override
	public String toString(){
		Field[] fields = this.getClass().getDeclaredFields();
		StringBuilder sb = new StringBuilder();
		sb.append('[');
		for(Field f : fields) {
			if(Modifier.isStatic(f.getModifiers()) || Modifier.isFinal(f.getModifiers())){
				continue;
			}
			Object value = null;
			try {
				f.setAccessible(true);
				value = f.get(this);
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
			if(value != null){
				sb.append(f.getName()).append('=').append(value).append(',');
			}
		}
		sb.append(']');
		return sb.toString();
	}
	
//	/**
//	 * 转化实体对象为JSON格式
//	 * 需要org.json包支持,可以在json官网下载源码,或自己实现json编码
//	 * @return
//	 */
//	public String toJSONString() {
//		String json=JsonUtil.toJson(this);
//		return json;
//	}
}
