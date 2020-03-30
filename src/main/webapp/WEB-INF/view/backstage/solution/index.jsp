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
        <div class="layui-card">
          <div class="layui-card-body">
          
            <div class="test-table-reload-btn" style="margin-bottom: 10px;">
              搜索标题：
              <div class="layui-inline">
                <input class="layui-input" id="clike" autocomplete="off">
              </div>
              <button class="layui-btn" data-type="reload">搜索</button>
              <button class="layui-btn layuiadmin-btn-useradmin" data-type="add">添加</button>
            </div>
            <table class="layui-hide" id="solution-table" lay-filter="solution-table"></table> 
          </div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/html" id="tools">
          <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
			<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="relation"><i class="layui-icon layui-icon-edit"></i>配置关联产品</a>
          <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
  </script>
  <%@ include file="/static/common/footer.jsp"%>
  <script>
  var imagePath = "http://"+ window.location.host+"/download";
  layui.config({
    base: '${ctx}/static/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'table'], function(){
    var table = layui.table;
  
    //方法级渲染
    table.render({
      elem: '#solution-table'
      ,url: '${ctx}/solution/solutionList.do'
      ,cols: [[
        {checkbox: true, fixed: true}
        ,{field:'id', title: 'ID', width:80}
        ,{field:'solutionname', title: '标题', width:200}
        ,{field:'titleimg', title: '标题图片', width:200,templet:"<div>{{ showImg(d.titleimg) }}</div>"}
        ,{field:'type', title: '类型', width:200}
        ,{field:'present', title: '介绍', width:300}
        ,{align:'center', title: '操作',toolbar : '#tools'}
      ]]
      ,page: true
      ,height: 'full-100'
      ,done: function(res, page, count) {
    	  $("[data-field='type']").children().each(function() {
    		  if ($(this).text() == 1) {
    			  $(this).html("<span class='layui-btn layui-btn layui-btn-radius layui-btn-xs'>光接入</span>");
    		  } else if ($(this).text() == 2) {
  				$(this).html("<span class='layui-btn layui-btn-success layui-btn-normal layui-btn-xs'>节能环保</span>");
	  			} else if ($(this).text() == 3) {
	  				$(this).html("<span class='layui-btn layui-btn-success layui-btn-normal layui-btn-xs'>数据中心</span>");
  			} else if ($(this).text() == 4) {
  				$(this).html("<span class='layui-btn layui-btn-success layui-btn-normal layui-btn-xs'>智能光线路管理</span>");
  			} 
    	  })
      }
    });
    
    var $ = layui.$, active = {
      reload: function(){
        var demoReload = $('#clike');
        
        //执行重载
        table.reload('solution-table', {
          page: {
            curr: 1 //重新从第 1 页开始
          }
          ,where: {
        	  clike: demoReload.val()
          }
        });
      }
    ,add:function(){
    	var index = layer.open({
            type: 2
            ,title: '解决方案添加'
            ,content: '${ctx}/solution/edit.do'
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
  	                url: "${ctx}/solution/addorUpdate.do" ,//url
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
                table.reload('solution-table'); //数据刷新
                layer.close(index); //关闭弹层
              });  
              submit.trigger('click');
            }
          }); 
          layer.full(index);
    }
    };
    
    
    table.on("tool(solution-table)", function(e) {
		e.data;
		if ("edit" === e.event) { 
			var topicEdit = layer.open({
				type : 2,
				title : "解决方案编辑",
				content : "${ctx}/solution/edit.do?id="+e.data.id
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
		              console.log(field);
		              //提交 Ajax 成功后，静态更新表格中的数据
		              $.ajax({
			                type: "POST",//方法类型
			                dataType: "json",//预期服务器返回的数据类型
			                url: "${ctx}/solution/addorUpdate.do" ,//url
			                data: field,
			                success: function (data) {
			                    if (data.code == 0) {
			                        layer.msg('更新成功', {icon: 6});
			                        table.reload('solution-table'); //数据刷新
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
	                url: "${ctx}/solution/drop.do?id="+e.data.id,//url
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
		}else if("relation"==e.event){
			layer.open({
				type : 2,
				title : "关联产品列表",
				content : "${ctx}/solution/relationPage.do?solutionId="+e.data.id
				,maxmin: true
	            ,area: ['50%', '100%']
	            ,btn: ['确定']
			});
		}
	});
    
    $('.test-table-reload-btn .layui-btn').on('click', function(){
      var type = $(this).data('type');
      active[type] ? active[type].call(this) : '';
    });
  
  });
//显示图片
	function showImg(img){
		if(img!=null && img!=''){
				return "<img style='width:250px;height:35px' src='"+imagePath+img+"'>";			
		}else{
			return "";
		}
	}
  </script>
</body>
</html>