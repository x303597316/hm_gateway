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
	          <div class="layui-card-header">修改密码</div>
	          <div class="layui-card-body" pad15>
	            <form action='${ctx}/user/updatePassword.do' method='post' name='form'>
	            <div class="layui-form" lay-filter="">
	              <div class="layui-form-item">
	                <label class="layui-form-label">当前密码</label>
	                <div class="layui-input-inline">
	                  <input type="password" name="oldPassword" AUTOCOMPLETE="off" lay-verify="required" lay-verType="tips" class="layui-input">
	                </div>
	              </div>
	              <div class="layui-form-item">
	                <label class="layui-form-label">新密码</label>
	                <div class="layui-input-inline">
	                  <input type="password" name="newPassword" AUTOCOMPLETE="off" lay-verify="pass" lay-verType="tips" autocomplete="off" id="LAY_password" class="layui-input">
	                </div>
	                <div class="layui-form-mid layui-word-aux" ><span style="color:red">6到12个字母和数字的组合</span></div>
	              </div>
	              <div class="layui-form-item">
	                <label class="layui-form-label">确认新密码</label>
	                <div class="layui-input-inline">
	                  <input type="password" name="repassword" AUTOCOMPLETE="off" lay-verify="repass" lay-verType="tips" autocomplete="off" class="layui-input">
	                </div>
	              </div>
	              <div class="layui-form-item">
	                <div class="layui-input-block">
	                  <button class="layui-btn" lay-submit lay-filter="setmypass">确认修改</button>
	                </div>
	              </div>
	            </div>
	            </form>
	          </div>
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
		  }).use(['index',  'set'], function(){
		    
		    
		  });
	  </script>
  </body>
</html>
