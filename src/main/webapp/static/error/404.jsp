<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
 <%@ include file="/static/common/head.jsp"%>
<body>


<div class="layui-fluid">
  <div class="layadmin-tips">
    <i class="layui-icon" face>&#xe664;</i>
    <div class="layui-text">
      <h1>
        <span class="layui-anim layui-anim-loop layui-anim-">4</span> 
        <span class="layui-anim layui-anim-loop layui-anim-rotate">0</span> 
        <span class="layui-anim layui-anim-loop layui-anim-">4</span>
      </h1>
      <h2>
      <span class="layui-anim layui-anim-loop layui-anim-">页面找不到了</span>
      </h2>
    </div>
  </div>
</div>

  <%@ include file="/static/common/footer.jsp"%>
  <script>
  layui.config({
    base: '${basePath}/static/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index']);
  </script>
</body>
</html>