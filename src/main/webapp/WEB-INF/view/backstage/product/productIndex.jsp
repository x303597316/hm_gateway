<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/static/common/w-head.jsp"%>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">产品列表</div>
          <div class="layui-card-body">
          
            <div class="test-table-reload-btn" style="margin-bottom: 10px;">
              <button class="layui-btn" data-type="add">添加</button>
            <!-- <button class="layui-btn" data-type="able">启用</button>
            <button class="layui-btn layui-btn-danger" data-type="diss">禁用</button>&nbsp; -->
            <div class=" layui-inline"  style="margin-bottom: 10px;float:right">
             	 搜索名称：
             <div class="layui-inline">
               <input class="layui-input" placeholder="支持模糊搜索" id="test-table-demoReload" autocomplete="off">
             </div>
             <button class="layui-btn" lay-submit lay-filter="table-search" data-type="reload">搜索</button>
              </div>
            </div>
             <table id="treeTable" lay-filter="treeTable"></table>
          </div>
        </div>
      </div>
    </div>
  </div>
<script type="text/html" id="toolTpl">
<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="drop"><i class="layui-icon layui-icon-delete"></i>删除</a>
</script>
	<%@ include file="/static/common/footer.jsp"%> 
	<script type="text/javascript">
	var treeTable;
	layui.config({	
	    base: '${ctx}/static/layuiadmin/' //静态资源所在路径
	  }).extend({
	    index: 'lib/index' //主入口模块
	  }).use(['index', 'form', 'table','upload', 'treeGrid','laypage'], function(){
				var table = layui.treeGrid,
					form = layui.form,
					$ = layui.$,
					laypage = layui.laypage;
				table.render({
					id : "treeTable",
					elem : '#treeTable',
					url : '${ctx}/Product/productList.do',
					height : 'full-150',
					spread: false, //展开
					treeId : 'id', //树形id字段名称
					treeUpId : 'parentid', //树形父id字段名称
					treeShowName : 'productname', //以树形式显示的字段
					cols : [ [ {
						field : 'id',
						title : 'ID',
						width : '2%',
						type : "checkbox"
					}, {
						field : 'productname',
						width : '20%',
						title : '名称'
					}, {
						field : 'describe',
						width : '16%',
						title : '介绍'
					}, {
						field : 'img',
						width : '20%',
						title : '图片'
					}, {
						title : '操作',
						align : 'center',
						toolbar : '#toolTpl',
						width : '40%',
					} ] ],
					page : false
					,done:function(res, page, count){
						$("[data-field='img']").children().each(function() {
				    		  if ($(this).text() == '') {
				    			  $(this).html("暂无图片");
				    		  }else if($(this).text().indexOf(".")>0){
				    			  $(this).html("<img src='${imgPath}"+$(this).text()+"' style='width:60px' />");
				    		  }
				    	  })
					}
				});
	
				 /**监听查询 begin*/
				/* form.on('submit(search)', function(data) {
					queryList();
					return false;
				}); */
				/**监听查询 end*/
	
				/**监听工具条 begin*/
				table.on('tool(treeTable)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
					var tr = obj.tr; //获得当前行 tr 的DOM对象
					if (layEvent === 'edit') { //修改监控
						var topicEdit = layer.open({
							type : 2,
							title : "产品编辑",
							content : "${ctx}/Product/AddorEdit.do?id="+obj.data.id
							,maxmin: true
					          ,area: ['100%', '100%']
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
						                url: "${ctx}/Product/productAddorUpdate.do" ,//url
						                data: field,
						                success: function (data) {
						                    if (data.code == 0) {
						                        layer.msg('更新成功', {icon: 6});
						                        table.reload('treeTable'); //数据刷新
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
					} else if (layEvent === 'drop') { //修改监控
						layer.confirm("确认删除？", {
							btn : [ '确认', '取消' ], //可以无限个按钮
							btn1 : function(index, layero) {
								$.ajax({
									url:"${ctx}/Product/drop.do?id="+data.id,
									type:"get",
									dataType:"json",
									success:function(e){
										if(e.code==0){
											layer.close(index);
											obj.del();
										}else{
											layer.alert(e.msg);
										}
									}
								})
							}
						});
					}
				}); 
			/**监听工具条 end*/ 
			
				var active = {
						reload: function(){
					        var demoReload = $('#test-table-demoReload');
					        //执行重载
					        table.reload('treeTable', {
					          where: {
					        	  productName: demoReload.val()
					          }
					        });
					      }
						,add: function(){
						      
					        var checkStatus = table.checkStatus('treeTable')
					        ,checkData = checkStatus.data; //得到选中的数据
					        
					        var id = "";
					        if(checkData.length > 1){
					          return layer.msg('只能选择1个父类菜单');
					        }
					        if(checkData.length===1){
					        	id = checkData[0].id;
					        }
					        
					        var index = layer.open({
					          type: 2
					          ,title: '添加产品'
					          ,content: '${ctx}/Product/AddorEdit.do?pid='+id
					          ,area: ['500px', '480px']
					          ,btn: ['确定', '取消']
					          ,yes: function(index, layero){
					            var iframeWindow = window['layui-layer-iframe'+ index]
					            ,submit = layero.find('iframe').contents().find("#LAY-user-front-submit");
					
					            //监听提交
					            iframeWindow.layui.form.on('submit(LAY-user-front-submit)', function(data){
					              var field = data.field; //获取提交的字段
					              //提交 Ajax 成功后，静态更新表格中的数据
					              $.ajax({
						                type: "POST",//方法类型
						                dataType: "json",//预期服务器返回的数据类型
						                url: "${ctx}/Product/productAddorUpdate.do" ,//url
						                data: field,
						                success: function (data) {
						                    if (data.code == 0) {
						                        layer.msg('添加成功', {icon: 6});
						                        table.reload('treeTable'); //数据刷新
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
					       layer.full(index);
						      }
					    
					    	  };
					     
					    
				$(".test-table-reload-btn .layui-btn").on("click", function(){
				      var type = $(this).data('type');
				      active[type] ? active[type].call(this) : "";
				    });
				
			
			
			});
			
	</script>

	<!-- layUI模板begin -->
</body>
</html>
