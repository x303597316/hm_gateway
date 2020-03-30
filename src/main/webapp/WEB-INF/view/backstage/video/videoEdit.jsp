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
<%-- <script type="text/javascript" src="${ctx}/static/plugins/ueditor/ueditor.all.js"> </script > --%>
  </head>
  
  <body>
        <div class="layui-fluid">
    <div class="layui-card">
      <div class="layui-card-body" style="padding: 15px;">
        <form class="layui-form" action="" lay-filter="component-form-group">
        	<input type="text" name="id" class="layui-hide" value="${entity.id}" autocomplete="off" class="layui-input">
          <div class="layui-form-item">
            <label class="layui-form-label">视频名称</label>
            <div class="layui-input-block">
              <input type="text" name="videoname" value="${entity.videoname}" lay-verify="required" autocomplete="off" value="" placeholder="请输入标题" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">视频介绍</label>
            <div class="layui-input-block">
              <input type="text" name="introduce" value="${entity.introduce}" lay-verify="required" autocomplete="off" value="" placeholder="请输入标题" class="layui-input">
            </div>
          </div>
	      <!-- <button type="button" class="layui-btn" id="test5"><i class="layui-icon"></i>上传视频</button> -->
	      <div class="layui-form-item">
			<div class="layui-upload" style="float: left">
				<label class="layui-form-label">视频上传</label>
				<input class="layui-input" type="hidden" name="videourl" id="videourl" class="layui-input" value="${entity.videourl}">
				<button type="button" class="layui-btn" style="margin-left: 30px" id="test5">上传</button>
				<div class="layui-upload-list" style="margin:25px 25px 5px 110px">
							<video style="width: 150px; height: 150px" id="videourl_video" src="${imgPath}${entity.videourl}"></video>
					<p id="msgText"></p>
				</div>
			</div>
		</div>
          <%-- <div class="layui-form-item">
          <label class="layui-form-label">页面内容</label>
            <div class="layui-input-block">
          		<TEXTAREA id="myEditor"  style="width:99.8%;height:700px;margin:auto;" >${entity.content}</TEXTAREA>  
          	</div>
          </div>  --%>
          <div class="layui-form-item layui-hide">
            <div class="layui-input-block">
              <div class="layui-footer" style="left: 0;">
                <button class="layui-btn" lay-submit lay-filter="LAY-user-front-submit" id="LAY-user-front-submit">立即提交</button>
                <%-- <input type="text" name="imgurl" id="imgurl" value="${entity.imgurl}"/>
                <input type="text" name="content" id="content" value="${entity.content}"/>
                <input type="text" name="type" id="type" value="${entity.type}"/>
                <input type="text" name="id" value="${entity.id}"/> --%>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
<%@ include file="/static/common/footer.jsp"%>  
  <script>
  /* var editor = new UE.ui.Editor();
  editor.render("myEditor");  
  editor.addListener('blur',function(){
	  $("#content").val(editor.getContent());
	  }); */
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
   
  //视频上传
  upload.render({
    elem: '#test5'
    ,url: '${ctx}/uploadFile.do'
    ,accept: 'video' //视频
    ,done: function(res){
    	if(res.code == 0){
    		
    		var urlVideo = res.filesPath[0];
    		console.log(urlVideo);
    		$("#videourl").val(urlVideo);
    		$("#videourl_video").attr("src","${imgPath}/"+urlVideo);
    	}
    }
  });
  //普通图片上传
    var uploadInst = upload.render({
      elem: '#test-upload-normal'
      ,url: '${ctx}/uploadFile.do'
      ,before: function(obj){
        //预读本地文件示例，不支持ie8
        obj.preview(function(index, file, result){
          $('#test-upload-normal-video').attr('src', result); //图片链接（base64）
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
  
  //缩略图上传
	var uploadImgage = upload.render({
		elem : '#uploadImage',
		url : '${ctx}/uploadFile.do',
		before : function(obj) {
			//预读本地文件示例，不支持ie8
			obj.preview(function(index, file,result) {
				$('#videourl').attr('src',result); //图片链接（base64）
			});
		},
		done : function(res) {
			//如果上传失败
			if (res.code > 0) {
				return layer.msg('上传失败', {'icon' : 2,'time' : 3000});
			}
			//上传成功
			$("input[name='videourl']").val(res.filesPath[0]);
		},
		error : function() {
			//演示失败状态，并实现重传
			var msgText = $('#msgText');
			msgText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
			msgText.find('.demo-reload').on('click', function() {
				uploadImgage.upload();
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
    	})
    
    /* 自定义验证规则 */
    /* form.verify({
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
    /*form.on('submit(component-form-demo1)', function(data){
      parent.layer.alert(JSON.stringify(data.field), {
        title: '最终的提交信息'
      })
      return false;
    }); */
  });
  </script>
   
</body>
</html>

  
    
