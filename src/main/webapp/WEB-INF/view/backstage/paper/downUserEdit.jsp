<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/static/common/w-head.jsp"%>
</head>

<body>
<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 20px 0 0 ;">
    <input type="hidden" name="id" value="${entity.id}">


    <div class="layui-form-item">
        <label class="layui-form-label">用户姓名</label>
        <div class="layui-input-block">
            <input type="text" name="user_name" lay-verify="user_name" value="${entity.user_name}"
                   placeholder="请输入用户名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户密码</label>
        <div class="layui-input-block">
            <input type="text" name="password" lay-verify="password" value="${entity.password}" placeholder="请输入密码"
                   autocomplete="off" class="layui-input" >
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">手机号码</label>
        <div class="layui-input-block">
            <input type="text" name="phone" lay-verify="phone" value="${entity.phone}" placeholder="请输入号码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input type="text" name="email" lay-verify="email" value="${entity.email}" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-hide">
        <input type="button" lay-submit lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" value="确认">
    </div>
</div>
<%@ include file="/static/common/footer.jsp"%>
<script type="text/javascript">
    layui.config({
        base: '${ctx}/static/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form','set'], function(){
        var $ = layui.$
            ,form = layui.form;
    })
</script>
</body>
</html>
