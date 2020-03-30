<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/static/common/head.jsp"%>
	<script type="text/javascript" src="${ctx}/static/js/ipconfig.js"></script>
</head>

<body>
	<div class="layui-card" style="padding:10px">
		<form class="layui-form">
		
			<div class="layui-form-item">
				<input class="layui-input" style="width:45%" type="hidden" name="banner_id" class="layui-input" value="${entity.banner_id}" readonly>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">轮播图名称</label>
				<div class="layui-input-block">
					<input type="text" class="layui-input" style="width:45%;float:left" lay-verify="verifyName" name="banner_name" value="${entity.banner_name}" >
					<span style="line-height:38px;margin:15px;color:red">*必填：请填写轮播图名称</span>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">排序数字</label>
				<div class="layui-input-block">
					<input type="number" class="layui-input" style="width:45%;float:left" name="banner_sort" lay-verify="verifySort" placeholder="请填写排序数字" value="${entity.banner_sort}">
					<span style="line-height:38px;margin:15px;color:red">选填：整数，数值越小排序越靠前，留空默认为0</span>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">轮播状态</label>
				<div class="layui-input-block" style="width:41.8%;">
					<select name="banner_status" lay-verify="required"  lay-filter="banner_status" lay-search="">
						<option value="1" <c:if test="${entity.banner_status eq 1 }">checked</c:if>>启用</option>
						<option value="0" <c:if test="${entity.banner_status eq 0 }">checked</c:if>>禁用</option>
					</select>
				</div>
			</div>
			
			<div class="layui-form-item">
				<div id="imagediv" class="layui-upload" style="float: left">
					<label class="layui-form-label">选择图片</label>
					<input class="layui-input" type="hidden" name="banner_image" class="layui-input" lay-verify="verifyImg" value="${entity.banner_image}">
					<button type="button" class="layui-btn" style="margin-left: 30px" id="uploadImg">上传图片</button>
					<div class="layui-upload-list" style="margin:25px 25px 5px 110px">
							<c:if test="${empty entity.banner_image or !isimage}">
								<img style="width: 150px; height: 150px" id="banner_image">
							</c:if>
							<c:if test="${isimage}">
								<img style="width: 150px; height: 150px" id="banner_image" src="${imagePath}/gateway/banner${entity.banner_image}">
							</c:if>
						<p id="msgText"></p>
					</div>
				</div>
			  <!-- mp4 -->
			  <div id="mp4div" class="layui-upload" style="float: left">
					<label class="layui-form-label">选择视频</label>
					<input class="layui-input" type="hidden" name="banner_mp4" class="layui-input" lay-verify="verifyMp4" value="${entity.banner_image}">
					<button type="button" class="layui-btn" style="margin-left: 30px" id="uploadMp4">上传视频</button>
					<div class="layui-upload-list" style="margin:25px 25px 5px 110px">
							<c:if test="${empty entity.banner_image or isimage}">
								<video style="width: 150px; height: 150px"  controls="controls" id="banner_mp4">
							</c:if>
							<c:if test="${!isimage}">
								<video style="width: 150px; height: 150px"  controls="controls" id="banner_mp4" src="${imagePath}/gateway/banner${entity.banner_image}">
							</c:if>
						<p id="msgText"></p>
					</div>
				</div> 
				<span style="line-height:38px;margin:15px;color:red">视频和图片只能上传一个哦</span>
			</div>
			<a id="mp4IsOrNo" style="display: none;"></a>
			<div class="layui-form-item layui-hide">
	 		    <div class="layui-input-block">
			      <button class="layui-btn" lay-submit lay-filter="LAY-user-front-submit" id="LAY-user-front-submit">确定</button>
			      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
   			</div>
   			
		</form>
	</div>
	
	<%@ include file="/static/common/footer.jsp"%>
	
<script type="text/javascript">
	layui.config({
    	base: '${ctx}/static/layuiadmin/' //静态资源所在路径
  	}).extend({
    	index: 'lib/index' //主入口模块
  	}).use(['index','form','upload'], function(){
    	var $ = layui.$;
    	var form = layui.form;
    	var upload = layui.upload;
    	form.render('select');
    	form.verify({
    		//验证轮播图名称
    		verifyName:function(value){
    			if(value==null || value.trim().length==0){
    				return '请填写轮播图名称';
    			}
    		},
    		//验证图片
    		 verifyImg:function(value){
    			var banner_status=$("select[name='banner_status']").val();
    			var mp4IsOrNo = $("#mp4IsOrNo").text();
    			if(banner_status==1){
    				if((value==null || value.trim().length==0) && (mp4IsOrNo == "" || mp4IsOrNo ==null)){
    					return '请上传图片或者视频';
    				}
    			}
    		} 
    	});
		//轮播图
		var uploadImg = upload.render({
			elem : '#uploadImg',
			url : '${ctx}/uploadFile.do?path=gateway/banner',
			accept: 'images',
			/* exts: 'png', */
			before : function(obj) {
				//预读本地文件示例，不支持ie8
				obj.preview(function(index, file,result) {
					$('#banner_image').attr('src', result); //图片链接（base64）
					
				});
			},
			done : function(res) {
				if(res.code==0){
					//上传成功
					$("input[name='banner_image']").val(res.filesPath2);
					$("input[name='banner_mp4']").val("");
					$("#mp4div").css("display","none");
					return layer.msg('上传成功');
				}
				//如果上传失败
				return layer.msg('上传失败', {icon : 2,time : 3000});
			},
			error : function() {
				//演示失败状态，并实现重传
				var msgText = $('#msgText');
				msgText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
				msgText.find('.demo-reload').on('click', function() {
					uploadImg.upload();
				});
			}
		});
		var uploadMp4 = upload.render({
			elem : '#uploadMp4',
			url : '${ctx}/uploadFile.do?path=gateway/banner',
			accept: 'video',
			/* exts: 'mp4', */
			before : function(obj) {
				//预读本地文件示例，不支持ie8
				obj.preview(function(index, file,result) {
					$('#banner_mp4').attr('src', result); //
					$('#banner_image').attr('src', "");
				});
			},
			done : function(res) {
				if(res.code==0){
					//上传成功
					$("input[name='banner_mp4']").val(res.filesPath2);
					$("input[name='banner_image']").val("");
					$("#mp4IsOrNo").text("1");
					$("#imagediv").css("display","none");
					return layer.msg('上传成功');
				}
				//如果上传失败
				return layer.msg('上传失败', {icon : 2,time : 3000});
				$('#mp4Test').text("");
			},
			error : function() {
				//演示失败状态，并实现重传
				var msgText = $('#msgText');
				msgText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
				msgText.find('.demo-reload').on('click', function() {
					uploadMp4.upload();
				});
			}
		});
  	});
</script>	
</body>
</html>