<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/common/head.jsp"%>
	<style type="text/css">
		.layui-table-cell{
		    height:35px;
		    line-height: 35px;
		}
	</style>
	<script type="text/javascript" src="${ctx}/static/js/ipconfig.js"></script>
</head>

<body>
	<div class="layui-fluid">
	<div class="layui-row layui-col-space15">
	<div class="layui-card layui-form">
	          <div class="layui-card-header">数据表格的重载</div>
	          <div class="layui-card-body">
	            <div class="test-table-reload-btn" style="margin-bottom: 10px;">
					<div class="layui-form-item" style="margin: 0;">
						
						<label class="layui-form-label" style="width:115px;">轮播图名称：</label>
						<div class="layui-input-inline" >
							<input class="layui-input" name="banner_name" id="banner_name" type="text" placeholder="请输入轮播图名称" />
						</div>
						
						<label class="layui-form-label">创建时间：</label>
						<div class="layui-input-inline" >
							<input type="text" name="createtime" class="layui-input" id="createtime" placeholder="创建时间" readonly="readonly" />
						</div>
						
		              <button class="layui-btn" data-type="search">搜索</button>
		              <button class="layui-btn layuiadmin-btn-useradmin" data-type="add">添加</button>
					</div>
	            </div>
	            <table id="myTable" lay-filter="myTable"></table> 
	          </div>
	        </div>
				<script type="text/html" id="indexTpl">
    				{{d.LAY_TABLE_INDEX+1}}
				</script>
				<script type="text/html" id="toolTpl">
             		<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="update"><i class="layui-icon layui-icon-edit"></i>编辑</a>
            	    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon layui-icon-delete"></i>删除</a>
                </script>
			</div>
		</div>
	
	<%@ include file="/static/common/footer.jsp"%>
	
<script type="text/javascript">

