<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 引入所有得标签库 TagLib 并且设置上下文路径 --%>
<%-- 使用这种方式的注解可以避免IE 兼容性问题--%>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 放置contextPath作用，其他得页面可以直接用${cxt}拿到放置的contextPath，不需要再重复定义一个--%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="cn">
  <head>
  <meta charset="utf-8">
  <title>欢迎使用华脉科技门户网站管理系统</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="${ctx}/static/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="${ctx}/static/layuiadmin/style/admin.css" media="all">
  <link rel="Bookmark" href="./favicon.ico" >
  <link rel="Shortcut Icon" href="./favicon.ico" />
  </head>
  
  <body>
	  <div id="LAY_app">
	    <div class="layui-layout layui-layout-admin">
	      <div class="layui-header">
	        <!-- 头部区域 -->
	        <ul class="layui-nav layui-layout-left">
	          <li class="layui-nav-item layadmin-flexible" lay-unselect>
	            <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
	              <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
	            </a>
	          </li>
	          <li class="layui-nav-item" lay-unselect>
	            <a href="javascript:;" layadmin-event="refresh" title="刷新">
	              <i class="layui-icon layui-icon-refresh-3"></i>
	            </a>
	          </li>
	        </ul>
	        <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
	          
	          <li class="layui-nav-item" lay-unselect>
	            <a lay-href="app/message/index.html" layadmin-event="message" lay-text="消息中心">
	              <i class="layui-icon layui-icon-notice"></i>  
	              
	              <!-- 如果有新消息，则显示小圆点 -->
	              <span class="layui-badge-dot"></span>
	            </a>
	          </li>
	          <li class="layui-nav-item layui-hide-xs" lay-unselect>
	            <a href="javascript:;" layadmin-event="theme">
	              <i class="layui-icon layui-icon-theme"></i>
	            </a>
	          </li>
	          <li class="layui-nav-item layui-hide-xs" lay-unselect>
	            <a href="javascript:;" layadmin-event="note">
	              <i class="layui-icon layui-icon-note"></i>
	            </a>
	          </li>
	          <li class="layui-nav-item layui-hide-xs" lay-unselect>
	            <a href="javascript:;" layadmin-event="fullscreen">
	              <i class="layui-icon layui-icon-screen-full"></i>
	            </a>
	          </li>
	          <li class="layui-nav-item" lay-unselect>
	            <a href="javascript:;">
	              <cite>${sessionScope.User.userName}&nbsp;&nbsp;&nbsp;&nbsp;</cite>
	            </a>
	            <dl class="layui-nav-child">
	              <dd><a lay-href="user/userInfo.do">基本资料</a></dd>
	              <dd><a lay-href="user/userPassword.do">修改密码</a></dd>
	              <hr>
	              <dd layadmin-event="logout" style="text-align: center;"><a>退出</a></dd>
	            </dl>
	          </li>
	          
	          <li class="layui-nav-item layui-hide-xs" lay-unselect>
	            <a href="javascript:;" layadmin-event="about"><i class="layui-icon layui-icon-more-vertical"></i></a>
	          </li>
	          
	        </ul>
	      </div>
	      
	      <!-- 侧边菜单 -->
	      <div class="layui-side layui-side-menu">
	        <div class="layui-side-scroll">
	        
	          <div class="layui-logo" lay-href="">
	            <span>华脉科技门户网站</span>
	          </div>
	          
	          <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
	            
	            <c:forEach var="item" items="${menuList}" >
		            <li data-name="app" class="layui-nav-item">
		            	<a href="javascript:;" lay-tips="${item.name}" lay-direction="2">
			                <i class="layui-icon ${item.icon}"></i>
			                <cite>${item.name}</cite>
		              	</a>
		              	<c:if test="${item.childTreeNodeS!=null}">
		              	<dl class="layui-nav-child">
		              		<c:forEach var="i" items="${item.childTreeNodeS}" >
			              		<dd data-name="${i.name}">
			              			<c:if test="${i.childTreeNodeS==null}">
			              				<c:if test="${i.url==null||i.url==''}">
				                  		<a lay-href="${ctx}/static/error/404.jsp?title=${i.name}">${i.name}</a>
				                  		</c:if>
				                  		<c:if test="${i.url!=null&&i.url!=''}">
				                  		<a lay-href="${ctx}${i.url}">${i.name}</a>
				                  		</c:if>
				                  	</c:if>
				                  	<c:if test="${i.childTreeNodeS!=null}">
				                  		<a href="javascript:;">${i.name}</a>
				                  		<dl class="layui-nav-child">
				                  			<c:forEach var="y" items="${i.childTreeNodeS}" >
				                  				<c:if test="${y.url==null||y.url==''}">
						                  		<a lay-href="${ctx}/static/error/404.jsp?title=${y.name}">${y.name}</a>
						                  		</c:if>
						                  		<c:if test="${y.url!=null&&y.url!=''}">
						                  		<a lay-href="${ctx}${y.url}">${y.name}</a>
						                  		</c:if>
				                  			</c:forEach>
				                  		</dl>
				                  	</c:if>
				                </dd>
		              		</c:forEach>
		              	</dl>
		              	</c:if>
		            </li>
	            </c:forEach>
	          </ul>
	        </div>
	      </div>
	
	      <!-- 页面标签 -->
	      <div class="layadmin-pagetabs" id="LAY_app_tabs">
	        <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
	        <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
	        <div class="layui-icon layadmin-tabs-control layui-icon-down">
	          <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
	            <li class="layui-nav-item" lay-unselect>
	              <a href="javascript:;"></a>
	              <dl class="layui-nav-child layui-anim-fadein">
	                <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
	                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
	                <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
	              </dl>
	            </li>
	          </ul>
	        </div>
	        <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
	          <ul class="layui-tab-title" id="LAY_app_tabsheader">
	            <li lay-id="" lay-attr="" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
	          </ul>
	        </div>
	      </div>
	      
	      
	      <!-- 主体内容 -->
	      <div class="layui-body" id="LAY_app_body">
	        <div class="layadmin-tabsbody-item layui-show">
	          <iframe src="" frameborder="0" class="layadmin-iframe"></iframe>
	        </div>
	      </div>
	      
	      <!-- 辅助元素，一般用于移动设备下遮罩 -->
	      <div class="layadmin-body-shade" layadmin-event="shade"></div>
	    </div>
	  </div>
	
	  <script src="${ctx}/static/layuiadmin/layui/layui.js"></script>
	  <script>
		  layui.config({
		    base: '${ctx}/static/layuiadmin/' //静态资源所在路径
		  }).extend({
		    index: 'lib/index' //主入口模块
		  }).use('index');
	  </script>
  </body>
</html>
