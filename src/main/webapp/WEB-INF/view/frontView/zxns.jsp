<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 使用这种方式的注解可以避免IE 兼容性问题--%>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 放置contextPath作用，其他得页面可以直接用${cxt}拿到放置的contextPath，不需要再重复定义一个--%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<!--  CSS -->
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/details.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/all.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/paging.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${ctx}/static/css/zjhm.css">
<style type="text/css">
	.shuur {
	    margin-bottom: 15px;
	    clear: both;
	    padding-left: 32%;
	}
	.layui-form-label {
	    float: left;
	    display: block;
	    padding: 9px 15px;
	    width:120px;
	    font-weight: 400;
	    line-height: 20px;
	    text-align: right;
	}
	.layui-input, .layui-textarea {
		border:none;
	    display: block;
	    width: 71%;
	    padding-left: 10px;
	}
	.title{
	    text-align: center;
	    font-size: 24px;
	    margin-bottom: 22px;
	}
	.navbar{
		height:300px;
		background:url('${ctx}/static/images/zjhmban.jpg') no-repeat;
		background-size:100%;
	}
	th{
		min-width:100px;
		font-size:16px;
	}
	td{
		text-align:center;
		font-size:14px;
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
<%@ include file="/static/frontView/header.jsp"%>
</head>
<body>
	
	<div class="banner">
		<div class="container banner1 col-md-12 col-sm-12 col-xs-12">
			<div class="navbar-header pull-left">
				<a class="navbar-brand" href="${ctx}/proscenium/index.do">
					<img src="${ctx}/static/images/logo.png" alt="华脉科技" class="logo" style="height: 35px;">
				</a>
			</div>
			<div class="nav-search pull-right">
                    <span>ENGLISH</span>
                    <div class="sea">
                        <div class="layui-form">
							<select class="layui-select" lay-filter="productList" lay-search id="productList">
								<option value="">选择或输入搜索产品</option>
							</select>
						</div>
                    </div>
            </div>
        </div>
        <div class="container">
	        <div class="row">
		        <div>
		            <%@ include file="/static/frontView/navigation.jsp"%>
		        </div>
	        </div>
        </div>
	</div>
	<div class="content">
		
		<div class="content_nav">
			<div class="content_nav_left" style="width: 230px;">
			<p class="content_top">
			<i class="home" style=" margin-top: 2px;margin-right: 8px;margin-left: 10px;"></i> <span style="font-size: 20px;">招贤纳士</span> </i>
				<%--<i class="rig">--%>
			</p>
				<div class="zhaop">
					<div class="nav_left_text" style="margin-top: 47px;">
						<p class="nav_left_texts">
							<span class="jiaorjian"></span><a onclick="shehui(1);"><span style="font-size: 18px;margin-left: 42px;color: black; ">社会招聘</span></a>
						</p>

						<p class="nav_left_texts">
							<span class="jiaorjian"></span><a onclick="school(1);"><span style="font-size: 18px;margin-left: 42px;color: black;">校区招聘</span></a>
						</p>
					</div>
					<%--<div class="nav_left_text">

					</div>--%>
				</div>
			</div>
			<div class="content_nav_right" id="shehui" style = "display: block;" >
				<div class="table-responsive">
					<table class="table table-bordered" style="margin-left: 35px;">
						<thead>
							<tr>
								<th>招聘职位</th>
								<th>招聘部门</th>
								<th>招聘人数</th>
								<th>工作地点</th>
								<th>工作待遇</th>
								<th>发布时间</th>
							</tr>
						</thead>
						<span id="min" style="font-size: 18px;padding-left: 48%;"></span>
						<tbody id="zhaopin">
						
						</tbody>
					</table>
				</div>
			</div>
			<div class="content_nav_right" id="school" style = "display: block;">
				<div class="table-responsive">
					<table class="table table-bordered" style="margin-left: 35px;">
						<thead>
							<tr>
								<th>招聘职位</th>
								<th>招聘部门</th>
								<th>招聘人数</th>
								<th>工作地点</th>
								<th>工作待遇</th>
								<th>发布时间</th>
							</tr>
						</thead>
						<span id="min2" style="font-size: 18px;padding-left: 48%;"></span>
						<tbody id="zhaopin2">
						
						</tbody>
					</table>
				</div>
			</div>
			<div class="content_nav_right" id="detail" style = "display: none;" >
				<div id="title" class="title"></div>
				<div class="layui-form-item">
					<label class="layui-form-label">招聘职位</label>
					<div class="layui-input-block">
						<input type="text" name="title" lay-verify="title" id="job" autocomplete="off"  class="layui-input" disabled="disabled">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">招聘部门</label>
					<div class="layui-input-block">
						<input type="text" name="username" id="department" lay-verify="required"  autocomplete="off" class="layui-input" disabled="disabled">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">招聘人数</label>
					<div class="layui-input-block">
						<input type="text" name="username" id="number" lay-verify="required"  autocomplete="off" class="layui-input" disabled="disabled">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">工作待遇</label>
					<div class="layui-input-block">
						<input type="text" name="username" id="workReatment" lay-verify="required"  autocomplete="off" class="layui-input" disabled="disabled">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">工作地址</label>
					<div class="layui-input-block">
						<input type="text" name="username" id="address" lay-verify="required"  autocomplete="off" class="layui-input" disabled="disabled">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">发布时间</label>
					<div class="layui-input-block">
						<input type="text" name="username" id="createTime" lay-verify="required"  autocomplete="off" class="layui-input" disabled="disabled">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">有效期限</label>
					<div class="layui-input-block">
						<input type="text" name="username" id="validityTime" lay-verify="required"  autocomplete="off" class="layui-input" disabled="disabled">
					</div>
				</div>
				<div class="layui-form-item">
		          <label class="layui-form-label">招聘要求</label>
		            <div class="layui-input-block" style="    margin-left: 119px;" id="requirement">
		          		 
		          	</div>
		        </div> 
			</div>
		</div>
	</div>
	<!-- js -->
	<script type="text/javascript" src="${ctx}/static/js/details.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/paging.js"></script>
	<script type="text/javascript" src="${ctx}/static/layuiadmin/layui/layui.js"></script>
	<script>
		var current_page = $("input[name='current_page']").val();
		var total_page = $("input[name='total_page']").val();
		var a = parseInt(current_page);
		var b = parseInt(total_page);
		//分页
		$("#page").paging({
			pageNo : a,
			totalPage : b,
			// totalSize: 300,
			callback : function(num) {
				// alert(num)
			}
		})
		var page = 1;
		var limit = 10;
		var info = '${info}';
		layui.config({
			base : '${ctx}/static/layuiadmin/'
		}).extend({
			index : 'lib/index'
		}).use([ 'index', 'table' ], function() {
			var table = layui.table;
			var $ = layui.$;
			var layer = layui.layer;
			
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
			
			
			
			$(document).off('click.bs.dropdown.data-api');
			if(info == 0){
				shehui(0);
				school(0);
			}else if(info == 1){
				school(page);
			}else if(info == 2){
				shehui(page);
			}
		});
		function shehui(page){
			if(page != 0){
				document.getElementById("school").style.display = 'none';
				document.getElementById("shehui").style.display = 'block';
				document.getElementById("detail").style.display = 'none';
			}else{
				page = 1;
			}
			$.ajax({
				url:"${ctx}/frontview/mobile/recruitList.do",
				type:"POST",
				data:{
					"type":1,
					"page":page,
					"limit":limit
				},
				success:function(data){
					var resultPage = JSON.parse(data);
					var list = resultPage.data;
					var html = "";
					for(var i = 0;i<list.length;i++){
						var recruit = list[i];
						html += "<tr>";
						html += " <td><a onclick=toDetail('"+recruit.id+"'); title='"+recruit.job+"'>"+recruit.job+"</a></td>";
						if(recruit.department != null && recruit.department != ""){
							html += " <td>"+recruit.department+"</td>";
						}else{
							html += " <td></td>";
						}
						if(recruit.number != null && recruit.number != ""){
							html += " <td>"+recruit.number+"</td>";
						}else{
							html += " <td>若干</td>";
						}
						html += " <td>"+recruit.address+" "+"联系人:"+recruit.contacts+" "+"联系方式:"+recruit.mobile+"</td>";
						if(recruit.workreatment != null && recruit.workreatment != ""){
							html += " <td>"+recruit.workreatment+"</td>";
						}else{
							html += " <td>面议</td>";
						}
						html += " <td>"+(recruit.createTime).substr(0,10)+"</td>";
						html += "</tr>";
					}
					$("#zhaopin").html(html);
					$("#min").html("社会招聘");
				}
			})
		}
		function school(page){
			if(page != 0){
				document.getElementById("shehui").style.display = 'none';
				document.getElementById("school").style.display = 'block';
				document.getElementById("detail").style.display = 'none';
			}else{
				page = 1; 
			}
			$.ajax({
				url:"${ctx}/frontview/mobile/recruitList.do",
				type:"POST",
				data:{
					"type":0,
					"page":page,
					"limit":limit
				},
				success:function(data){
					var resultPage = JSON.parse(data);
					var list = resultPage.data;
					var html = "";
					for(var i = 0;i<list.length;i++){
						var recruit = list[i];
						html += "<tr>";
						html += " <td><a onclick=toDetail('"+recruit.id+"'); title='"+recruit.job+"'>"+recruit.job+"</a></td>";
						if(recruit.department != null && recruit.department != ""){
							html += " <td>"+recruit.department+"</td>";
						}else{
							html += " <td></td>";
						}
						if(recruit.number != null && recruit.number != ""){
							html += " <td>"+recruit.number+"</td>";
						}else{
							html += " <td>若干</td>";
						}
						html += " <td>"+recruit.address+" "+"联系人:"+recruit.contacts+" "+"联系方式:"+recruit.mobile+"</td>";
						if(recruit.workreatment != null && recruit.workreatment != ""){
							html += " <td>"+recruit.workreatment+"</td>";
						}else{
							html += " <td>面议</td>";
						}
						html += " <td>"+(recruit.createTime).substr(0,10)+"</td>";
						html += "</tr>";
					}
					$("#zhaopin2").html(html);
					$("#min2").html("校区招聘");
				}
			})
		}
		function toDetail(id){
			document.getElementById("school").style.display = 'none';
			document.getElementById("shehui").style.display = 'none';
			document.getElementById("detail").style.display = 'block';
			$.ajax({
				url:"${ctx}/frontview/mobile/recruitDetail.do",
				type:"POST",
				data:{
					"id":id
				},
				success:function(data){
					var data = JSON.parse(data);
					if(data.code == 0){
						var recruit = data.recruit;
						$("#job").val(recruit.job);
						$("#title").html(recruit.job);
						if(null != recruit.department && "" != recruit.department){
							$("#department").val(recruit.department);
						}else{
							$("#number").val("");
						}
						if(null != recruit.number && "" != recruit.number){
							$("#number").val(recruit.number);
						}else{
							$("#number").val("若干");
						}
						if(null != recruit.workreatment && "" != recruit.workreatment){
							$("#workReatment").val(recruit.workreatment);
						}else{
							$("#workReatment").val("面议");
						}
						$("#address").val(recruit.address+"  "+"联系人:"+recruit.contacts+"  "+"联系方式:"+recruit.mobile);
						$("#createTime").val((recruit.createTime).substr(0,10));
						$("#validityTime").val(recruit.validitytime);
						$("#requirement").html(recruit.requirement);
					}else{
						alert(data.msg);
					}
				}
			});
		}
	</script>
	<%@ include file="/static/frontView/footer.jsp"%> 
</body>
</html>