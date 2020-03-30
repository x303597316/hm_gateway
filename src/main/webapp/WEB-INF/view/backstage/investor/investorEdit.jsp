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
      <div class="layui-card-body" style="padding: 15px;">
        <form class="layui-form" action="" lay-filter="component-form-group">
          <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block">
              <input type="text" name="contentname" lay-verify="required" autocomplete="off" value="${entity.contentname }" placeholder="请输入标题" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">时间</label>
            <div class="layui-input-block">
              <input type="text" name="createtime" id="LAY-component-form-group-date" value="${entity.createtime }" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">发布类型</label>
            <div class="layui-input-block">
            	<select lay-verify="required" lay-filter="contentType" lay-search="" >
            		<option value="1" <c:if test="${entity.type eq '1' }">checked</c:if>>暂存</option>
            		<option value="2" <c:if test="${entity.type eq '2' }">checked</c:if>>定期报告</option>
            		<option value="3" <c:if test="${entity.type eq '3' }">checked</c:if>>公告</option>
            		<option value="4" <c:if test="${entity.type eq '4' }">checked</c:if>>制度</option>
            	</select>
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">详情：</label>
            <div class="layui-input-block">
            	<textarea rows="5"  maxlength="100" onchange="this.value=this.value.substring(0, 100)" onkeydown="this.value=this.value.substring(0, 100)" onkeyup="this.value=this.value.substring(0, 100)" name="details" placeholder="最多可输入100字"  class="layui-textarea">${entity.details }</textarea>
            </div>
          </div>
          <div class="layui-form-item">
	          <div class="layui-form-label">标题图片</div>
	            <div class="layui-input-block">
	              <button type="button" class="layui-btn" id="test-upload-normal">上传图片</button>
	              <div class="layui-upload-list">
	                <img class="layui-upload-img" id="test-upload-normal-img" <c:if test="${!empty entity.titleimg}">src='${entity.titleimg}'</c:if>>
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
          		<TEXTAREA id="myEditor"  style="width:99.8%;height:700px;margin:auto;" >${entity.textcontent}</TEXTAREA>  
          	</div>
          </div> 
          <div class="layui-form-item layui-hide">
            <div class="layui-input-block">
              <div class="layui-footer" style="left: 0;">
                <button class="layui-btn" lay-submit lay-filter="LAY-user-front-submit" id="LAY-user-front-submit">立即提交</button>
                <input type="text" name="titleimg" id="titleimg" value="${entity.titleimg}"/>
                <input type="text" name="textcontent" id="textcontent" value='${entity.textcontent}'/>
                <input type="text" name="type" id="type" value="${entity.type}"/>
                
                <input type="text" name="id" value="${entity.id}"/>
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
	  $("#textcontent").val(editor.getContent());
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
        	$("#titleimg").val(res.filesPath2[0]);
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
	
    laydate.render({
      		elem: '#LAY-component-form-group-date'
    	  	,type : 'datetime'
    });
    
    form.on('select(contentType)',function(data){
    	$("#type").val(data.value);
    	})
    
    
  });
  </script>
   
</body>
</html>

  
    
