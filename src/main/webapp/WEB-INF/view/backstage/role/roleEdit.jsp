<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/common/w-head.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/static/plugins/ztree/zTreeStyle.css">
</head>

<body>
	<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 20px 0 20px ;">
	    <input type="hidden" name="id" value="${entity.id}">
	    <input type="hidden" id="mid" name="mid" value="">
	    <div class="layui-card" style="width:370px;height:340px;float:left">
		  <div class="layui-card-header layui-bg-gray" >角色信息</div>
		  <div class="layui-card-body">
			    <div class="layui-form-item">
			      <label class="layui-form-label">角色名称</label>
			      <div class="layui-input-block">
			        <input type="text" name="roleName" lay-verify="required" value="${entity.roleName}"
			        placeholder="请输入角色名称" autocomplete="off" class="layui-input">
			      </div>
			    </div>
				<div class="layui-form-item" lay-filter="status">
			      <label class="layui-form-label">角色状态</label>
			      <div class="layui-input-block">
			        <input type="radio" name="status" value="1" title="启用" 
			        <c:if test="${entity.status == 1 || entity == null}">checked</c:if>>
			        <input type="radio" name="status" value="2" title="停用"
			        <c:if test="${entity.status == 2 }">checked</c:if>>
			      </div>
			    </div>
			    <div class="layui-form-item">
			      <label class="layui-form-label">角色描述</label>
			      <div class="layui-input-block">
				    <textarea name="description" placeholder="请输角色描述"   class="layui-textarea">${entity.description}</textarea>
				  </div>
			    </div>
	    	</div>
	    </div>
	    
	    <div class="layui-card" style="width:370px;height:340px;float:right">
		  <div class="layui-card-header layui-bg-gray">权限信息</div>
		  <div class="layui-card-body">
		  	<!-- ztree加载树 -->
		  	<ul id="tree" class="ztree"></ul>
		  </div>
		</div>
	    
	    <div class="layui-form-item layui-hide">
	      <input type="button" lay-submit lay-filter="LAY-user-role-submit" id="LAY-user-role-submit" value="确认">
	    </div>
  </div>
	<%@ include file="/static/common/footer.jsp"%>
	<script type="text/javascript">
		layui.config({
		    base: '${ctx}/static/layuiadmin/' //静态资源所在路径
		  }).extend({
		    index: 'lib/index' //主入口模块
		  }).use(['index', 'form'], function(){
		    var $ = layui.$,
		    form = layui.form;
		  });
		  
	</script>
	<script src="${ctx}/static/js/jquery.js"></script>
	<script src="${ctx}/static/plugins/ztree/jquery.ztree.all-3.5.min.js"></script>
	<script type="text/javascript">
		var setting = {
	        view: {
	            dblClickExpand: false,
	            showLine: false,
	            selectedMulti: false
	        },
	        check: {
	            enable: true,
	            chkStyle: "checkbox",
	            chkboxType: { "Y": "ps", "N": "s" }
	        },
	        data: {
	            simpleData: {
	                enable:true,
	                idKey: "id",
	                pIdKey: "pId",
	                rootPId: ""
	            }
	        },
	        callback: {
	            onCheck: function(treeId, treeNode){
	            	var nodes = zTree.getCheckedNodes(true);
		            var mid="";
					for(var i=0;i<nodes.length;i++){
						if(i==0){
							mid=nodes[i].id;
						}else{
							mid+=','+nodes[i].id;
						}
					}
					$("#mid").val(mid);
	            },
	            onClick: function(){
	            	return false;
	            }
	        }
	    };
	    var zNodes=1;
	    var zTree = $("#tree");
	    $(function(){
	        $.post("${ctx}/menu/getMenuTree.do?rid=${entity.id}", function(data) {
	            zNodes=JSON.parse(data);
	            var mid="";
				for(var i=0;i<zNodes.length;i++){
					if(zNodes[i].checked==true){
						if(i==0){
							mid=zNodes[i].id;
						}else{
							mid+=','+zNodes[i].id;
						}
					}
				}
				$("#mid").val(mid);
	            zTree = $.fn.zTree.init(zTree, setting, zNodes);
	        });
	
	    });
	</script>
</body>
</html>
