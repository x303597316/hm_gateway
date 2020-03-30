package com.huamai.util;

import static org.apache.ibatis.jdbc.SqlBuilder.BEGIN;
import static org.apache.ibatis.jdbc.SqlBuilder.DELETE_FROM;
import static org.apache.ibatis.jdbc.SqlBuilder.FROM;
import static org.apache.ibatis.jdbc.SqlBuilder.INSERT_INTO;
import static org.apache.ibatis.jdbc.SqlBuilder.SELECT;
import static org.apache.ibatis.jdbc.SqlBuilder.SET;
import static org.apache.ibatis.jdbc.SqlBuilder.SQL;
import static org.apache.ibatis.jdbc.SqlBuilder.UPDATE;
import static org.apache.ibatis.jdbc.SqlBuilder.VALUES;
import static org.apache.ibatis.jdbc.SqlBuilder.WHERE;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.jdbc.SelectBuilder;

import com.huamai.entity.BaseEntity;




/**
 * 主要的sql生成类
 * @author zhaolong
 *
 */
@SuppressWarnings("deprecation")
public class CRUDTemplate<T extends BaseEntity>{
	
	/**
	 * 插入模板
	 * @param t 实体对象
	 * @return SQL语句
	 * @throws Exception
	 */
	public String insert(T t) throws Exception {
		BEGIN();
		INSERT_INTO(EntityUtil.tablename(t));
		EntityUtil.caculationColumnList(t);
		VALUES(EntityUtil.returnInsertColumnsName(t), EntityUtil.returnInsertColumnsDefine(t));
		return SQL();
	}
	
	/**
	 * 插入模板(无主键生成策略)
	 * @param t 实体对象
	 * @return SQL语句
	 * @throws Exception
	 */
	public String insertNoPrimaryKey(T t) throws Exception {
		BEGIN();
		INSERT_INTO(EntityUtil.tablename(t));
		EntityUtil.caculationColumnList(t);
		VALUES(EntityUtil.returnInsertColumnsName(t), EntityUtil.returnInsertColumnsDefine(t,false));
		return SQL();
	}
	
	/**
	 * 删除模板
	 * @param t 实体对象
	 * @return SQL语句
	 * @throws Exception
	 */
	public String delete(T t) throws Exception {
		String idname = EntityUtil.id(t);
		BEGIN();
		DELETE_FROM(EntityUtil.tablename(t));
		WHERE(idname + "=#{" + idname + "}");
		return SQL();
	}
	
	/**
	 * 更新模板
	 * @param t 实体对象
	 * @return SQL语句
	 * @throws Exception
	 */
	public String update(T t) throws Exception {
		String idname = EntityUtil.id(t);
		BEGIN();
		UPDATE(EntityUtil.tablename(t));
		EntityUtil.caculationColumnList(t);
		SET(EntityUtil.returnWhereDefine(t));
		WHERE(idname + "=#{" + idname + "}");
		return SQL();
	}
	
	/**
	 * 根据ID查询实体对象
	 * @param t 实体对象
	 * @return SQL语句
	 * @throws Exception
	 */
	public String selectById(T t) throws Exception {
		EntityUtil.caculationColumnList(t);
		String idname = EntityUtil.id(t);
		BEGIN();
		SELECT("*");
		FROM(EntityUtil.tablename(t));
		WHERE(idname + "=#{" + idname + "}");
		return SQL();
	}
	

	/**
	 * 查询所有模板
	 */
	public String findAll(T t) throws Exception {
		EntityUtil.caculationColumnList(t);
		BEGIN();
		//SelectBuilder.SELECT(EntityUtil.returnSelectColumnsName(t));
		SELECT("*");
		FROM(EntityUtil.tablename(t));
		return SQL();
	}
	
	public String findBy(Object obj) throws Exception {
		Map map = (Map)obj;
		Object entity = map.get("0");
		EntityUtil.caculationColumnList(entity);
		BEGIN(); // Clears ThreadLocal variable
		SelectBuilder.SELECT(EntityUtil.returnSelectColumnsName(entity));
		SelectBuilder.FROM(EntityUtil.tablename(entity));
		
		List<SearchFilter> searchFilterList = (List<SearchFilter>)map.get("1");
		String paramString = EntityUtil.returnWhereDefine(entity, searchFilterList);
		if (StringUtils.isNotBlank(paramString)) {
			SelectBuilder.WHERE(paramString);
		}
		String sql = SelectBuilder.SQL();
		
		Object start = map.get("2");
		Object pageSize = map.get("3");
		if (start != null && pageSize != null && !start.equals(0) && !pageSize.equals(0)) {
			int startInt = (Integer)start;
			int pageSizeInt = (Integer)pageSize;
			sql += " limit " +(startInt-1)*pageSizeInt + "," + pageSizeInt;
		}
		return sql;
	}
	
	public String count(Object obj) throws Exception {
		Map map = (Map)obj;
		Object entity = map.get("0");
		EntityUtil.caculationColumnList(entity);
		SelectBuilder.BEGIN(); // Clears ThreadLocal variable

		String idname = EntityUtil.id(entity);
		
		SelectBuilder.SELECT("count(" + idname + ")");
		SelectBuilder.FROM(EntityUtil.tablename(entity));
		
		List<SearchFilter> searchFilterList = (List<SearchFilter>)map.get("1");
		String paramString = EntityUtil.returnWhereDefine(entity, searchFilterList);
		if (StringUtils.isNotBlank(paramString)) {
			WHERE(paramString);
		}
		return SelectBuilder.SQL();
	}
	
	public String get(Object obj) throws Exception {
		EntityUtil.caculationColumnList(obj);
		String idname = EntityUtil.id(obj);
		SelectBuilder.BEGIN();
		SelectBuilder.SELECT(EntityUtil.returnSelectColumnsName(obj));
		SelectBuilder.FROM(EntityUtil.tablename(obj));
		SelectBuilder.WHERE(idname + "=#{" + idname + "}");
		return SelectBuilder.SQL();
	}
	
//	public String findAll(Object obj) throws Exception {
//		EntityUtil.caculationColumnList(obj);
//		SelectBuilder.BEGIN();
//		SelectBuilder.SELECT(EntityUtil.returnSelectColumnsName(obj));
//		SelectBuilder.FROM(EntityUtil.tablename(obj));
//		String paramString = EntityUtil.returnWhereDefine(obj);
//		if (StringUtils.isNotBlank(paramString)) {
//			SelectBuilder.WHERE(paramString);
//		}
//		return SelectBuilder.SQL();
//	}
	
}

