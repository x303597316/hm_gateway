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
      <div class="layui-card-header">招聘信息编辑</div>
      <div class="layui-card-body" style="padding: 15px;">
        <form class="layui-form" action="" lay-filter="component-form-group">
	      <c:if test="${recruit != null}">
	          <input type="hidden" name="id" value="${recruit.id}">
	          <input type="hidden" name="type" value="${recruit.type}">
          </c:if>
           <c:if test="${recruit == null}">
	          <input type="hidden" name="type" value="${type}">
          </c:if>
          <div class="layui-form-item">
            <label class="layui-form-label">招聘职位</label>
            <div class="layui-input-block">
              <input type="text" name="job" lay-verify="required" autocomplete="off" value="${recruit.job }" placeholder="请输入招聘职位" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">公司部门</label>
            <div class="layui-input-block">
              <input type="text" name="department" value="${recruit.department }" autocomplete="off" placeholder="请输入公司部门" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">招聘人数</label>
            <div class="layui-input-block">
              <input type="text" name="number"  value="${recruit.number }" autocomplete="off" placeholder="请输入招聘人数" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">工作地址</label>
            <div class="layui-input-block">
              <input type="text" name="address" lay-verify="required"  value="${recruit.address }" placeholder="请输入工作地址" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">工作待遇</label>
            <div class="layui-input-block">
              <input type="text" name="workreatment"  value="${recruit.workreatment }"  placeholder="请输入工作待遇" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">发布时间</label>
            <div class="layui-input-block">
              <input type="text" name="createTime"  id="LAY-component-form-group-date" value="${recruit.createTime }" placeholder="请选择发布时间" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">有限期限</label>
            <div class="layui-input-block">
              <input type="text" name="validitytime"  value="${recruit.validitytime }" placeholder="请输入有限期限" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">联系人</label>
            <div class="layui-input-block">
              <input type="text" name="contacts"  lay-verify="required" value="${recruit.contacts }" placeholder="请输入联系人" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-block">
              <input type="text" name="mobile"  lay-verify="required" value="${recruit.mobile }" placeholder="请输入联系电话" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">应聘该岗位</label>
            <div class="layui-input-block">
              <input type="text" name="url"  value="${recruit.url }" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
          <label class="layui-form-label">招聘要求</label>
            <div class="layui-input-block">
          		<TEXTAREA id="myEditor"  style="width:99.8%;height:700px;margin:auto;" >${recruit.requirement}</TEXTAREA>  
          	</div>
          </div> 
          <div class="layui-form-item layui-hide">
            <div class="layui-input-block">
              <div class="layui-footer" style="left: 0;">
                <button class="layui-btn" lay-submit lay-filter="LAY-user-front-submit" id="LAY-user-front-submit">立即提交</button>
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
	  $("#requirement").val(editor.getContent());
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

  	laydate.render({
		elem: '#LAY-component-form-group-date'
	  	,type : 'datetime'
	});
  });
  </script>
</body>
</html>

  
    
