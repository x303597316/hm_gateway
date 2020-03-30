<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/static/common/head.jsp"%>

  </head>
  
  <body>
	 <div class="layui-fluid">   
	    <div class="layui-card">
	      <div class="layui-form layui-card-header layuiadmin-card-header-auto">
	        <div class="layui-form-item" style="width:500px;margin:auto">
		        <div class="layui-inline">
		          <label class="layui-form-label">菜单名称</label>
		          <div class="layui-input-block">
	              	<input type="text" name="term" placeholder="请输入" autocomplete="off" class="layui-input">
	              </div>
			    </div>
			    <div class="layui-inline">
		            <button class="layui-btn layuiadmin-btn-useradmin" lay-submit lay-filter="LAY-menu-search">
		              <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
		            </button>
	          	</div>
	        </div>
	      </div>
	      <div class="layui-card-body">
	        <div style="padding-bottom: 10px;">
	          <button class="layui-btn layuiadmin-btn-role" data-type="batchdel">删除</button>
	          <button class="layui-btn layuiadmin-btn-role" data-type="add">添加</button>
	        </div>
	      
	        <table id="LAY-menu-manage" lay-filter="LAY-menu-manage"></table>  
	        
	        <script type="text/html" id="buttonTpl">
          		{{#  if(d.status == 1){ }}
            	<button class="layui-btn layui-btn-xs">启用</button>
          		{{#  } else { }}
            	<button class="layui-btn layui-btn-primary layui-btn-xs">停用</button>
          		{{#  } }}
        	</script>
        	
        	<script type="text/html" id="indexTpl">
    			{{d.LAY_TABLE_INDEX+1}}
			</script>
	        
	        <script type="text/html" id="toolTpl">
             <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
             <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
            </script>
	      </div>
	    </div>
	  </div>
	  <%@ include file="/static/common/footer.jsp"%>
	  <script>
		 layui.config({
		    base: '${ctx}/static/layuiadmin/' //静态资源所在路径
		  }).extend({
		    index: 'lib/index' //主入口模块
		  }).use(['index', 'treeGrid'], function(){
		    var $ = layui.$
		    ,form = layui.form
		    ,table = layui.treeGrid
		    ,element = layui.element;
		    
		    //搜索菜单
		    form.on('submit(LAY-menu-search)', function(data){
		      var field = data.field;
		      //执行重载
		      table.reload('LAY-menu-manage', {
		        where: field
		      });
		    });
		  
		  	//角色table
			  table.render({
			    elem: '#LAY-menu-manage'
			    ,treeId : 'id' //树形id字段名称
				,treeUpId : 'parentId' //树形父id字段名称
				,treeShowName : 'menuName' //以树形式显示的字段
			    ,height : "full-220"
			    ,url: '${ctx}/menu/selectAll.do' //数据接口
			    ,cols: [[ //表头
			       {type : "checkbox"}
			      ,{title: '序号', width:'5%' , align:'center',templet: '#indexTpl'}
			      ,{field: 'menuName', title: '菜单名称', width:'10%' , align:'center'}
			      ,{field: 'urlPath', title: '菜单路径', width:'20%' , align:'center'}
			      /* ,{field: 'icon', title: '菜单图标', width:'10%' , align:'center'} */
			      ,{field: 'createTime', title: '创建时间', width:'20%' , align:'center'} 
			      ,{field: 'createUser', title: '创建人', width:'10%' , align:'center'}
			      ,{field: 'status', title: '状态', templet: '#buttonTpl', width:'10%' , align:'center'}
			      ,{ title: '操作', align:'center',toolbar : '#toolTpl'}
			    ]]
			    ,limit: 100
			  });
		  
		    //事件
		    var active = {
		      batchdel: function(){
		        var checkStatus = table.checkStatus('LAY-menu-manage')
		        ,checkData = checkStatus.data; //得到选中的数据
		
		        if(checkData.length === 0){
		          return layer.msg('请选择数据');
		        }
		        var array = [];
				for(var i=0;i<checkData.length;i++){
		        	array[i]=checkData[i].id;
		        }
		        layer.confirm('确定删除吗？', function(index) {
		          //执行 Ajax 后重载
		            $.ajax({
		                type: "POST",//方法类型
		                dataType: "json",//预期服务器返回的数据类型
		                url: "${ctx}/menu/drop.do" ,//url
		                contentType : "application/json",
		                data: JSON.stringify(array),
		                success: function (data) {
		                    if (data.code == 0) {
		                        layer.msg('删除成功', {icon: 6});
		                        table.reload('LAY-menu-manage');
		                    }else{
		                    	layer.msg(data.msg, {icon: 5});
		                    }
		                },
		                error : function() {
		                    layer.msg('系统出错', {icon: 5});
		                }
			         });
		        });
		      },
		      add: function(){
		      
		        var checkStatus = table.checkStatus('LAY-menu-manage')
		        ,checkData = checkStatus.data; //得到选中的数据
		        var id = "";
		        if(checkData.length > 1){
		          return layer.msg('只能选择1个父类菜单');
		        }
		        if(checkData.length===1){
		        	id = checkData[0].id;
		        }
		        
		        layer.open({
		          type: 2
		          ,title: '添加菜单'
		          ,content: '${ctx}/menu/menuEdit.do?pid='+id
		          ,area: ['500px', '480px']
		          ,btn: ['确定', '取消']
		          ,yes: function(index, layero){
		            var iframeWindow = window['layui-layer-iframe'+ index]
		            ,submit = layero.find('iframe').contents().find("#LAY-menu-submit");
		
		            //监听提交
		            iframeWindow.layui.form.on('submit(LAY-menu-submit)', function(data){
		              var field = data.field; //获取提交的字段
		              //提交 Ajax 成功后，静态更新表格中的数据
		              $.ajax({
			                type: "POST",//方法类型
			                dataType: "json",//预期服务器返回的数据类型
			                url: "${ctx}/menu/saveOrUpdate.do" ,//url
			                data: field,
			                success: function (data) {
			                    if (data.code == 0) {
			                        layer.msg('添加成功', {icon: 6});
			                        table.reload('LAY-menu-manage'); //数据刷新
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
		      }
		    }
		    
		    //绑定table的tool事件
		    table.on("tool(LAY-menu-manage)", function(e) {
				e.data;
				if ("del" === e.event) 
					layer.confirm("确定删除吗？", function(t) {
						var array = []; 
						array[0] = e.data.id;
			            $.ajax({
			                type: "POST",//方法类型
			                dataType: "json",//预期服务器返回的数据类型
			                url: "${ctx}/menu/drop.do" ,//url
			                contentType : "application/json",
			                data: JSON.stringify(array),
			                success: function (data) {
			                    if (data.code == 0) {
			                    	layer.close(t)
			                        layer.msg('删除成功', {icon: 6});
			                        e.del();
			                    }else{
			                    	layer.close(t);
			                    	layer.msg(data.msg, {icon: 5});
			                    }
			                },
			                error : function() {
			                	layer.close(t)
			                    layer.msg('系统出错', {icon: 5});
			                }
				         });
					})
				else if ("edit" === e.event) {
					$(e.tr);
					layer.open({
						type : 2,
						title : "编辑角色",
						content : "${ctx}/menu/menuEdit.do?id="+e.data.id,
						maxmin : !0,
						area : [ "500px", "450px" ],
						btn : [ "确定", "取消" ],
						yes : function(e, t) {
							var l = window["layui-layer-iframe" + e],
								r = "LAY-menu-submit",
								n = t.find("iframe").contents().find("#" + r);
							l.layui.form.on("submit(" + r + ")", function(t) {
								var field = t.field;
								//提交 Ajax 成功后，静态更新表格中的数据
					              $.ajax({
						                type: "POST",//方法类型
						                dataType: "json",//预期服务器返回的数据类型
						                url: "${ctx}/menu/saveOrUpdate.do" ,//url
						                data: field,
						                success: function (data) {
						                    if (data.code == 0) {
						                        layer.msg('更新成功', {icon: 6});
						                        table.reload('LAY-menu-manage'); //数据刷新
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
					})
				}
			});
		    
		    $('.layui-btn.layuiadmin-btn-role').on('click', function(){
		      var type = $(this).data('type');
		      active[type] ? active[type].call(this) : '';
		    });
		  });
	  </script>
  </body>
</html>
