<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/static/frontView/header.jsp"%>
    <link rel="stylesheet" href="${ctx}/static/css/lxwm.css">
    
    <style type="text/css">
    	.point{
    		padding-right: 10px;
    	}
    	
    	.info{
    		padding-left:  90px;
    		background: #ECE7E7;
    		height: 150px;
    		margin-left: 25px;
    		    width: 995px;
    	}
    	.companydetail{
    		    padding-bottom: 15px;
    	}
    	
    	
    	
    </style>
</head>
<body>

<!-- 公共导航栏 -->
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
                        <img src="${ctx}/static/images/home.png" class="hmzj"><a href="${ctx}/proscenium/ContactUs.do"><span style="font-size: 20px;">联系我们</span></a>
                    </div>
                    <form id="myfrm">
                    <div class="zxly">
                        <h2>在线留言</h2>
                        <div class="name">
                            <span>姓名</span><input type="text" name="name" id="name">
                        </div>
                        <div class="phone">
                            <span>电话</span><input type="text" name="phone" id="phone">
                        </div> 
                        <div class="email">
                            <span>邮箱</span><input type="text" name="email" id="email">
                        </div> 
                        <div class="xq">
                            <span>描述</span><textarea name="message" id="message" style="resize: none;width:132px;height:64px;"></textarea>
                        </div> 
                    </div>  	
                    <button class="open" onclick="save()" type="button">发送信息</button>
                    </form>
            </div>
            <div class="right col-md-8 col-sm-8 col-xs-8">
               <div class="tit">
                <!--    <h1>南京华脉科技股份有限公司</h1> -->
                	 <img src="${ctx}/static/images/contactus.png"  style="  padding: 0 0px 3px 381px;"/>
                
               </div>
               
               
              <!--  <ul class="dz">
                   <li style="font-size: 16px;">地址：江苏省南京市江宁区东山国际企业研发园润发路11号</li>
                   <li style="font-size: 16px;">邮编：211103</li>
                   <li style="font-size: 16px;">电话：025-52802986 传真：025-52802115</li>
                   <li style="font-size: 16px;">邮箱：huamai@huamai.cn</li>
                   <li style="font-size: 16px;">网址：http://www.huamai.cn</li>
               </ul> -->
               <div id="allmap" class="map" style="height:300px;width: 998px;"></div>
               	
               
               	<div class="companylocation" >
                    <img src="${ctx}/static/images/companylocation.png" class="location" style="padding: 27px 0px 37px 24px;" >
               </div>
               
               <div>
               	<img  src="${ctx}/static/images/nanjinhuamai.png" style=" padding: 14px 0px 33px 355px;">
               </div>
               <div class="info">
               <div class="companydetail" style="padding-top: 24px;">
                    <img src="${ctx}/static/images/dizhi.png" class="point"><span style="font-size: 14px;">地址：江苏省南京市江宁区东山国际企业研发园润发路11号</span>
                    <img src="${ctx}/static/images/youxiang.png" class="point1" style="padding-left: 13%;"> <span style="font-size: 14px;">邮箱：huamai@huamail.cn</span>
               </div>
               
                <div class="companydetail">
                    <img src="${ctx}/static/images/chuanzheng.png" class="point"><span style="font-size: 14px;">传真：025-52802115</span>
                    <img src="${ctx}/static/images/dianhua.png" class="point1" style="padding-left: 39%;"> <span style="font-size: 14px;">电话：025-52802986</span>
               </div>
               
               
                <div class="companydetail">
                    <img src="${ctx}/static/images/youbian.png" class="point"><span style="font-size: 14px;">邮编：211103</span>
                    <img src="${ctx}/static/images/wangzhi.png" class="point1" style="padding-left: 43.5%;">  <span style="font-size: 14px;">网址：http://www.huamai.cn</span>
               </div>
               
               </div>
        </div>
    </div>
    </div>
<!-- 公共底部 -->        
<%@ include file="/static/frontView/footer.jsp"%> 
</div>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=UXgxGhBLtp4u7QIdrYvufuMfxjyugCGr"></script>
    <script type="text/javascript">
    $(document).ready(function(){
        $(document).off('click.bs.dropdown.data-api');
     // 百度地图API功能
    	var map = new BMap.Map("allmap");    // 创建Map实例
    	var point = new BMap.Point(118.876562,31.996565); 
    	var marker = new BMap.Marker(point);        // 创建标注    
    	map.addOverlay(marker);
    	map.centerAndZoom(point, 15);  // 初始化地图,设置中心点坐标和地图级别
    	//添加地图类型控件
    	map.addControl(new BMap.MapTypeControl({
    		mapTypes:[
                BMAP_NORMAL_MAP,
                BMAP_HYBRID_MAP
            ]}));	  
    	map.setCurrentCity("南京");          // 设置地图显示的城市 此项是必须设置的
    	map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    	var opts = {    
    			width : 250,     // 信息窗口宽度    
    			height: 80,     // 信息窗口高度    
    			title : "南京华脉科技股份有限公司"  // 信息窗口标题   
    		}    
   		var infoWindow = new BMap.InfoWindow("江苏省南京市江宁区东山国际企业研发园润发路11号", opts);  // 创建信息窗口对象    
   		map.openInfoWindow(infoWindow, map.getCenter());
        });
	function save(){
		var phone = $("#phone").val();
		var email = $("#email").val();
		var name = $("#name").val();
		var mesage = $("#message").val();
		if(!name){
			alert("名字不能为空");
			return false;
		}
		if(!phone){
			alert("手机号码不能为空");
			return false;
		}
	    if (!/^1\d{10}$/.test(phone)){
			alert("手机号码格式不正确");
			return false;
		}
	    if(!email){
	    	alert("邮箱不能为空");
	    	return false;
	    }
		if(!/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email)){
			alert("邮箱格式错误");
			return false;
		}
		if(!mesage){
	    	alert("留言不能为空");
	    	return false;
	    }
			
		$.ajax({
			url:"${ctx}/proscenium/save.do",
			type:"POST",
			dataType:"json",
			data:$("#myfrm").serialize(),
			success:function(data){
				alert("留言成功")
				window.location.reload();
				
			}
		})
		
	}  
	
	
	
	
    </script>

</body>
</html>