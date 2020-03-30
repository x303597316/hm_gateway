<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/common/head.jsp"%>

<style type="text/css">
  	.layui-table-cell{
     height: auto!important;
     white-space: normal;
	}
  </style>

<script type="text/javascript" src="${ctx}/static/js/ipconfig.js"></script>

</head>
<body>

 
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card layui-form">
          <div class="layui-card-header">数据表格的重载</div>
          <div class="layui-card-body">
            <div class="test-table-reload-btn" style="margin-bottom: 10px;">
				<div class="layui-form-item" style="margin: 0;">
					
					<label class="layui-form-label">标题：</label>
					<div class="layui-input-inline" >
						<input class="layui-input" name="title" id="title" type="text" placeholder="请输入标题" />
					</div>
					<label class="layui-form-label">类型：</label>
					<div class="layui-input-inline">
						<input name="type" id="type" type="hidden" value=""/>
						<select lay-verify="required" lay-search="" lay-filter="type" >	
						<option value="">--请选择--</option>
						<option value="0" >暂存</option>
	            		<option value="1" >公司新闻</option>
	            		<option value="2" >行业动态</option>
	            		<option value="3" >展会信息</option>
	            		<option value="4" >员工活动</option>
				        </select>
					</div>
					<label class="layui-form-label">开始时间：</label>
					<div class="layui-input-inline" >
						<input type="text" name="start" class="layui-input" id="start" placeholder="开始时间" readonly="readonly" />
					</div>
					<label class="layui-form-label">结束时间：</label>
					<div class="layui-input-inline">
						<input type="text" name="end" class="layui-input" id="end" placeholder="结束时间" readonly="readonly" />
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
  //var imagePath = "http://192.168.200.55:8080/download/gateway/banner";
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
    
    var end = laydate.render({
		elem : '#end',
		type : 'datetime', 
		btns : ['confirm'],
		done : function(value, date) {
            start.config.max = date;
            start.config.max.month = date.month -1;
		}
	});
	var start = laydate.render({
		elem : '#start',
		type : 'datetime', 
		btns : ['confirm'],
		done : function(value, date) {
			endMax = end.config.max;
            end.config.min = date;
            end.config.min.month = date.month -1;
		}
	});
    //方法级渲染
    table.render({
      elem: '#test-table-reload'
      ,url: '${ctx}/News/newslist.do'
      ,cols: [[
        {checkbox: true}
        ,{field:'id', title: 'ID', width:80, sort: true} 
        ,{field:'title', title: '标题', width:120}
        ,{field:'type', title: '类型', width:120}
        ,{field:'createtime', title: '创建时间', width:200}
        ,{field:'visittime', title: '浏览次数',sort: true, width:120}
        ,{field:'imgurl', title: '图片',  width:180}
        ,{align:'center', title: '操作',toolbar : '#tools'}
      ]]
      ,page: true
      ,height: 'full-145'
      ,done: function(res, page, count) {
    	  //类型显示中文名称
    	  $("[data-field='type']").children().each(function() {
			if ($(this).text() == 5) {
				$(this).html("<span class='layui-btn layui-btn layui-btn-radius layui-btn-xs'>暂存</span>")
			} else if ($(this).text() == 1) {
				$(this).html("<span class='layui-btn layui-btn-success layui-btn-normal layui-btn-xs'>公司新闻</span>")
			} else if ($(this).text() == 2) {
				$(this).html("<span class='layui-btn layui-btn-success layui-btn-normal layui-btn-xs'>行业动态</span>")
			} else if ($(this).text() == 3) {
				$(this).html("<span class='layui-btn layui-btn-success layui-btn-normal layui-btn-xs'>展会信息</span>")
			} else if ($(this).text() == 4) {
				$(this).html("<span class='layui-btn layui-btn-success layui-btn-normal layui-btn-xs'>员工活动</span>")
			}
		});
    	  
    	  $("[data-field='imgurl']").children().each(function() {
    		  if ($(this).text() == '') {
    			  $(this).html("暂无图片");
    		  }else if($(this).text().indexOf(".")>0){
    			  $(this).html("<img src='"+ipconfig().imagePath+$(this).text()+"' style='width:60px' />");
    		  }
    	  })
      }
    });
    
    
  //事件
    var active = {
      add: function(){
        var index = layer.open({
          type: 2
          ,title: '新闻添加'
          ,content: '${ctx}/News/newsadd.do'
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
	                url: "${ctx}/News/addorupdateNews.do" ,//url
	                data:field,
	                success: function (data) {
	                    console.log(data);//打印服务端返回的数据(调试用)
	                    if (data.code == 0) {
	                        layer.msg('添加成功', {'icon': 1,'time':3000});
	                        table.reload('test-table-reload'); //数据刷新
              				layer.close(index); //关闭弹层
	                    }else{
	                    	layer.msg(data.msg, {'icon': 2,'time':3000});
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
  ,search: function(){
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
  }
    };
  
    table.on("tool(test-table-reload)", function(e) {
		e.data;
		if ("edit" === e.event) { 
			var topicEdit = layer.open({
				type : 2,
				title : "新闻编辑",
				content : "${ctx}/News/newsupdate.do?id="+e.data.id
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
			                url: "${ctx}/News/addorupdateNews.do" ,//url
			                data: field,
			                success: function (data) {
			                    if (data.code == 0) {
			                        layer.msg('更新成功', {icon: 6});
			                        table.reload('test-table-reload'); //数据刷新
		              				layer.close(index); //关闭弹层
			                    }else{
			                    	layer.msg(data.msg, {icon: 5});
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
	                url: "${ctx}/News/delete.do?id="+e.data.id,//url
	                contentType : "application/json",
	                success: function (data) {
	                    if (data.code == 0) {
	                        layer.msg('删除成功', {icon: 6});
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