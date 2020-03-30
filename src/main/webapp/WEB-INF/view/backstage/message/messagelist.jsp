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
	        <div class="layui-form-item" >
	          <div class="layui-inline">
	            <label class="layui-form-label">搜索</label>
	            <div class="layui-input-block">
	              <input type="text" name="term" placeholder="请输入" autocomplete="off" class="layui-input">
	            </div>
	          </div>
	          <div class="layui-inline">
			    <label class="layui-form-label">开始时间</label>
			    <div class="layui-input-inline">
			      <input type="text" name="beginTime" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
			    </div>
			  </div>
			  <div class="layui-inline">
			    <label class="layui-form-label">结束时间</label>
			    <div class="layui-input-inline">
			      <input type="text" name="endTime" class="layui-input" id="test2" placeholder="yyyy-MM-dd">
			    </div>
			  </div>
	          <div class="layui-inline">
	            <button class="layui-btn layuiadmin-btn-useradmin" lay-submit lay-filter="LAY-user-front-search">
	              <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
	            </button>
	          </div>
	        </div>
	      </div>
	      
	      <div class="layui-card-body">
	        <div style="padding-bottom: 10px;">
	          <!-- <button class="layui-btn layuiadmin-btn-useradmin" data-type="batchdel">删除</button> -->
	        </div>
	        
	        <table id="LAY-user-manage" lay-filter="LAY-user-manage"></table>
	        
	        <script type="text/html" id="toolTpl">
             <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
             <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
            </script>
            
            <script type="text/html" id="indexTpl">
    			{{d.LAY_TABLE_INDEX+1}}
			</script>
	      </div>
	    </div>
	  </div>
	  <%@ include file="/static/common/footer.jsp"%>
	  
	  <script>
	  var all = '${all}';
		  layui.config({
		    base: '${ctx}/static/layuiadmin/' //静态资源所在路径
		  }).extend({
		    index: 'lib/index' //主入口模块
		  }).use(['index',  'table','laydate'], function(){
		    var $ = layui.$
		    ,form = layui.form
		    ,table = layui.table
		    ,laydate=layui.laydate;
		    
		  //常规用法
		    laydate.render({
		      elem: '#test1'
		    });
		  //常规用法
		    laydate.render({
		      elem: '#test2'
		    });
		    
		    //table表格
		    table.render({
			    elem: '#LAY-user-manage'
			    ,height : "full-220"
			    ,url: '${ctx}/Message/mesList.do' //数据接口
			    ,page: true //开启分页
			    ,cols: [[ //表头
			       {type : "checkbox",fixed : "left"}
			       ,{title: '序号', width:'10%' , align:'center',templet: '#indexTpl'}
				   ,{field: 'name', title: '名字', width:'15%' , align:'center',}
 			       ,{field: 'email', title: '邮箱', width:'15%' , align:'center'}
 			       ,{field: 'phone', title: '联系电话', width:'15%', align:'center',} 
			       ,{field: 'createtime', title: '创建时间', width:'15%' , align:'center'}
			       ,{field: 'message', title: '留言', width:'30%' , align:'center'}
			    ]],
				done : function(res, page, count) {
					//性别显示中文名称  
					$("[data-field='sex']").children().each(function() {
						if ($(this).text() == 1) {
							$(this).text("男")
						} else if ($(this).text() == 2) {
							$(this).text("女")
						}
					}),
					//性别显示中文名称  
					$("[data-field='status']").children().each(function() {
						if ($(this).text() == 1) {
							$(this).text("启用")
						} else if ($(this).text() == 2) {
							$(this).text("停用")
						}
					})
					
				}
		    });
		    
		    //监听搜索
		    form.on('submit(LAY-user-front-search)', function(data){
		    	
		      var field = data.field;
		      
		      //执行重载
		      table.reload('LAY-user-manage', {
		        where: field
		      });
		    });
		    
		    
		    
 		    //事件
		    var active = {
		      batchdel: function(){
		        var checkStatus = table.checkStatus('LAY-user-manage')
		        ,checkData = checkStatus.data; //得到选中的数据
		        if(checkData.length === 0){
		          return layer.msg('请选择数据');
		        }
		        var array = [];
				for(var i=0;i<checkData.length;i++){
		        	array[i]=checkData[i].id;
		        }
		        layer.prompt({
		          formType: 1
		          ,title: '敏感操作，请验证口令'
		        }, function(value, index){
		          
		          $.ajax({
		                type: "POST",//方法类型
		                dataType: "json",//预期服务器返回的数据类型
		                url: "${ctx}/car/confirmPassword.do" ,//url
		                data: {password:value},
		                success: function (data) {
		                    console.log(data);//打印服务端返回的数据(调试用)
		                    if (data.code == 0) {
		                        layer.close(index);
		                    }else{
		                    	layer.close(index);
		                    	layer.msg(data.msg, {icon: 5});
		                    	return;
		                    }
		                },
		                error : function() {
		                    layer.msg('系统出错', {icon: 5});
		                    layer.close(index);
		                    return;
		                }
			       });
		          
		          layer.confirm('确定删除吗？', function(index) {
		            //执行 Ajax 后重载
		            $.ajax({
		                type: "POST",//方法类型
		                dataType: "json",//预期服务器返回的数据类型
		                url: "${ctx}/car/del.do" ,//url
		                contentType : "application/json",
		                data: JSON.stringify(array),
		                success: function (data) {
		                    console.log(data);//打印服务端返回的数据(调试用)
		                    if (data.code == 1) {
		                        layer.msg('删除成功', {icon: 6});
		                        table.reload('LAY-user-manage'); //数据刷新
		                    }else{
		                    	layer.msg(data.msg, {icon: 5});
		                    }
		                    table.reload('LAY-user-manage', {
		        		        where: field
		        		      });
		                },
		                error : function() {
		                    layer.msg('系统出错', {icon: 5});
		                }
			         });
		          });
		        });
		      }
		      ,add: function(){
		        layer.open({
		          type: 2
		          ,title: '添加车辆'
		          ,content: '${ctx}/car/gotoud.do'
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
		              //提交 Ajax 成功后，静态更新表格中的数据
		              $.ajax({
			                type: "POST",//方法类型
			                dataType: "json",//预期服务器返回的数据类型
			                url: "${ctx}/car/add.do" ,//url
			                data: field,
			                success: function (data) {
			                    console.log(data);//打印服务端返回的数据(调试用)
			                    if (data.code == 1) {
			                        layer.msg('添加成功', {icon: 6});
			                        table.reload('LAY-user-manage'); //数据刷新
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
		    };
		    
		    //绑定table的tool事件
		    table.on("tool(LAY-user-manage)", function(e) {
				if ("del" === e.event) {
					layer.confirm("确定删除吗？", function(t) {
			            $.ajax({
			                type: "POST",//方法类型
			                dataType: "json",//预期服务器返回的数据类型
			                url: "${ctx}/car/del.do" ,
			                data: {'id':e.data.id},
			                success: function (res) {
			                	layer.close(t);
			                    if (res.code == 1) {
			                        layer.msg(res.msg, {icon: 6});
			                        table.reload('LAY-user-manage'); //数据刷新
			                    }else{
			                    	layer.msg(res.msg, {icon: 5});
			                    }
			                    table.reload('LAY-user-manage', {
			        		        where: field
			        		      });
			                },
			                error : function() {
			                	layer.close(t)
			                    layer.msg('系统出错', {icon: 5});
			                }
				         });
					})
					
				}else if ("edit" === e.event) {
					$(e.tr);
					layer.open({
						type : 2,
						title : "编辑用户",
						content : "${ctx}/car/gotoud.do?id="+e.data.id,
						maxmin : !0,
						area : [ "500px", "450px" ],
						btn : [ "确定", "取消" ],
						yes : function(e, t) {
							var l = window["layui-layer-iframe" + e],
								r = "LAY-user-front-submit",
								n = t.find("iframe").contents().find("#" + r);
							l.layui.form.on("submit(" + r + ")", function(t) {
								var field = t.field;
								//提交 Ajax 成功后，静态更新表格中的数据
					              $.ajax({
						                type: "POST",//方法类型
						                dataType: "json",//预期服务器返回的数据类型
						                url: "${ctx}/car/update.do" ,//url
						                data: field,
						                success: function (data) {
						                
						                    console.log(data);//打印服务端返回的数据(调试用)
						                    if (data.code == 1) {
						                        layer.msg('更新成功', {icon: 6});
						                        table.reload('LAY-user-manage'); //数据刷新
					              				layer.close(e); //关闭弹层
						                    }else{
						                    	layer.msg(data.msg, {icon: 5});
						                    }
						                    table.reload('LAY-user-manage', {
						        		        where: field
						        		      });
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
		    
		    $('.layui-btn.layuiadmin-btn-useradmin').on('click', function(){
		      var type = $(this).data('type');
		      active[type] ? active[type].call(this) : '';
		    });
		  });
	  </script>
  </body>
</html>
