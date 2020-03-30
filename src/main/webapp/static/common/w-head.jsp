<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 引入所有得标签库 TagLib 并且设置上下文路径 --%>

<%-- 使用这种方式的注解可以避免IE 兼容性问题--%>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 放置contextPath作用，其他得页面可以直接用${cxt}拿到放置的contextPath，不需要再重复定义一个--%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%--引入标签库结束 --%>

<%--引入页面meta信息  开始 --%>

<title>建设银行管理系统</title>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<%--引入页面meta信息  结束 --%>


<%--引入页面css信息  开始 --%>
<link rel="stylesheet" href="${ctx}/static/layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${ctx}/static/layuiadmin/style/admin.css" media="all">

<style>
    a:hover{
        text-decoration: none;
    }
</style>
<%--引入页面css信息  开始 --%>