//var imagePath = "http://"+ window.location.host+"/download/gateway/banner";
	layui.config({
		base:'${ctx}/static/layuiadmin/'	//静态资源所在路径
	}).extend({
		index:'lib/index'					//主入口模块
	}).use(['index','table','laydate'],function(){
		var $=layui.$;
		var table=layui.table;
		var form=layui.form;
		var laydate = layui.laydate,t;
		 var createtime = laydate.render({
				elem : '#createtime',
				type : 'date', 
				btns : ['clear','confirm'],
				done : function(value, date) {
					
				}
			});
		t={
				   id:'myTable',
				   elem: '#myTable'
				   ,url:'${ctx}/firstpage/getBannerList.do'
				   ,cellMinWidth: 80 	//全局定义常规单元格的最小宽度
				   ,page: true	
				   ,height: 'full-145'
				   ,cols: [[
					 {type : "checkbox",fixed : "left"}
				     ,{width:'6%', title: '序号', sort: true, align:'center',templet: '#indexTpl'}
				     ,{field:'banner_name', width:'10%', title: '名称', align:'center'}
				     ,{field:'banner_image', width:'15%', title: '预览图', align:'center',templet:"<div>{{ showImg(d.banner_image) }}</div>"}
				     ,{field:'banner_sort', width:'8%', title: '排序数字',sort:true, align:'center'}
				     ,{field:'createtime', width:'13%', title: '创建时间', align:'center'}
				     ,{field:'banner_status', width:'8%', title: '状态', sort: true, align:'center',templet:'<div>{{ checkStatus(d.banner_status) }}</div>'}
				     ,{title: '操作', align:'center', toolbar : '#toolTpl'}
				   ]]
			}
		table.render(t);
		//条件查询
		form.on('submit(LAY-user-front-search)',function(e){
			//表格重载
			table.reload('myTable',t);
		});
		
		
		//table上绑定事件
		table.on('tool(myTable)',function(e){
			var banner_id=e.data.banner_id;
			var banner_name=e.data.banner_name;
			var banner_image='';
			if(e.data.banner_image!='undefined' && e.data.banner_image!=undefined){
				banner_image=e.data.banner_image;
			}
			var banner_sort=e.data.banner_sort;
			var banner_status=e.data.banner_status;
			if(e.event=='update'){
				//iframe窗
				var myEdit=layer.open({
				      type: 2,
				      title: '编辑轮播图',
				      shadeClose: true,
				      shade: false,
				      maxmin: true, 	//开启最大化最小化按钮
				      area: ['50%','100%'],
				      offset: 'auto',	//位置垂直水平居中
				      content: '${ctx}/firstpage/bannerUpdate.do?banner_id='+banner_id,
				      btn: ['确定', '取消'],
				      isOutAnim:true,	//关闭动画，默认开启
				      yes: function(index, layero){	//确定按钮回调函数
				    	  var iframeWindow = window['layui-layer-iframe'+ index]
				            ,submitID = 'LAY-user-front-submit'
				            ,submit = layero.find('iframe').contents().find('#'+ submitID);
				            //监听提交
				            iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
				              var field = data.field; //获取提交的字段
				              console.log(field)
				    	  		$.ajax({
				    	  			url:'${ctx}/firstpage/insertOrUpdate.do',
				    	  			data:field,
				    	  			dataType:'json',
				    	  			type:'post',
				    	  			async:true,
				    	  			success:function(res){
				    	  				if(res.code==0){
				    	  					layer.close(index); 	//关闭窗口
				    	  					table.reload('myTable',t);	//表格重载
				    	  					layer.msg(res.msg,{'icon':1,'time':3000});
				    	  				}else{
				    	  					layer.msg(res.msg,{'icon':2,'time':3000});
				    	  				}
				    	  			},
				    	  			error:function(){
				    	  				layer.msg('系统错误',{'icon':2,'time':3000});
				    	  			}
				    	  		});
				    	  		return false;
				    	    });
				    	  	submit.trigger('click');	
				    	  }		
				    });
					layer.full(myEdit);	//窗口最大化
			} else if(e.event=='del'){
		                		layer.confirm('确认删除吗？', {
		                		  btn: ['确定','取消']
			                		}, function(){
			                			$.ajax({
			                				url:'${ctx}/firstpage/deleteBannerById.do',
			                				data: {"banner_id":banner_id},
			                				dataType:'json',
			                				type:'post',
			                				success:function(res){
			                					if(res.code==0){
			                						table.reload('myTable',t);		//表格重载
			                						layer.msg(res.msg,{'icon':1,'time':3000});
			                					}else{
			                						layer.msg(res.msg,{'icon':2,'time':3000});
			                					}
			                				},
			                				error:function(){
			                					layer.msg('系统错误',{'icon':2,'time':3000});
			                				}
			                			});
		                		});
		                }
		});		
		
		//事件
	    var active = {
	      add: function(){
	        var index = layer.open({
	          type: 2
	          ,title: '页面编辑'
	          ,content: '${ctx}/firstpage/edit.do'
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
	              //提交 Ajax 成功后，静态更新表格中的数据
	              $.ajax({
		                type: "POST",//方法类型
		                dataType: "json",//预期服务器返回的数据类型
		                url: "${ctx}/firstpage/insertOrUpdate.do" ,//url
		                data:field,
		                success: function (data) {
		                    if (data.code == 0) {
		                        layer.msg(data.msg, {'icon': 1,'time':3000});
		                        table.reload('myTable',t); //数据刷新
	              				layer.close(index); //关闭弹层
		                    }else{
		                    	layer.msg(data.msg, {'icon': 2,'time':3000});
		                    }
		                },
		                error : function() {
		                    layer.msg('系统错误', {'icon': 2,'time':3000});
		                }
		            });
	              table.reload('myTable',t); //数据刷新
	              layer.close(index); //关闭弹层
	            });  
	            submit.trigger('click');
	          }
	        }); 
	        layer.full(index);
	      }
	  ,search: function(){
	        //执行重载
	        table.reload('myTable', {
	          page: {
	            curr: 1 //重新从第 1 页开始
	          }
	          ,where: {
	        	  banner_name: $("#banner_name").val()
	              ,createtime:$("#createtime").val()
	          }
	        });
	  }
	    };
		$('.test-table-reload-btn .layui-btn').on('click', function(){
		      var type = $(this).data('type');
		      active[type] ? active[type].call(this) : '';
		    });
	});
	
	
	//显示图片
	function showImg(img){
		if(img!=null && img!=''){
			
			console.log(ipconfig().imagePath)
			if(isImage(img)){
				return "<img style='width:250px;height:40px' src='"+ipconfig().imagePath+img+"'>";
			}else{
				return "<video style='height:40px' type='video/mp4' controls='controls'   src='"+ipconfig().imagePath+img+"'>";
			}
		}else{
			return "";
		}
	}
	 function isImage(str){
     	var strArray = [ "bmp","dib","gif","jfif","jpe","jpeg","jpg","png","tif","tiff","ico"];
     	if(str){
     		for(var i =0;i<strArray.length;i++){
     			if(str.indexOf(strArray[i]) != -1){
     				return true;
     			}
     		}
     	}else{
     		return false;
     	}
     	return false;
     }
	//轮播状态
	function checkStatus(status){
		if(parseInt(status)==1){
			return "<span style='color:#00cc66'>启用</span>";
		}else{
			return "<span style='color:red'>禁用</span>";
		}
	}
			
</script>	
	
	
</body>
</html>