<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/static/common/head.jsp"%>
</head>


<div class="layui-card layadmin-header">
    <div class="layui-breadcrumb" lay-filter="breadcrumb">
        <a lay-href="">主页</a>
        <a><cite>组件</cite></a>
        <a><cite>数据表格</cite></a>
        <a><cite>数据表格的重载</cite></a>
    </div>
</div>
<p>欢迎用户：${sessionScope.DowUser.userName}  登入下载文档！！</p>
<input type="hidden" id="userName" value="${sessionScope.DowUser.userName}"/>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card layui-form">
                <div class="layui-card-body">
                    <div class="test-table-reload-btn" style="margin-bottom: 10px;">
                        <div class="layui-form-item" style="margin: 0;">

                            <label class="layui-form-label">资料名称：</label>
                            <div class="layui-input-inline" >

                                <input class="layui-input" name="paperName" id="paperName" type="text" placeholder="请输入标题" />
                            </div>

                            <button class="layui-btn" data-type="search">搜索</button>
                           <%-- <button class="layui-btn layuiadmin-btn-useradmin" data-type="add">添加</button>--%>
                        </div>
                    </div>
                    <table class="layui-hide" id="test-table-reload" lay-filter="test-table-reload"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/html" id="tools">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="dowload"><i class="layui-icon layui-icon-edit"></i>下载文件</a>
   <%-- <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>--%>
</script>
<%@ include file="/static/common/footer.jsp"%>
<script>
    layui.config({
        base: '${ctx}/static/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'table','form','table','laydate'], function(){
        var table = layui.table,
            form = layui.form,
            laydate = layui.laydate,
            $ = layui.$;

        //select渲染
        /*form.on('select(type)', function(data){
                $("#type").val(data.value);
                });
        form.render('select');*/

        /*
            var start = laydate.render({
                elem : '#start',
                type : 'datetime',
                btns : ['confirm'],
                done : function(value, date) {
                    endMax = end.config.max;
                    end.config.min = date;
                    end.config.min.month = date.month -1;
                }
            });*/
        //方法级渲染
        table.render({
            elem: '#test-table-reload'
            ,url: '${ctx}/some/paperList.do'
            ,cols: [[
                {checkbox: true, fixed: true}
                ,{field:'id', title: 'ID', width:80, sort: true, fixed: true , align:'center'}
                /* ,{field:'type', title: '分类', width:100 , align:'center'}*/
                ,{field:'paperName', title: '资料名称', width:150 , align:'center'}
                ,{field:'paperSize', title: '文件大小', width:150 , align:'center'}
                ,{field:'paperType', title: '文件类型', width:150 , align:'center'}
                ,{field:'updateTime', title: '更新时间', width:200 , align:'center'}
              /*  ,{field:'paperUrl', title: '文件地址',  width:200 , align:'center'}*/
                ,{field:'introduce', title: '文件简介',  width:250}
                ,{align:'center', title: '操作',toolbar : '#tools'}
            ]]
            ,page: true
            ,height: 'full-145'
            ,done: function(res, page, count) {
                //类型显示中文名称
                /*  $("[data-field='type']").children().each(function() {
                    if ($(this).text() == 1) {
                        $(this).html("<span class='layui-btn layui-btn-success layui-btn-normal layui-btn-xs'>资料下载</span>")
                    } else if ($(this).text() == 2) {
                        $(this).html("<span class='layui-btn layui-btn-success layui-btn-normal layui-btn-xs'>软件下载</span>")
                    } else if ($(this).text() == 3) {
                        $(this).html("<span class='layui-btn layui-btn-success layui-btn-normal layui-btn-xs'>常见问题</span>")
                    }
                });*/

                $("[data-field='imgurl']").children().each(function() {
                    if ($(this).text() == '') {
                        $(this).html("暂无图片");
                    }else if($(this).text().indexOf(".")>0){
                        $(this).html("<img src='"+$(this).text()+"' style='width:60px' />");
                    }
                })
            }
        });


        //事件
        var active = {


            search: function(){
                var  filed = {

                    "paperName":$("#paperName").val()

                }
                console.log(filed)
                //执行重载
                table.reload('test-table-reload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }

                    ,where: filed
                });
            }
        };

        table.on("tool(test-table-reload)", function(e) {
            e.data;
            if ("edit" === e.event) {
                var topicEdit = layer.open({
                    type : 2,
                    title : "编辑",
                    content : "${ctx}/some/addAndUpdate.do?id="+e.data.id
                    ,maxmin: true
                    ,area: ['50%', '100%']
                    ,btn: ['提交','取消']
                    ,yes: function(index, layero){
                        var iframeWindow = window['layui-layer-iframe'+ index]
                            ,submitID = 'LAY-user-front-submit'
                            ,submit = layero.find('iframe').contents().find('#'+ submitID);

                        //监听提交
                        iframeWindow.layui.form.on('submit('+ submitID +')', function(data){

                            var field = data.field //获取提交的字段
                            //提交 Ajax 成功后，静态更新表格中的数据
                            $.ajax({
                                type: "POST",//方法类型
                                dataType: "json",//预期服务器返回的数据类型
                                url: "${ctx}/some/update.do" ,//url
                                data: field,
                                success: function (data) {
                                    if (data == 1) {
                                        layer.msg('更新成功', {icon: 6});
                                        table.reload('test-table-reload'); //数据刷新
                                        layer.close(index); //关闭弹层
                                    }else{
                                        layer.msg('更新失败', {icon: 5});
                                        return false;
                                    }
                                },
                                error : function() {
                                    layer.msg('系统出错', {icon: 5});
                                }
                            });

                        });
                        submit.trigger('click');
                    }
                });
                layer.full(topicEdit);
            }else if("del" == e.event) {
                layer.confirm('确定删除吗？', function(index) {
                    //执行 Ajax 后重载
                    $.ajax({
                        type: "POST",//方法类型
                        dataType: "json",//预期服务器返回的数据类型
                        url: "${ctx}/some/del.do?id="+e.data.id,//url
                        contentType : "application/json",
                        success: function (data) {
                            if (data == 1) {
                                layer.msg('删除成功', {icon: 6});
                                table.reload('test-table-reload'); //数据刷新
                            }else{
                                layer.msg('删除失败', {icon: 5});
                            }
                        },
                        error : function() {
                            layer.msg('系统出错', {icon: 5});
                        }
                    });
                });
            }else if("dowload" == e.event) {
            //    debugger
               var DowUser=$(" #userName ").val()
         //       console.log(DowUser);
                var url=e.data.paperUrl;
                window.location.href='${ctx}/proscenium/downloadcheck.do?filePath='+url +'&DowUser='+DowUser;
            }
        });

        $('.test-table-reload-btn .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    });
</script>
</body>
</html>