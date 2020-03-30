<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
   <%@ include file="/static/frontView/header.jsp"%>
    <link rel="stylesheet" href="${ctx}/static/css/yxwl.css">
</head>
<body>
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
                        <img src="${ctx}/static/images/home.png" class="hmzj"><a href="${ctx}/proscenium/yxwl.do"><span style="font-size: 20px;">营销网络</span></a><img style="margin-right: -13px;" src="${ctx}/static/images/rig.png">
                        <span id="title1">国际网络</span>
                    </div>
                    <div class="snw">
					    <p style="cursor: pointer;" onclick="clickFun(1)" >国内网络</p>
						<p style="cursor: pointer;" onclick="clickFun(2)" >国际网络</p>
					</div>
            </div>
            <div class="right col-md-8 col-sm-8 col-xs-8">
               <div class="mh">
                   <div class="mh1"></div>
               </div>
               <div class="tit">
                   <h1 id="title2">国际网络</h1>
                   <img class="map" src="${ctx}/static/images/map.jpg">
            </div>
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
        var op = 1;
        if(getQueryString("op")){
        	op = getQueryString("op");
        }
        clickFun(op);
        });
        
    
    
    function clickFun(option){
    	if(option==1){
    		$("#title1").text("国内网络");
    		$("#title2").text("国内网络");
    		$(".map").attr("src","${ctx}/static/images/map1.png");
    	}else{
    		$("#title1").text("国际网络");
    		$("#title2").text("国际网络");
    		$(".map").attr("src","${ctx}/static/images/map.jpg");
    	}
    }
    
    function getQueryString(name) {
	    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	    var reg_rewrite = new RegExp("(^|/)" + name + "/([^/]*)(/|$)", "i");
	    var r = window.location.search.substr(1).match(reg);
	    var q = window.location.pathname.substr(1).match(reg_rewrite);
	    if(r != null){
	        return unescape(r[2]);
	    }else if(q != null){
	        return unescape(q[2]);
	    }else{
	        return null;
	    }
	}	
    </script>
</body>
</html>