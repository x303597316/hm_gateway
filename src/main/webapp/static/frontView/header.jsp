<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 使用这种方式的注解可以避免IE 兼容性问题--%>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 放置contextPath作用，其他得页面可以直接用${cxt}拿到放置的contextPath，不需要再重复定义一个--%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>华脉科技</title>
<link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/nav.css">
<script type="text/javascript" src="${ctx}/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js"></script>
<style>
	.navbar
	{
		margin-bottom:0px;	
	}
</style>
