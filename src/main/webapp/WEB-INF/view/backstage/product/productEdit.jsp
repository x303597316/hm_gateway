<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML>
<html>
  <head>
    <%@ include file="/static/common/w-head.jsp"%>
    <style>
  .layui-upload-img{width: 92px; height: 92px; margin: 0 10px 10px 0;}
  </style>
  <!--编辑器基本配置-->
<script type="text/javascript" src="${ctx}/static/plugins/ueditor/ueditor.config.js"></script>
<!--编辑器完整代码-->
<script type="text/javascript" src="${ctx}/static/plugins/ueditor/ueditor.all.js"> </script >
  </head>
  
  <body>
        <div class="layui-fluid">
    <div class="layui-card">
      <div class="layui-card-body" style="padding: 15px;">
        <form class="layui-form" action="" lay-filter="component-form-group">
          <div class="layui-form-item">
	          <label class="layui-form-label">父级名称</label>
	          <div class="layui-input-block">
	            <input type="text" value="${parentName }" autocomplete="off" placeholder="请输入标题" class="layui-input" readOnly>
	          </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">产品名称</label>
            <div class="layui-input-block">
              <input type="text" name="productname" lay-verify="required" value="${entity.productname }" autocomplete="off" placeholder="请输入标题" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">产品概述：</label>
            <div class="layui-input-block">
            	<textarea name="describe" placeholder="请输入概述"  class="layui-textarea">${entity.describe }</textarea>
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">主要特点：</label>
            <div class="layui-input-block">
            	<textarea name="point" placeholder="请输入特点"  class="layui-textarea">${entity.point }</textarea>
            </div>
          </div>
          <div class="layui-form-item">
	          <div class="layui-form-label">标题图片</div>
	            <div class="layui-input-block">
	              <button type="button" class="layui-btn" id="test-upload-normal">上传图片</button>
	              <div class="layui-upload-list">
	                <img class="layui-upload-img" id="test-upload-normal-img" >
	                <p id="test-upload-demoText"></p>
	                
	              </div>
	            </div> 
	      </div>
          <div class="layui-form-item">
          <label class="layui-form-label">页面内容</label>
            <div class="layui-input-block">
            	<blockquote class="site-text layui-elem-quote">
			      <p>提示：<em>富文本编辑器中请不要单独添加一个视频作为内容，请附加文本后再提交，否则不能保存信息</em></p>
			    </blockquote>
          		<TEXTAREA id="myEditor" style="width:99.8%;height:700px;margin:auto;" >${entity.summary}</TEXTAREA>  
          	</div>
          </div> 
          
          <div class="layui-form-item layui-hide">
            <div class="layui-input-block">
              <div class="layui-footer" style="left: 0;">
                <button class="layui-btn" lay-submit lay-filter="LAY-user-front-submit" id="LAY-user-front-submit">立即提交</button>
                <input type="text" name="img" id="img" value="${entity.img }"/>
                <input type="text" name="summary" id="summary" value='${entity.summary }'/>
                <input type="text" name="parentid" value="${entity.parentid }" >
                <input type="text" name="id" value="${entity.id }" >
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
<%@ include file="/static/common/footer.jsp"%>  
  <script>
  window.location.reload;
  var editor = new UE.ui.Editor();  
  editor.render("myEditor");  
  editor.addListener('blur',function(){
	  $("#summary").val(editor.getContent());
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
        	$("#img").val(res.filesPath2[0]);
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
	
    
  //多图片上传
    upload.render({
      elem: '#test-upload-more'
      ,url: '${ctx}/uploadFile.do'
      ,multiple: true
      ,before: function(obj){
        //预读本地文件示例，不支持ie8
        obj.preview(function(index, file, result){
          $('#test-upload-more-list').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
        });
      }
      ,done: function(res){
        //上传完毕
    	  if(res.code==0){
          	//上传成功
          	return layer.msg('上传成功');
          }else{
          	//如果上传失败
            return layer.msg('上传失败');
          }
      }
    });

    
    form.on('switch(status)',function(data){
    	if(data.elem.checked){
    		$("#status").val(1);
    	}else{
    		$("#status").val(0);
    	}
    });
    form.render(null, 'component-form-group');

    laydate.render({
      elem: '#LAY-component-form-group-date'
    });
    
    /* 自定义验证规则 */
    form.verify({
      title: function(value){
        if(value.length < 5){
          return '标题至少得5个字符啊';
        }
      }
      ,pass: [/(.+){6,12}$/, '密码必须6到12位']
      ,content: function(value){
        layedit.sync(editIndex);
      }
    });
    
    /* 监听提交 */
    form.on('submit(component-form-demo1)', function(data){
      parent.layer.alert(JSON.stringify(data.field), {
        title: '最终的提交信息'
      })
      return false;
    });
    
  });
  
  
  </script>
   
</body>
</html>

  
    
