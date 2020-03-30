<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/static/frontView/header.jsp"%>
    <link rel="stylesheet" href="${ctx}/static/css/jjfa.css">
    <style type="text/css">
    	.plist .product{
    		line-height: 30px;
    		
    	}
    </style>
</head>
<body style="height:auto">
<div class="box">
<div class="banner">
		<div class="container banner1 col-md-12 col-sm-12 col-xs-12">
			<div class="navbar-header pull-left">
				<a class="navbar-brand" href="${ctx}/proscenium/index.do">
					<img src="${ctx}/static/images/logo.png" alt="华脉科技" class="logo" style="height: 35px;"></a>
			</div>
			<div class="nav-search pull-right">
                    <span>ENGLISH</span>
                    <div class="sea">
                        <%@ include file="/static/frontView/search.jsp"%>
                    </div>
            </div>
        </div>
        <div class="container">
        <div class="row">
        <div>
                <%@ include file="/static/frontView/navigation.jsp"%>
        </div>
        </div>
        </div>
	</div>
    <div class="container contert">
        <div class="row">
            <div class="hmfir col-md-4 col-sm-4 col-xs-4">
                    <div class="title">
                        <img src="${ctx}/static/images/home.png" class="hmzj"><a href="${ctx}/proscenium/jjfa.do?type=1"><span style="font-size: 20px;">解决方案</span></a><%-- <img src="${ctx}/static/images/rig.png"><span>光接入</span> --%>
                    </div>
                    <div class="snw">
                        <p><a href="${ctx}/proscenium/jjfa.do?type=1">光接入</a></p>
                        <p><a href="${ctx}/proscenium/jjfa.do?type=2">节能环保</a></p>
                        <p><a href="${ctx}/proscenium/jjfa.do?type=3">数据中心</a></p>
                        <p><a href="${ctx}/proscenium/jjfa.do?type=4">智能光线路管理</a></p>
                    </div>
            </div>
            <div class="right col-md-8 col-sm-8 col-xs-8" style=' justify-content: center;align-items: center;  '>
            	<c:if test="${empty entity }">
	               <div class="tit">
	                   <h1>
	                   	<c:if test="${solutionType eq 1 or empty solutionType}">光接入</c:if>
	                   	<c:if test="${solutionType eq 2 }">节能环保</c:if>
	                   	<c:if test="${solutionType eq 3 }">数据中心</c:if>
	                   	<c:if test="${solutionType eq 4 }">智能光线路管理</c:if>
	                   </h1>
	                   <%-- <img class="gjr" src="${ctx}/static/images/gjr.jpg">
	                   <p>华脉提供模块化、可扩容展、高密度、快速部署和维护的端到端光、电器件和系统连接解决方案，包括中心机房、户外、用户驻地、FTTA等解决方案。</p> --%>
	               </div>
               	<c:forEach var="item" items="${entitylist }">
               		<div class="zxjf">
	                    <h4>${item.solutionname }</h4>	
	                    <p>${item.present }</p>
	                    <a href="${ctx}/proscenium/jjfa.do?id=${item.id }">更多>></a>
               		</div>
               	</c:forEach>
               </c:if>
               <c:if test="${!empty entity }">
               		<div class="tit">
	                   <h1>${entity.solutionname }</h1>
	                   <c:if test="${!empty entity.titleimg }">
	                   	<img class="gjr" src="${imagePath}${entity.titleimg }">
	                   </c:if>
	                   <p>${entity.present }</p>
	                   ${entity.textcontent }
	                   <div class="plist" style="margin-top:">	
		    				<p class="tle" style="line-height: 30px;font-size: 20px;margin:0;">关联产品列表</p>
		    				<hr>
		                    <div class="content">
		                    	<c:if test="${empty productlist }">
		                    		<p>没有数据</p>
		                    	</c:if>
		                    	<c:forEach var="item" items="${productlist }">
		                    		<p class="product" style="line-height: 30px;margin:0;"><a href="${ctx}/proscenium/cpzx.do?id=${item.id}">${item.productname }</a></p>
		                    	</c:forEach>
		                    </div>
		    			</div>
	               </div>
               </c:if>
            </div>
        </div>
    </div>
    <!-- 公共底部 -->        
<%@ include file="/static/frontView/footer.jsp"%> 
<!-- 公共底部 -->  
    </div>
    <script type="text/javascript">
    $(document).ready(function(){
        $(document).off('click.bs.dropdown.data-api');
        });
            $('#carousel-example-generic').on('slide.bs.carousel', function () {
                document.getElementById('audio').pause();
        });
    </script>
</body>
</html>