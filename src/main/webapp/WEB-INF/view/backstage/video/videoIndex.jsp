<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/common/head.jsp"%>
</head>
<body>

  <div class="layui-card layadmin-header">
    <div class="layui-breadcrumb" lay-filter="breadcrumb">
      <a lay-href="">主页</a>
      <a><cite>组件</cite></a>
      <a><cite>数据表格</cite></a>
      <a><cite>数据表格的重载</cite></a>
    </div>
  </div>
 
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card layui-form">
          <div class="layui-card-body">
            <div class="test-table-reload-btn" style="margin-bottom: 10px;">
				<div class="layui-form-item" style="margin: 0;">
					<label class="layui-form-label">标题：</label>
					<div class="layui-input-inline" >
						<input class="layui-input" name="term" id="term" type="text" placeholder="请输入标题" />
					</div>
	              <button class="layui-btn" data-type="search" lay-submit lay-filter="LAY-user-front-search">搜索</button>
	              <div>
	              	<button class="layui-btn layuiadmin-btn-useradmin" data-type="add">添加</button>
	              </div>
				</div>
            </div>
            <table class="layui-hide" id="test-table-reload" lay-filter="test-table-reload"></table> 
          </div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/html" id="tools">
          <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
          <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
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
    form.on('select(type)', function(data){
			$("#type").val(data.value);
			});
    form.render('select');
    
  //条件查询
	form.on('submit(LAY-user-front-search)',function(e){
		//表格重载
		table.reload('test-table-reload',{
			where:e.field
		});
	});
    
    //方法级渲染
    table.render({
      elem: '#test-table-reload'
      ,url: '${ctx}/Video/videoList.do'
      ,cols: [[
        {checkbox: true, fixed: true}
        ,{field:'id', title: 'ID', width:100, sort: true, fixed: true , align:'center'} 
        ,{field:'videoname', title: '视频名称', width:350 , align:'center'}
        ,{field:'videourl', title: '视频地址', width:350 , align:'center'}
        ,{field:'introduce', title: '视频描述', width:350}
        ,{align:'center', title: '操作',toolbar : '#tools'}
      ]]
    //分页
    ,page: true
    ,done: function(res, page, count) {
    }
    });
    
    
  //事件
    var active = {
      add: function(){
        var index = layer.open({
          type: 2
          ,title: '添加'
          ,content: '${ctx}/Video/addAndUpdate.do'
          ,maxmin: true
          ,area: ['800px', '600px']
          ,btn: ['确定', '取消']
          ,yes: function(index, layero){
            var iframeWindow = window['layui-layer-iframe'+ index]
            ,submitID = 'LAY-user-front-submit'
            ,submit = layero.find('iframe').contents().find('#'+ submitID);

            //监听提交
            iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
              var field = data.field; //获取提交的字段
              console.log(field);
              //提交 Ajax 成功后，静态更新表格中的数据
              $.ajax({
	                type: "POST",//方法类型
	                dataType: "json",//预期服务器返回的数据类型
	                url: "${ctx}/Video/add.do" ,//url
	                data:field,
	                success: function (data) {
	                    if (data == 1) {
	                        layer.msg('添加成功', {'icon': 1,'time':3000});
	                        table.reload('test-table-reload'); //数据刷新
              				layer.close(index); //关闭弹层
	                    }else{
	                    	layer.msg('添加失败', {'icon': 2,'time':3000});
	                    }
	                },
	                error : function() {
	                    layer.msg('系统错误', {'icon': 2,'time':3000});
	                }
	            });
              table.reload('test-table-reload'); //数据刷新
              layer.close(index); //关闭弹层
            });  
            submit.trigger('click');
          }
        }); 
        layer.full(index);
      }
  /* ,search: function(){
        //执行重载
        table.reload('test-table-reload', {
          page: {
            curr: 1 //重新从第 1 页开始
          }
          ,where: {
              title: $("#title").val()
              ,type:$("#type").val()
              ,start:$("#start").val()
              ,end:$("#end").val()
          }
        });
  } */
    };
  
    table.on("tool(test-table-reload)", function(e) {
		e.data;
		if ("edit" === e.event) { 
			var topicEdit = layer.open({
				type : 2,
				title : "编辑",
				content : "${ctx}/Video/addAndUpdate.do?id="+e.data.id
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
			                url: "${ctx}/Video/update.do" ,//url
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
	                url: "${ctx}/Video/del.do?id="+e.data.id,//url
	                contentType : "application/json",
	                success: function (data) {
	                	//alert(data)
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