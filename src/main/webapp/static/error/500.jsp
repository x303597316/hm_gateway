<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <%@ include file="/static/common/head.jsp"%>
</head>
<body>


<div class="layui-fluid">
  <div class="layadmin-tips">
    <i class="layui-icon" face>&#xe664;</i>
    
    <div class="layui-text" style="font-size: 20px;">
     	 好像出错了呢
    </div>
    
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