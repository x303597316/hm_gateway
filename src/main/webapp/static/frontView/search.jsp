<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${ctx}/static/layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${ctx}/static/layuiadmin/style/admin.css" media="all">
<style>
    a:hover{
        text-decoration: none;
    }
    .layui-form-select dl
    {
    	left: 71px;
    	min-width: 72%;
    	max-height: 217px;
    }
    .layui-form-select .layui-edge
    {
    	right: 44px;
    	top: 22px;
    }
</style>
<script type="text/javascript" src="${ctx}/static/layuiadmin/layui/layui.js"></script>
</head>
<body>
<div class="layui-form">
<select class="layui-select" lay-filter="productList" lay-search id="productList" style="background: #f6f6f6;">
	<option value="">选择或输入搜索产品</option>
</select>
</div>
<script type="text/javascript">
layui.config({
    base: '${ctx}/static/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index','form'], function(){
	  var form = layui.form;
	  $.ajax({
			url:"${ctx}/proscenium/productList.do",
			type:"GET",
			dataType:"json",
			success:function(e){
				var list = e.data;    //返回的数据
				var role = document.getElementById("productList");        
				for(var i=0;i<list.length;i++){
					var option = document.createElement("option");    
					option.setAttribute("value",list[i].id);                  
					option.innerText=list[i].productname;             
					role.appendChild(option);                          
				}
			form.render("select");                                
			}
		});
	  form.on('select(productList)', function(data){
			window.location.href="${ctx}/proscenium/cpzx.do?id="+data.value;
			});
	  
  });
</script>

</body>
</html>