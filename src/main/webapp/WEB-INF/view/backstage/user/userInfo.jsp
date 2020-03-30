<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/static/common/head.jsp"%>

  </head>
  
  <body>
	 <div class="layui-fluid">
	    <div class="layui-row layui-col-space15">
	      <div class="layui-col-md12">
	        <div class="layui-card">
	          <div class="layui-card-header">设置我的资料</div>
	          <div class="layui-card-body" pad15>
	            <form action='${ctx}/user/updateUser.do' method='post' name='form'>
	            <div class="layui-form" lay-filter="http://www.baidu.com">
	            	<input type="hidden" name="id" value="${entity.id}">
	              <div class="layui-form-item">
	                <label class="layui-form-label">用户角色</label>
	                <div class="layui-input-inline">
	                  <input type="text" value="${entity.roleName }" readonly class="layui-input">
	                </div>
	                <div class="layui-form-mid layui-word-aux">当前角色不可更改为其它角色</div>
	              </div>
	              <div class="layui-form-item">
	                <label class="layui-form-label">用户名称</label>
	                <div class="layui-input-inline">
	                  <input type="text" value="${entity.userName }" readonly class="layui-input">
	                </div>
	                <div class="layui-form-mid layui-word-aux">不可修改。一般用于后台登入名</div>
	              </div>
	              <div class="layui-form-item">
	                <label class="layui-form-label">真实姓名</label>
	                <div class="layui-input-inline">
	                  <input type="text" name="realName" value="${entity.realName}" lay-verify="nickname" autocomplete="off" placeholder="请输入昵称" class="layui-input">
	                </div>
	              </div>
	              <div class="layui-form-item">
	                <label class="layui-form-label">性别</label>
	                <div class="layui-input-block">
				        <input type="radio" name="sex" value="1" title="男" 
				        <c:if test="${entity.sex == 1 || entity == null}">checked</c:if>>
				        <input type="radio" name="sex" value="2" title="女"
				        <c:if test="${entity.sex == 2 }">checked</c:if>>
				    </div>
	              </div>
	              <div class="layui-form-item">
	                <label class="layui-form-label">手机</label>
	                <div class="layui-input-inline">
	                  <input type="text" name="phone" value="${entity.phone }" lay-verify="phone" autocomplete="off" class="layui-input">
	                </div>
	              </div>
	              <div class="layui-form-item">
	                <label class="layui-form-label">邮箱</label>
	                <div class="layui-input-inline">
	                  <input type="text" name="email" value="${entity.email }" lay-verify="email" autocomplete="off" class="layui-input">
	                </div>
	              </div>
	              <div class="layui-form-item">
	                <div class="layui-input-block">
	                  <button class="layui-btn" lay-submit lay-filter="setmyinfo">确认修改</button>
	                  <button type="reset" class="layui-btn layui-btn-primary">重新填写</button>
	                </div>
	              </div>
	            </div>
	            
	          </div>
	          </form>
	        </div>
	      </div>
	    </div>
	  </div>
	  <%@ include file="/static/common/footer.jsp"%>
	  <script>
		  layui.config({
		    base: '${ctx}/static/layuiadmin/' //静态资源所在路径
		  }).extend({
		    index: 'lib/index' //主入口模块
		  }).use(['index',  'table'], function(){
		    var $ = layui.$
		    ,form = layui.form
		    ,table = layui.table;
		    
		   
		  });
	  </script>
  </body>
</html>
