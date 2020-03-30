<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="cn">
<head>
  <%@ include file="/static/common/head.jsp"%>
</head>
<body>
<div class="layui-fluid">
  <div class="layadmin-tips">
  	<c:if test="${returnCode=='1' }">
  		<i class="layui-icon" face>&#xe6af;</i>
	    <div class="layui-text">
	      <h2>
	      <span class="layui-anim layui-anim-loop layui-anim-">${returnMsg }</span>
	      </h2>
	    </div>
  	</c:if>
    <c:if test="${returnCode=='0' }">
  		<i class="layui-icon" face>&#xe69c;</i>
	    <div class="layui-text">
	      <h2>
	      <span class="layui-anim layui-anim-loop layui-anim-">${returnMsg }</span>
	      </h2>
	    </div>
  	</c:if>
  </div>
</div>
  <%@ include file="/static/common/footer.jsp"%>
  <script>
  layui.config({
    base: '${ctx}/static/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index']);
  </script>
</body>
</html>