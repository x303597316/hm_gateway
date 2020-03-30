<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/common/w-head.jsp"%>
</head>

<body>
	<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 20px 0 0 ;">
	    <input type="hidden" name="id" value="${entity.id}">
	    <input type="hidden" name="parentId" value="${entity.parentId}">
	    <div class="layui-form-item">
	      <label class="layui-form-label">父级菜单</label>
	      <div class="layui-input-block">
	        <input type="text" name=""  readonly="readonly" value="${pname}"
	        placeholder="" autocomplete="off" class="layui-input">
	      </div>
	    </div>
	    <div class="layui-form-item">
	      <label class="layui-form-label">菜单名称</label>
	      <div class="layui-input-block">
	        <input type="text" name="menuName" lay-verify="required" value="${entity.menuName}"
	        placeholder="请输入菜单名称" autocomplete="off" class="layui-input">
	      </div>
	    </div>
	    <div class="layui-form-item">
			<label class="layui-form-label">菜单路径</label>
			<div class="layui-input-block">
				<input type="text" name="urlPath" value="${entity.urlPath}" placeholder="请输入菜单路径"
					autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">菜单图标</label>
			<div class="layui-input-block">
				<input type="text" name="icon" value="${entity.icon}" placeholder="请输入菜单图标,例如:layui-icon-set-fill"
					autocomplete="off" class="layui-input" >
			</div>
		</div>
		<div class="layui-form-item" lay-filter="status">
	      <label class="layui-form-label">菜单状态</label>
	      <div class="layui-input-block">
	        <input type="radio" name="status" value="1" title="启用" 
	        <c:if test="${entity.status == 1 || entity.status == null || entity==null}">checked</c:if>>
	        <input type="radio" name="status" value="2" title="停用"
	        <c:if test="${entity.status == 2 }">checked</c:if>>
	      </div>
	    </div>
	    <div class="layui-form-item layui-hide">
	      <input type="button" lay-submit lay-filter="LAY-menu-submit" id="LAY-menu-submit" value="确认">
	    </div>
  </div>
	<%@ include file="/static/common/footer.jsp"%>
	<script type="text/javascript">
		layui.config({
		    base: '${ctx}/static/layuiadmin/' //静态资源所在路径
		  }).extend({
		    index: 'lib/index' //主入口模块
		  }).use(['index', 'form'], function(){
		    var $ = layui.$
		    ,form = layui.form;
		  })
	</script>
</body>
</html>
