<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="cn">
  <head>
  <%@ include file="/static/common/head.jsp"%>
  <%@ include file="/static/common/footer.jsp"%>
  </head>
  <body>
	  <div id="LAY_app">
	    <div class="layui-layout layui-layout-admin">
	      <div class="layui-header">
	        <!-- 头部区域 -->
	        <ul class="layui-nav layui-layout-left">
	          <li class="layui-nav-item layadmin-flexible" lay-unselect>
	            <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
	              <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
	            </a>
	          </li>
	          <li class="layui-nav-item" lay-unselect>
	            <a href="javascript:;" layadmin-event="refresh" title="刷新">
	              <i class="layui-icon layui-icon-refresh-3"></i>
	            </a>
	          </li>
	        </ul>
	        <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
	          
	          <li class="layui-nav-item" lay-unselect>
	            <a lay-href="app/message/index.html" layadmin-event="message" lay-text="消息中心">
	              <i class="layui-icon layui-icon-notice"></i>  
	              
	              <!-- 如果有新消息，则显示小圆点 -->
	              <span class="layui-badge-dot"></span>
	            </a>
	          </li>
	          <li class="layui-nav-item layui-hide-xs" lay-unselect>
	            <a href="javascript:;" layadmin-event="theme">
	              <i class="layui-icon layui-icon-theme"></i>
	            </a>
	          </li>
	          <li class="layui-nav-item layui-hide-xs" lay-unselect>
	            <a href="javascript:;" layadmin-event="note">
	              <i class="layui-icon layui-icon-note"></i>
	            </a>
	          </li>
	          <li class="layui-nav-item layui-hide-xs" lay-unselect>
	            <a href="javascript:;" layadmin-event="fullscreen">
	              <i class="layui-icon layui-icon-screen-full"></i>
	            </a>
	          </li>
	          <li class="layui-nav-item" lay-unselect>
	            <a href="#">
	              <cite>${sessionScope.User.username}&nbsp;&nbsp;&nbsp;&nbsp;</cite>
	            </a>
	            <dl class="layui-nav-child">
	              <dd><a lay-href="user/userInfo.do">基本资料</a></dd>
	              <dd><a lay-href="user/userPassword.do">修改密码</a></dd>
	              <hr>
	              <dd layadmin-event="logout" style="text-align: center;"><a>退出</a></dd>
	            </dl>
	          </li>
	          
	          <li class="layui-nav-item layui-hide-xs" lay-unselect>
	            <a href="javascript:;" layadmin-event="about"><i class="layui-icon layui-icon-more-vertical"></i></a>
	          </li>
	          
	        </ul>
	      </div>
	      
	      <!-- 侧边菜单 -->
	      <div class="layui-side layui-side-menu">
	        <div class="layui-side-scroll">
	        
	          <div class="layui-logo" lay-href="">
	            <span>门户网站管理系统欢迎您</span>
	          </div>
	          
	          <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
	            
	            <c:forEach var="item" items="${menuList}" >
		            <li data-name="app" class="layui-nav-item">
		            	<a href="javascript:;" lay-tips="${item.name}" lay-direction="2">
			                <%-- <i class="layui-icon ${item.icon}"></i> --%>
			                <cite>${item.name}</cite>
		              	</a>
		              	<c:if test="${item.treeNodes!=null}">
		              	<dl class="layui-nav-child">
		              		<c:forEach var="i" items="${item.treeNodes}" >
			              		<dd data-name="${i.name}">
			              		<c:if test="${!empty i.url}">
                  					<a lay-href="${ctx}${i.url }?title=${i.name}">${i.name}</a>
                  				</c:if>
                  				<c:if test="${empty i.url}">
			              			<a lay-href="${ctx}/Menu/gotoEdit.do?title=${i.name}&id=${i.id}">${i.name}</a>
			              		</c:if>
				                  	<c:if test="${i.treeNodes!=null}">
				                  		<dl class="layui-nav-child">
				                  			<c:forEach var="y" items="${i.treeNodes}" >
				                  				<dd data-name="${y.name}">
				                  				<c:if test="${!empty y.url}">
				                  					<a lay-href="${ctx}${y.url }?title=${y.name}">${y.name}</a>
				                  				</c:if>
				                  				<c:if test="${empty y.url}">
							                  		<a lay-href="${ctx}/Menu/gotoEdit.do?title=${y.name}&id=${y.id}">${y.name}</a>
							                  	</c:if>
							                  	<%-- <c:if test="${y.treeNodes!=null}">
							                  		<dl class="layui-nav-child">
							                  			<c:forEach var="j" items="${y.treeNodes}" >
							                  				<dd data-name="${j.name}">
									              			<a lay-href="${ctx}/Menu/gotoEdit.do?title=${j.name}&id=${j.id}">${j.name}</a>
										                  	<c:if test="${j.treeNodes!=null}">
										                  		<dl class="layui-nav-child">
										                  			<c:forEach var="k" items="${j.treeNodes}" >
										                  				<dd data-name="${k.name}">
												              			<a lay-href="${ctx}/Menu/gotoEdit.do?title=${k.name}&id=${k.id}">${k.name}</a>
													                  	<c:if test="${k.treeNodes!=null}">
													                  		<a lay-href="${ctx}/Menu/gotoEdit.do?title=${k.name}&id=${k.id}">${k.name}</a>
													                  	</c:if>
													                	</dd>
										                  			</c:forEach>
										                  		</dl>
										                  	</c:if>
										                	</dd>
							                  			</c:forEach>
							                  		</dl>
							                  	</c:if> --%>
							                	</dd>
				                  			</c:forEach>
				                  		</dl>
				                  	</c:if>
				                </dd>
		              		</c:forEach>
		              	</dl>
		              	</c:if>
		            </li>
	            </c:forEach>
	          </ul>
	        </div>
	      </div>
	
	      <!-- 页面标签 -->
	      <div class="layadmin-pagetabs" id="LAY_app_tabs">
	        <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
	        <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
	        <div class="layui-icon layadmin-tabs-control layui-icon-down">
	          <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
	            <li class="layui-nav-item" lay-unselect>
	              <a href="javascript:;"></a>
	              <dl class="layui-nav-child layui-anim-fadein">
	                <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
	                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
	                <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
	              </dl>
	            </li>
	          </ul>
	        </div>
	        <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
	          <ul class="layui-tab-title" id="LAY_app_tabsheader">
	            <li lay-id="" lay-attr="" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
	          </ul>
	        </div>
	      </div>
	      <!-- 主体内容 -->
	      <div class="layui-body" id="LAY_app_body">
	        <div class="layadmin-tabsbody-item layui-show">
	          <iframe src="" frameborder="0" class="layadmin-iframe"></iframe>
	        </div>
	      </div>
	      
	      <!-- 辅助元素，一般用于移动设备下遮罩 -->
	      <div class="layadmin-body-shade" layadmin-event="shade"></div>
	    </div>
	  </div>
	
	  <script src="${ctx}/static/layuiadmin/layui/layui.js"></script>
	  <script>
		  layui.config({
		    base: '${ctx}/static/layuiadmin/' //静态资源所在路径
		  }).extend({
		    index: 'lib/index' //主入口模块
		  }).use('index');
	  </script>
  </body>
</html>
