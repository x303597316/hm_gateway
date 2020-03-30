<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/static/common/head.jsp"%>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card layui-form">
                <div class="layui-card-body">
                    <div class="test-table-reload-btn" style="margin-bottom: 10px;">
                        <div class="layui-inline">
                            <select class="layui-select" id="tree"  lay-filter="productlist" lay-search="">
                                <option value="">直接选择或输入搜索</option>
                                <c:forEach items="${productList }" var="itm">
                                    <option value="${itm.id }">${itm.productname }</option>
                                </c:forEach>
                            </select>
                        </div>
                        <!-- <button class="layui-btn" data-type="reload">搜索</button>
                        <button class="layui-btn layuiadmin-btn-useradmin" data-type="add">添加</button> -->
                    </div>
                    <table class="layui-hide" id="solution-table" lay-filter="solution-table"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/html" id="tools">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
</script>
<%@ include file="/static/common/footer.jsp"%>
<script type="text/javascript">
    layui.config({
        base: '${ctx}/static/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'table','form'], function(){
        var table = layui.table
            ,form = layui.form;
        //方法级渲染
        table.render({
            elem: '#solution-table'
            ,url: '${ctx}/solution/relation.do?solutionId=${solutionId}'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'relationid', title: 'ID', width:80}
                ,{field:'solutionname', title: '解决方案', width:200}
                ,{field:'productname', title: '产品名称', width:200}
                ,{align:'center', title: '操作',toolbar : '#tools'}
            ]]
            ,height: 'full-100'
        });

        form.render('select');
        form.on('select(productlist)', function(e){
            console.log(e.elem); //得到select原始DOM对象
            console.log(e.value); //得到被选中的值
            layer.confirm('确定将此产品作为该解决方案的关联产品吗？', function(index) {
                //执行 Ajax 后重载
                $.ajax({
                    type: "get",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "${ctx}/solution/relationAdd.do?solutionId=${solutionId}&productId="+e.value,//url
                    contentType : "application/json",
                    success: function (data) {
                        if (data.code == 0) {
                            layer.msg('添加成功', {icon: 6});
                            table.reload('solution-table');
                        }else{
                            layer.msg(data.msg, {icon: 5});
                        }
                    },
                    error : function() {
                        layer.msg('系统出错', {icon: 5});
                    }
                });
            });
        });

        table.on("tool(solution-table)", function(e) {
            e.data;
            if("del" == e.event) {
                layer.confirm('确定删除吗？', function(index) {
                    //执行 Ajax 后重载
                    $.ajax({
                        type: "POST",//方法类型
                        dataType: "json",//预期服务器返回的数据类型
                        url: "${ctx}/solution/relationDrop.do?id="+e.data.relationid,//url
                        contentType : "application/json",
                        success: function (data) {
                            if (data.code == 0) {
                                layer.msg('删除成功', {icon: 6});
                                e.del();
                            }else{
                                layer.msg(data.msg, {icon: 5});
                            }
                        },
                        error : function() {
                            layer.msg('系统出错', {icon: 5});
                        }
                    });
                });
            }
        });



    });
</script>
</body>
</html>