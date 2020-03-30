<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%-- 引入所有得标签库 TagLib 并且设置上下文路径 --%>
<%-- 使用这种方式的注解可以避免IE 兼容性问题--%>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="cn">

<head>
	<meta charset="utf-8">
	<title>华脉科技门户网站管理系统</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="${ctx}/static/layuiadmin/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="${ctx}/static/css/login.css" />
	<link rel="Bookmark" href="${ctx}/favicon.ico" >
	<link rel="Shortcut Icon" href="${ctx}/favicon.ico" />
</head>

<body class="beg-login-bg">

<!-- <div style="margin-top: 30px;margin-left: 30px;">
   <img alt="" src="./static/images/logo.png" >
 </div> -->
<div class="beg-login-box">
	<header>
		<div style="line-height: 38px;"><img alt="" src="${ctx}/static/images/title.png" style="width: 80%;margin-left: 10%;"></div>
	</header>
	<div class="beg-login-main">
		<form action="dowlogin.do" class="layui-form" method="post" id="loginForm">
			<div class="layui-form-item">
				<label class="beg-login-icon"> <i class="layui-icon">&#xe612;</i>
				</label> <input type="text" name="userName" lay-verify="required"
								autocomplete="off" placeholder="这里输入登录名" class="layui-input" value="admin">
			</div>
			<div class="layui-form-item">
				<label class="beg-login-icon"> <i class="layui-icon">&#xe642;</i>
				</label> <input type="password" name="password" lay-verify="required"
								autocomplete="off" placeholder="这里输入密码" class="layui-input" value="123456">
			</div>
			<div class="layui-form-item">
				<div class="beg-pull-left beg-login-remember">
					<label>记住帐号？</label> <input type="checkbox" name="rememberMe"
												value="true" lay-skin="switch" checked title="记住帐号">
				</div>
				<div class="beg-pull-right">
					<button class="layui-btn layui-btn-primary" lay-submit
							lay-filter="dowlogin.do" style="background-color: #c8142d;color: white;">
						登录
					</button>
				</div>
				<div class="beg-clear"></div>
			</div>
			<c:if test="${sessionScope.errorMsg!='' && sessionScope.errorMsg!=null}">
				<div class="layui-form-item" style="color: red;">${sessionScope.errorMsg}
				</div>
			</c:if>
		</form>
	</div>
	<footer>
		<!-- <p>©华脉</p> -->
	</footer>
</div>
<script src="${ctx}/static/layuiadmin/layui/layui.js"></script>
<script>
	/* 禁止iframe引用 */
	if (top.location != self.location) {
		top.location = self.location;
	}
	layui.use([ 'layer', 'form' ], function() {
		var layer = layui.layer;
		$ = layui.jquery;
		var form = layui.form;

		form.on('submit(dowlogin.do)', function(data) {
			$('#loginForm').submit();
			return false;
		});
	});
</script>
</body>
</html>