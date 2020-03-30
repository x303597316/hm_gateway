<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/common/head.jsp"%>
<script type="text/javascript" src="${ctx}/static/js/ipconfig.js"></script>
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
          <div class="layui-card-header">数据表格的重载</div>
          <div class="layui-card-body">
            <div class="test-table-reload-btn" style="margin-bottom: 10px;">
				<div class="layui-form-item" style="margin: 0;">
					
					<label class="layui-form-label">模块名称：</label>
					<div class="layui-input-inline" >
						<input class="layui-input" name="div_name" id="div_name" type="text" placeholder="请输入模块名称" />
					</div>
					<label class="layui-form-label">位置：</label>
					<div class="layui-input-inline">
						<input name="div_position" id="div_position" type="hidden" value=""/>
						<select lay-verify="required" lay-search="" lay-filter="div_position" >	
						<option value="">--请选择--</option>
						<option value="0" >上</option>
	            		<option value="1" >中</option>
	            		<option value="2" >下左</option>
	            		<option value="3" >下中</option>
	            		<option value="4" >下右</option>
				        </select>
					</div>
					<label class="layui-form-label">修改时间：</label>
					<div class="layui-input-inline" >
						<input type="text" name="div_updatetime" class="layui-input" id="div_updatetime" placeholder="修改时间："  readonly="readonly"/>
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
  <script type="text/html" id="indexTpl">
    				{{d.LAY_TABLE_INDEX+1}}
				</script>
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
	var div_updatetime = laydate.render({
		elem : '#div_updatetime',
		type : 'date', 
		btns : ['clear','confirm'],
		done : function(value, date) {
			
		}
	});
    //方法级渲染
    table.render({
      elem: '#test-table-reload'
      ,url: '${ctx}/home/getDivList.do'
      ,cols: [[
        {checkbox: true, fixed: true}
       ,{width:'6%', title: '序号', sort: true, align:'center',templet: '#indexTpl'}
	   ,{field:'div_name', width:'10%', title: '名称', align:'center'}
	   ,{field:'div_image', width:'15%', title: '预览图', align:'center',templet:"<div>{{ showImg(d.div_image) }}</div>"}
	   ,{field:'div_position', width:'8%', title: '位置', align:'center'}
	   ,{field:'div_href', width:'8%', title: '链接地址', align:'center'}
	   ,{field:'div_content', width:'8%', title: '模块描述', align:'center'}
	   ,{field:'div_status', width:'8%', title: '状态',  align:'center',templet:'<div>{{ checkStatus(d.div_status) }}</div>'}
	   ,{field:'div_updatetime', title: '修改时间', width:200}
	   ,{align:'center', title: '操作',toolbar : '#tools'}
      ]]
      ,page: true
      ,height: 'full-145'
      ,done: function(res, page, count) {
    	  //类型显示中文名称
    	  $("[data-field='div_position']").children().each(function() {
			if ($(this).text() == 0) {
				$(this).html("<span class='layui-btn layui-btn-success layui-btn-normal layui-btn-xs'>上</span>")
			} else if ($(this).text() == 1) {
				$(this).html("<span class='layui-btn layui-btn-success layui-btn-normal layui-btn-xs'>中</span>")
			} else if ($(this).text() == 2) {
				$(this).html("<span class='layui-btn layui-btn-success layui-btn-normal layui-btn-xs'>下左</span>")
			}else if($(this).text() == 3){
				$(this).html("<span class='layui-btn layui-btn-success layui-btn-normal layui-btn-xs'>下中</span>")
			}else if($(this).text() == 4){
				$(this).html("<span class='layui-btn layui-btn-success layui-btn-normal layui-btn-xs'>下右</span>")
			}
		});
    	  
    	 /*  $("[data-field='div_image']").children().each(function() {
    		  if ($(this).text() == '') {
    			  $(this).html("暂无图片");
    		  }else if($(this).text().indexOf(".")>0){
    			  $(this).html("<img src='"+imagePath+$(this).text()+"' style='width:60px' />");
    		  }
    	  }) */
      }
    });
    
  //事件
    var active = {
      add: function(){
        var index = layer.open({
          type: 2
          ,title: '模块编辑'
          ,content: '${ctx}/home/edit.do'
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
              console.log(field)
              //提交 Ajax 成功后，静态更新表格中的数据
              $.ajax({
	                type: "POST",//方法类型
	                dataType: "json",//预期服务器返回的数据类型
	                url: "${ctx}/home/insertOrUpdate.do" ,//url
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
              div_name: $("#div_name").val()
              ,div_position:$("#div_position").val()
              ,div_updatetime:$("#div_updatetime").val()
          }
        });
       }
    };
    form.on('select(div_position)',function(data){
    	$("#div_position").val(data.value);
    	})
    table.on("tool(test-table-reload)", function(e) {
		e.data;
		if ("edit" === e.event) { 
			var topicEdit = layer.open({
				type : 2,
				title : "模块修改",
				content : "${ctx}/home/divUpdate.do?div_id="+e.data.div_id
				,maxmin: true
		        ,area: ['50%', '100%']
		        ,btn: ['提交','取消']
		         ,yes: function(index, layero){
		           var iframeWindow = window['layui-layer-iframe'+ index]
		          ,submitID = 'LAY-user-front-submit'
		           ,submit = layero.find('iframe').contents().find('#'+ submitID);
		            iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
		              var field = data.field //获取提交的字段
		              //提交 Ajax 成功后，静态更新表格中的数据
		              $.ajax({
			                type: "POST",//方法类型
			                dataType: "json",//预期服务器返回的数据类型
			                url: "${ctx}/home/insertOrUpdate.do" ,//url
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
	                url: "${ctx}/home/deleteDiv.do?div_id="+e.data.div_id,//url
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
  
//显示图片
	function showImg(img){
		if(img!=null && img!=''){
			return "<img style='width:250px;height:35px' src='"+ipconfig().imagePath+img+"'>";
		}else{
			return "";
		}
	}
	function checkStatus(status){
		if(parseInt(status)==0){
			return "<span style='color:#00cc66'>启用</span>";
		}else{
			return "<span style='color:red'>禁用</span>";
		}
	}
  </script>
</body>
</html>