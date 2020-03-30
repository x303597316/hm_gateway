<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML>
<html>
  <head>
    <%@ include file="/static/common/w-head.jsp"%>
    <style>
  .layui-upload-img{width: 92px; height: 92px; margin: 0 10px 10px 0;}
  </style>
  <!--编辑器基本配置-->
<!--  charset="gbk" -->
<script type="text/javascript" src="${ctx}/static/plugins/ueditor/ueditor.config.js"></script>
<!--编辑器完整代码-->
<script type="text/javascript" src="${ctx}/static/plugins/ueditor/ueditor.all.js"> </script >
  </head>
  <body>
        <div class="layui-fluid">
    <div class="layui-card">
      <div class="layui-card-header">资料文件编辑</div>
      <div class="layui-card-body" style="padding: 15px;">
        <form class="layui-form" action="" lay-filter="component-form-group">
          <input type="text" name="id" class="layui-hide" value="${entity.id}" autocomplete="off" class="layui-input">
          <div class="layui-form-item">
            <label class="layui-form-label">资料名称</label>
            <div class="layui-input-block">
              <input type="text" name="paperName" lay-verify="required" autocomplete="off" value="${entity.paperName }" placeholder="请输入标题" class="layui-input">
            </div>
          </div>


          <div class="layui-form-item" id="uploaddiv">
			<div class="layui-upload" style="float: left">
				<label class="layui-form-label">上传</label>
				<input class="layui-input" type="hidden" name="paperUrl" id="paperUrl" class="layui-input" value="${entity.paperUrl}">
				<button type="button" class="layui-btn" id="test3"><i class="layui-icon"></i>上传文件</button>
				<%-- <div class="layui-upload-list" style="margin:25px 25px 5px 110px">
							<video style="width: 150px; height: 150px" id="videourl_video" src="${imgPath}${entity.videourl}"></video>
					<p id="msgText"></p>
				</div> --%>
			</div>
		  </div>
          <div class="layui-form-item" id="paperSize">
            <label class="layui-form-label">文件大小</label>
            <div class="layui-input-block">
              <input type="text" name="paperSize"  autocomplete="off" value="${entity.paperSize }" readOnly class="layui-input">
            </div>
          </div>
          <div class="layui-form-item" id="paperType">
            <label class="layui-form-label">文件类型</label>
            <div class="layui-input-block">
              <input type="text" name="paperType"  autocomplete="off" value="${entity.paperType }" readOnly class="layui-input">
            </div>
          </div>
          
          <div class="layui-form-item" id="details">
            <label class="layui-form-label">详情</label>
            <div class="layui-input-block">
            	<textarea name="introduce" placeholder="请输入概述"  class="layui-textarea">${entity.introduce }</textarea>
            </div>
          </div>

          <div class="layui-form-item layui-hide">
            <div class="layui-input-block">
              <div class="layui-footer" style="left: 0;">
                <button class="layui-btn" lay-submit lay-filter="LAY-user-front-submit" id="LAY-user-front-submit">立即提交</button>
                <input type="text" name="type" id="type" value="${entity.type}"/>
                <input type="text" name="parperContent" id="parperContent" value='${entity.parperContent}'/>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
<%@ include file="/static/common/footer.jsp"%>  
<c:if test="${entity.type eq '3'}">
     <script type="text/javascript">
     	$("#uploaddiv").hide();
      	$("#myeditor").show();
      	$("#papersize").hide();
		$("#papertype").hide();
		$("#details").hide();
   	</script>
</c:if>
<c:if test="${entity.type eq '1' or entiy.type eq '2'}">
     <script type="text/javascript">
      	$("#myeditor").hide();
      	$("#papersize").show();
		$("#papertype").show();
		$("#uploaddiv").show();
		$("#details").show();
   	</script>
</c:if>
  <script>
  window.location.reload;
  var editor = new UE.ui.Editor();  
  editor.render("myEditor");  
  editor.addListener('blur',function(){
	  $("#parperContent").val(editor.getContent());
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
    ,table = layui.table;
    
  //文件上传
  //指定允许上传的文件类型
  upload.render({
    elem: '#test3'
    ,url: '${ctx}/uploadFile.do'
    ,accept: 'file' //普通文件
    ,done: function(res){
      console.log(res)
      if(res.code == 0){
  		var urlPaper = res.filesPath[0];
  		$("#paperUrl").val(urlPaper);
  		$("input[name='paperType']").val(res.suffix);
  		$("input[name='paperSize']").val(res.size+"kb");
  	}
    }
  });
  //普通图片上传
    var uploadInst = upload.render({
      elem: '#test-upload-normal'
      ,url: '${ctx}/Menu/uploadImage.do'
      ,before: function(obj){
        //预读本地文件示例，不支持ie8
        obj.preview(function(index, file, result){
          $('#test-upload-normal-img').attr('src', result); //图片链接（base64）
        });
      }
      ,done: function(res){ 
        if(res.code==0){
        	//上传成功
        	$("#imgurl").val(res.data.src);
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
	
    

    
    /* form.on('switch(status)',function(data){
    	if(data.elem.checked){
    		$("#status").val(1);
    	}else{
    		$("#status").val(0);
    	}
    }); 
    form.render(null, 'component-form-group');*/

    laydate.render({
      		elem: '#LAY-component-form-group-date'
    	  	,type : 'datetime'
    });
    
    form.on('select(newsType)',function(data){
    	$("#type").val(data.value);
    	if(data.value=='3'){
    		$("#myeditor").show();
    		$("#papersize").hide();
    		$("#papertype").hide();
    		$("#uploaddiv").hide();
    		$("#details").hide();
    	}else{
    		$("#myeditor").hide();
    		$("#papersize").show();
    		$("#papertype").show();
    		$("#uploaddiv").show();
    		$("#details").show();
    	}
    	})
    
  });
  </script>
   
</body>
</html>

  
    
