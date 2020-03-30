<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
				<div class="layui-form-item" style="margin: 0;">
					<label class="layui-form-label">招聘职位：</label>
					<div class="layui-input-inline" >
						<input class="layui-input" name="job" id="job" type="text" placeholder="请输入招聘职位"/>
					</div>
	              <button class="layui-btn" data-type="search">搜索</button>
	              <button class="layui-btn layuiadmin-btn-useradmin" data-type="add">添加</button>
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
  var id = '${id}';
  layui.config({
    base: '${ctx}/static/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'table','form','table','laydate'], function(){
    var table = layui.table,
    form = layui.form,
    laydate = layui.laydate,
    $ = layui.$;
    //方法级渲染
    table.render({
      	elem: '#test-table-reload'
      	,url: '${ctx}/recruit/recruitList.do?type='+id
      	,cols: [[
	        {field:'job', title: '招聘职位', width:180}
	        ,{field:'department', title: '公司部门', width:180}
	        ,{field:'number', title: '招聘人数', width:100}
	        ,{field:'address', title: '工作地址', width:250}
	        ,{field:'workreatment', title: '工作待遇',  width:100}
	        ,{field:'contacts', title: '联系人',  width:180}
	        ,{field:'mobile', title: '联系电话',  width:180}
	        ,{field:'createTime', title: '发布时间',  width:180}
	        ,{align:'center', title: '操作',toolbar : '#tools'}
      	]]
      	,page: true
      	,height: 'full-145'
      	,done: function(res, page, count) {
    	  
      	}
    });
  	//事件
    var active = {
      add: function(){
        var index = layer.open({
          type: 2
          ,title: '页面编辑'
          ,content: '${ctx}/recruit/toAddRecruit.do?type=' + id
          ,maxmin: true
          ,area: ['500px', '450px']
          ,btn: ['确定', '取消']
          ,yes: function(index, layero){
            var iframeWindow = window['layui-layer-iframe'+ index]
            ,submitID = 'LAY-user-front-submit'
            ,submit = layero.find('iframe').contents().find('#'+ submitID);

            //监听提交
            iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
              var field = data.field; //获取提交的字段
              field.requirement = field.editorValue;
              field.id = "";
              delete field.editorValue;
              $.post("${ctx}/recruit/addRecruit.do",field,function(data){
				 if (data.code == 0) {
                       layer.msg(data.msg, {icon: 6});
                       table.reload('test-table-reload'); //数据刷新
            				layer.close(index); //关闭弹层
                  	 }else{
                   	layer.msg(data.message, {icon: 5});
                    }
              },"JSON")
              table.reload('test-table-reload'); //数据刷新
              layer.close(index); //关闭弹层
            });  
            submit.trigger('click');
          }
        }); 
        layer.full(index);
      }
  ,search: function(){
	  	var field = {
    		  "job":$("#job").val(),
    		  "type":id
      	}
	  	console.log(field)
        //执行重载
        table.reload('test-table-reload', {
	          page: {
	            curr: 1 //重新从第 1 页开始
	          }
	          ,where: field
	        });
  		}
    };
  
    table.on("tool(test-table-reload)", function(e) {
		e.data;
		if ("edit" === e.event) { 
			var topicEdit = layer.open({
				type : 2,
				title : "招聘信息编辑",
				content : "${ctx}/recruit/toAddRecruit.do?id="+e.data.id
				,maxmin: true
		          ,area: ['50%', '50%']
		          ,btn: ['提交','取消']
		          ,yes: function(index, layero){
		            var iframeWindow = window['layui-layer-iframe'+ index]
		            ,submitID = 'LAY-user-front-submit'
		            ,submit = layero.find('iframe').contents().find('#'+ submitID);
					
		            //监听提交
		            iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
		              var field = data.field //获取提交的字段
		              field.requirement = field.editorValue;
		              delete field.editorValue;
		              console.log(field)
		              //提交 Ajax 成功后，静态更新表格中的数据
					 $.post("${ctx}/recruit/addRecruit.do",field,function(data){
						 if (data.code == 0) {
	                        layer.msg(data.msg, {icon: 6});
	                        table.reload('test-table-reload'); //数据刷新
              				layer.close(index); //关闭弹层
	                   	 }else{
	                    	layer.msg(data.message, {icon: 5});
	                     }
		              },"JSON")
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
	                url: "${ctx}/recruit/deleteRecruit.do?id="+e.data.id,//url
	                contentType : "application/json",
	                success: function (data) {
	                    if (data.code == 0) {
	                        layer.msg(data.msg, {icon: 6});
	                        table.reload('test-table-reload'); //数据刷新
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
    
    $('.test-table-reload-btn .layui-btn').on('click', function(){
      var type = $(this).data('type');
      active[type] ? active[type].call(this) : '';
    });
  
  });
  </script>
</body>
</html>