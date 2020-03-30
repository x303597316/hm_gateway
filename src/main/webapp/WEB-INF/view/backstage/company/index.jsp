<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">公司信息</div>
          <div class="layui-card-body">
          
           <!--  <div class="test-table-reload-btn" style="margin-bottom: 10px;">
              搜索ID：
              <div class="layui-inline">
                <input class="layui-input" name="id" id="test-table-demoReload" autocomplete="off">
              </div>
              <button class="layui-btn" data-type="reload">搜索</button>
              <button class="layui-btn layuiadmin-btn-role" data-type="add">添加</button>
            </div> -->
            <table class="layui-hide" id="test-table-reload" lay-filter="test-table-reload"></table> 
          </div>
        </div>
      </div>
    </div>
  </div>
  
<!--      <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a> -->
<script type="text/html" id="tools">
	<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
</script>
  
  <%@ include file="/static/common/footer.jsp"%>
  <script>
  layui.config({
    base: '${ctx}/static/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'table'], function(){
    var table = layui.table;
  
    //方法级渲染
    table.render({
      elem: '#test-table-reload'
      ,url: '${ctx}/CompanyInfo/infolist.do'
      ,cols: [[
        {field:'id', title: 'ID', width:80, sort: true}
        ,{field:'sectionname', title: '模块名称', width:200}
        /* ,{field:'titleimage', title: '图片', width:200} */
        ,{title: '操作',align:'center',toolbar : '#tools'}
      ]]
      ,page: false
      ,height: "full-110"
      ,done:function(res, page, count) {
			//性别显示中文名称  
			$("[data-field='titleimage']").children().each(function() {
				if ($(this).text() == '') {
	    			  $(this).html("暂无图片");
	    		  }else if($(this).text().indexOf(".")>0){
	    			  $(this).html("<img  alt='' src='${imgpath}"+$(this).text()+"' >");
	    		  }
			});
      }
    });
    
    var $ = layui.$, active = {
      reload: function(){
        var demoReload = $('#test-table-demoReload');
        
        //执行重载
        table.reload('test-table-reload', {
          page: {
            curr: 1 //重新从第 1 页开始
          }
          ,where: {
              id: demoReload.val()
          }
        });
      }
    ,add:function(){
    	var page = layer.open({
	          type: 2
	          ,title: '添加模块'
	          ,content: '${ctx}/CompanyInfo/gotoAdd.do'
	          ,area: ['500px', '480px']
	          ,btn: ['确定', '取消']
	          ,yes: function(index, layero){
	            var iframeWindow = window['layui-layer-iframe'+ index]
	            ,submit = layero.find('iframe').contents().find("#LAY-user-front-submit");
	
	            //监听提交
	            iframeWindow.layui.form.on('submit(LAY-user-front-submit)', function(data){
	              var field = data.field; //获取提交的字段
	              console.log(field);
	              //提交 Ajax 成功后，静态更新表格中的数据
	              $.ajax({
		                type: "POST",//方法类型
		                dataType: "json",//预期服务器返回的数据类型
		                url: "${ctx}/CompanyInfo/infoAddorEdit.do" ,//url
		                data: field,
		                success: function (data) {
		                    if (data.code == 0) {
		                        layer.msg('添加成功', {icon: 6});
		                        table.reload('test-table-reload'); //数据刷新
	              				layer.close(index); //关闭弹层
		                    }else{
		                    	layer.msg(data.msg, {icon: 5});
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
    	layer.full(page);
    }
    };
    
    
  //绑定table的tool事件
    table.on("tool(test-table-reload)", function(e) {
		e.data;
		if ("del" === e.event) {
			layer.confirm("确定删除吗？", function(t) {
	            $.ajax({
	                type: "GET",//方法类型
	                dataType: "json",//预期服务器返回的数据类型
	                url: "${ctx}/CompanyInfo/drop.do?id="+ e.data.id,//url
	                contentType : "application/json",
	                success: function (data) {
	                    if (data.code == 0) {
	                    	layer.close(t);
	                        layer.msg('删除成功', {icon: 6});
	                        e.del();
	                    }else{
	                    	layer.close(t);
	                    	layer.msg(data.msg, {icon: 5});
	                    }
	                },
	                error : function() {
	                	layer.close(t);
	                    layer.msg('系统出错', {icon: 5});
	                }
		         });
			})
		}
		else if ("edit" === e.event) {
		
			console.log(e);
			$(e.tr);
			var index = layer.open({
				type : 2,
				title : "编辑模块",
				content : "${ctx}/CompanyInfo/gotoEdit.do?id="+e.data.id,
				maxmin : !0,
				area : [ "800px", "600px" ],
				btn : [ "确定", "取消" ],
				yes : function(e, t) {
					var l = window["layui-layer-iframe" + e],
						r = "LAY-user-front-submit",
						n = t.find("iframe").contents().find("#" + r);
					l.layui.form.on("submit(" + r + ")", function(t) {
						var field = t.field;
						console.log(field);
						//提交 Ajax 成功后，静态更新表格中的数据
			              $.ajax({
				                type: "POST",//方法类型
				                dataType: "json",//预期服务器返回的数据类型
				                url: "${ctx}/CompanyInfo/infoAddorEdit.do" ,//url
				                data: field,
				                success: function (data) {
				                    if (data.code == 0) {
				                        layer.msg('更新成功', {icon: 6});
				                        table.reload('test-table-reload'); //数据刷新
			              				layer.close(e); //关闭弹层
				                    }else{
				                    	layer.msg(data.msg, {icon: 5});
				                    }
				                },
				                error : function() {
				                    layer.msg('系统出错', {icon: 5});
				                }
				            });
					}), n.trigger("click")
				},
				success : function(e, $) {
					
				}
			});
			layer.full(index);
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