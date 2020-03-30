<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="${ctx}/static/layuiadmin/layui/layui.js"></script>

<script type="text/javascript" src="${ctx}/static/js/jquery.js"></script>


<%--表单验证--%>



<script>
	/* 设置ajax请求不写入缓存 */
	/* $.ajaxSetup({
		cache : false,
        complete:function(XMLHttpRequest,textStatus){
            if(textStatus=="parsererror"){
                layer.msg("登陆超时，请重新登录！",{icon:5},function(){
                    window.location.href = 'login.jsp';
                });
            } else if(textStatus=="error"){
                layer.msg("请求错误，请稍后再试！",{icon:5});
            }
        }
    }); */
</script>