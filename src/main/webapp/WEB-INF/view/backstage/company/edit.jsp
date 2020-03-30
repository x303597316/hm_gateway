<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <%@ include file="/static/common/w-head.jsp"%>
    <style>
  		.layui-upload-img{width: 92px; height: 92px; margin: 0 10px 10px 0;}
  	</style>
  	
  </head>
  
  <body>
        <div class="layui-fluid">
    <div class="layui-card">
      <div class="layui-card-header">页面设置</div>
      <div class="layui-card-body" style="padding: 15px;">
        <form class="layui-form" action="" lay-filter="component-form-group">
          <div class="layui-form-item">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-block">
              <input type="text" name="sectionname" lay-verify="required" value="${entity.sectionname }" autocomplete="off" placeholder="请输入标题" class="layui-input">
            </div>
          </div>
          
          <div class="layui-form-item">
          
          <label class="layui-form-label">页面内容</label>
            <div class="layui-input-block">
            <blockquote class="site-text layui-elem-quote">
		      <p>提示：<em>富文本编辑器中请不要单独添加一个视频作为内容，请附加文本后再提交，否则不能保存信息</em></p>
		    </blockquote>
          		<TEXTAREA id="myEditor"  style="width:99.8%;height:700px;margin:auto;" >${entity.companyintroduction}</TEXTAREA>  
		       	<script type=text/javascript>  
		            
		            
		            //1.2.4以后可以使用一下代码实例化编辑器 
		            //UE.getEditor('myEditor') 
		       	</script>
          		
          	</div>
          </div> 
          
          <div class="layui-form-item layui-hide">
            <div class="layui-input-block">
              <div class="layui-footer" style="left: 0;">
                <button class="layui-btn" lay-submit lay-filter="LAY-user-front-submit" id="LAY-user-front-submit">立即提交</button>
                <input type="text" name="titleimage" id="titleimage" value="${entity.titleimage }"/>
                <input type="text" name="companyintroduction" id="companyintroduction" value="${entity.companyintroduction }"/>
                <input type="text" name="id" value="${entity.id }" >
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
<%@ include file="/static/common/footer.jsp"%>  
<!--编辑器基本配置-->
<script type="text/javascript" src="${ctx}/static/plugins/ueditor/ueditor.config.js"></script>
<!--编辑器完整代码-->
<script type="text/javascript" src="${ctx}/static/plugins/ueditor/ueditor.all.js"> </script >
  <script type="text/javascript">
  window.location.reload;
  var editor = new UE.ui.Editor();  
  editor.render("myEditor");  
  editor.addListener('blur',function(){
	
	  console.log(editor.getContent());
	  $("#companyintroduction").val(editor.getContent());
	  });
  layui.config({
    base: '${ctx}/static/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'table','laydate','form','upload','layedit'], function(){
    var $ = layui.$
    ,form = layui.form
    ,laydate = layui.laydate
    ,upload = layui.upload
    ,table = layui.table
    ,layedit = layui.layedit;
    
    layedit.set({
    	  uploadImage: {
    	    url: '${ctx}/uploadFile.do' //接口url
    	    ,type: 'post' //默认post
    	  }
    	});
    layedit.build('demo'); //建立编辑器
    
  //普通图片上传
    var uploadInst = upload.render({
      elem: '#test-upload-normal'
      ,url: '${ctx}/uploadFile.do'
      ,before: function(obj){
        //预读本地文件示例，不支持ie8
        obj.preview(function(index, file, result){
          $('#test-upload-normal-img').attr('src', result); //图片链接（base64）
        });
      }
      ,done: function(res){
        if(res.code==0){
        	//上传成功
        	$("#titleimage").val(res.filesPath[0]);
        	return layer.msg('上传成功');
        }else{
        	//如果上传失败
          return layer.msg('上传失败');
        }
        
      }
      ,error: function(){
        //演示失败状态，并实现重传
        var demoText = $('#test-upload-demoText');
        demoText.html('<span style="color: #FF5722;">上传失败</span><a class="layui-btn layui-btn-mini demo-reload">重试</a>');
        demoText.find('.demo-reload').on('click', function(){
          uploadInst.upload();
        });
      }
    });
	
    
  

    
    form.render(null, 'component-form-group');

    laydate.render({
      elem: '#LAY-component-form-group-date'
    });
    
    
    
  });
  
  
  </script>
   
</body>
</html>

  
    
