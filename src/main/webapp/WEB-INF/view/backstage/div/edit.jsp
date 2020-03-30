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
      <div class="layui-card-header">模块编辑</div>
      <div class="layui-card-body" style="padding: 15px;">
        <form class="layui-form" action="" lay-filter="component-form-group">
          <div class="layui-form-item">
            <label class="layui-form-label">模块标题</label>
            <div class="layui-input-block">
              <input type="text" name="div_name" lay-verify="required" autocomplete="off" value="${entity.div_name }" placeholder="请输入模块名称" class="layui-input">
            </div>
          </div>
          <%-- <div class="layui-form-item">
            <label class="layui-form-label">修改时间</label>
            <div class="layui-input-block">
              <input type="text" name="div_updatetime" id="LAY-component-form-group-date" value="${entity.div_updatetime }" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
            </div>
          </div> --%>
          <div class="layui-form-item">
            <label class="layui-form-label">模块位置</label>
            <div class="layui-input-block">
            	<select lay-verify="required" lay-filter="postionFilter" lay-search="" >
            	    <option value="" >请选择</option>
            		<option value="0" <c:if test="${entity.div_position eq '0' }">selected</c:if> >上</option>
            		<option value="1" <c:if test="${entity.div_position eq '1' }">selected</c:if> >中</option>
            		<option value="2" <c:if test="${entity.div_position eq '2' }">selected</c:if> >下左</option>
            		<option value="3" <c:if test="${entity.div_position eq '3' }">selected</c:if> >下中</option>
            		<option value="4" <c:if test="${entity.div_position eq '4' }">selected</c:if> >下右</option>
            	</select>
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">是否启用</label>
            <div class="layui-input-block">
            <input type="radio" name="div_status" value="0" <c:if test="${(empty entity.div_status) || entity.div_status eq '0'}">checked</c:if> title="启用">
              <input type="radio" name="div_status" value="1" title="禁用" <c:if test="${entity.div_status eq '1'}">checked</c:if>>
            
            </div>
          </div>
          
          <div class="layui-form-item">
            <label class="layui-form-label">模块路径</label>
            <div class="layui-input-block">
              <input type="text" name="div_href" lay-verify="required" autocomplete="off" value="${entity.div_href}" placeholder="请输入模块路径" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
	          <div class="layui-form-label">模块图片</div>
	            <div class="layui-input-block">
	              <button type="button" class="layui-btn" id="test-upload-normal">上传图片</button>
	              <div class="layui-upload-list">
	                <img class="layui-upload-img"  id="test-upload-normal-img" <c:if test="${!empty entity.div_image}">src=${imagePath}/gateway/banner${entity.div_image}</c:if>>
	                <p id="test-upload-demoText"></p>
	              </div>
	            </div> 
	      </div>
          <div class="layui-form-item">
            <label class="layui-form-label">模块内容</label>
            <div class="layui-input-block">
            	<textarea name="div_content" placeholder="请输入模块内容"  class="layui-textarea">${entity.div_content }</textarea>
            </div>
          </div>
          <div class="layui-form-item layui-hide">
            <div class="layui-input-block">
              <div class="layui-footer" style="left: 0;">
                <button class="layui-btn" lay-submit lay-filter="LAY-user-front-submit" id="LAY-user-front-submit">立即提交</button>
                <input type="text" name="div_image" id="div_image" lay-filter ="verifyImg"  value="${entity.div_image}"/>
                <%-- <input type="text" name="div_name" id="div_name" value="${entity.div_name}"/> --%>
                 <%-- <input type="text" name="div_status" id="div_status" value="${entity.div_status}"/>  --%>
                <%-- <input type="text" name="div_content" id="div_content" value="${entity.div_content}"/> --%>
                <input type="text" name="div_position" id="div_position" value="${entity.div_position}"/>
               <%--  <input type="text" name="div_href" id="div_href" value="${entity.div_href}"/> --%>
                <input type="text" name="div_id" value="${entity.div_id}"/>
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
      ,url: '${ctx}/uploadFile.do?path=gateway/banner'
      ,before: function(obj){
        //预读本地文件示例，不支持ie8
        obj.preview(function(index, file, result){
          $('#test-upload-normal-img').attr('src', result); //图片链接（base64）
        });
      }
      ,done: function(res){
        if(res.code==0){
        	//上传成功
        	$("#div_image").val(res.filesPath2);
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
      ,url: '${ctx}/Menu/uploadImage.do'
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
    laydate.render({
      		elem: '#LAY-component-form-group-date'
    	  	,type : 'datetime'
    });
    form.render('select');
    form.on('select(postionFilter)',function(data){
    	$("#div_position").val(data.value);
    	})
     form.on('select(statusFilter)',function(data){
    	$("#div_status").val(data.value);
    	})	
    	/* form.verify({
    		//验证图片
    		 verifyImg:function(value){
    			var imgIsOrNo = $("#div_image").value();
    			if(value==null || value.trim().length==0){
    					return '请上传图片';
    			}
    		} 
    	}); */
  });
  </script>
   
</body>
</html>

  
    
