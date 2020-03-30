<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>华脉科技</title>
    <link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/first.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/nav.css">
    <script type="text/javascript" src="${ctx}/static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="navbar navbar-inverse">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.html">
                    <img src="${ctx}/static/images/logo.png" alt="华脉科技" class="logo" style="height: 35px;"></a>
            </div>
            <div class="nav-search pull-right">
                    <span>ENGLISH</span>
                    <div class="sea">
                        <input type="text" name="">
                        <img src="${ctx}/static/images/fdj.png">
                    </div>
                </div>
            <div class="navbar-collapse collapse banner">
                <ul class="nav navbar-nav mainNav col-md-12 col-xs-12">
                    <li class="first col-md-1 col-xs-1 col-sm-1">
                        <a href="index.html" class="dropdown-toggle" data-toggle="dropdown">首页</a>
                    </li>
                    <li class="col-md-1 col-xs-1 col-sm-1">
                        <a href="zjhm.html" class="dropdown-toggle" data-toggle="dropdown">走进华脉</a>
                        <ul class="dropdown-menu">
                            <li><a href="zjhm.html">集团介绍</a></li>
                            <li><a href="#">社会职能</a></li>
                            <li><a href="#">组织架构</a></li>
                            <li><a href="#">资质荣誉</a></li>
                            <li><a href="#">公司视频</a></li>
                            <li><a href="lxwm.html">联系我们</a></li>
                        </ul>
                    </li>
                    <li class="col-md-1 col-xs-1 col-sm-1">
                        <a href="cpzx.html" class="dropdown-toggle" data-toggle="dropdown">产品中心</a>
                        <ul class="dropdown-menu cpzxnav">
                            <li><a href="cpzx.html">光缆</a>
                            <ul>
                                <li>1</li>
                                <li></li>
                                <li></li>
                            </ul>
                            </li>
                            <li><a href="#">FTTx</a>
                            <ul>
                                <li>1</li>
                                <li></li>
                                <li></li>
                            </ul>
                            </li>
                            <li class="tlx"><a href="#" class="tlx">铜缆配线</a>
                            <ul>
                                <li>1</li>
                                <li></li>
                                <li></li>
                            </ul>
                            </li>
                            <li class="jc"><a href="#" class="jc">基础配线布线</a>
                            <ul>
                                <li>1</li>
                                <li></li>
                                <li></li>
                            </ul>
                            </li>
                            <li class="wb"><a href="#" class="wb">微波无源器件</a>
                            <ul>
                                <li>1</li>
                                <li></li>
                                <li></li>
                            </ul>
                            </li>
                            <li class="gqj"><a href="#" class="gqj">光器件及通用部件</a>
                            <ul>
                                <li>1</li>
                                <li></li>
                                <li></li>
                            </ul>
                            </li>
                            <li class="zngxl"><a href="#" class="zngxl">智能光线路管理系统</a>
                            <ul>
                                <li>1</li>
                                <li></li>
                                <li></li>
                            </ul>
                            </li>
                            <li class="znjj"><a href="#" class="znjj">智能家居</a>
                            <ul>
                                <li>1</li>
                                <li></li>
                                <li></li>
                            </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="col-md-1 col-xs-1 col-sm-1">
                        <a href="jjfa.html" class="dropdown-toggle" data-toggle="dropdown">解决方案</a>
                        <ul class="dropdown-menu jjfanav">
                            <li><a href="#">光接入</a>
                            <ul>
                                <li>1</li>
                                <li></li>
                                <li></li>
                                <li></li>
                            </ul>
                            </li>
                            <li><a href="#">节能环保</a>
                            <ul>
                                <li>1</li>
                                <li></li>
                                <li></li>
                                <li></li>
                            </ul>
                            </li>
                            <li><a href="#">数据中心</a>
                            <ul>
                                <li>1</li>
                                <li></li>
                                <li></li>
                                <li></li>
                            </ul>
                            </li>
                            <li><a href="#" class="zngx">智能光线路管理系统</a>
                            <ul>
                                <li>1</li>
                                <li></li>
                                <li></li>
                                <li></li>
                            </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="col-md-1 col-xs-1 col-sm-1">
                        <a href="jszc.html" class="dropdown-toggle" data-toggle="dropdown">技术支持</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">资料下载</a></li>
                            <li><a href="#">软件下载</a></li>
                            <li><a href="#">软件问题</a></li>
                        </ul>
                    </li>
                    <li class="col-md-1 col-xs-1 col-sm-1">
                        <a href="yxwl.html" class="dropdown-toggle" data-toggle="dropdown">营销网络</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">国内网络</a></li>
                            <li><a href="#">国际网络</a></li>
                        </ul>
                    </li>
                    <li class="col-md-1 col-xs-1 col-sm-1">
                        <a href="tzzgx.html" class="dropdown-toggle" data-toggle="dropdown">投资者关系</a>
                        <ul class="dropdown-menu tzzgx">
                            <li><a href="#">定期报告</a></li>
                            <li><a href="#">公告</a></li>
                            <li><a href="#">制度</a></li>
                            <li><a href="#">投资者互动平台</a></li>
                        </ul>
                    </li>
                    <li class="col-md-1 col-xs-1 col-sm-1">
                        <a href="lxwm.html" class="dropdown-toggle" data-toggle="dropdown">联系我们</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <header id="head">
        <div class="container tplb">
            <div class="row">
                <div class="tl">
            
                <div class="myCarousel">  
                <div id="carousel-example-generic" class="carousel slide" data-interval="2000" data-pause>  
                    
                    <div id="lunboDiv" class="carousel-inner slide">  
                        <%-- <div class="item active">
                            <video  src="" type="video/mp4" class="shipin" loop controls  id="audio" >
                        </div>  
                        <div class="item">  
                            <img src="${ctx}/static/images/a2.jpg"/>  
                        </div>  
                        <div class="item">  
                            <img src="${ctx}/static/images/a3.jpg"/>   
                        </div>
                        <div class="item">  
                            <img src="${ctx}/static/images/a2.jpg"/>   
                        </div>
                        <div class="item">  
                            <img src="${ctx}/static/images/a3.jpg"/>   
                        </div>   --%>
                    </div>  
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">  
                        <span class="glyphicon glyphicon-chevron-left">
                            <img src="${ctx}/static/images/left.png" class="left">
                        </span>  
                    </a>  
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">  
                        <span class="glyphicon glyphicon-chevron-right">
                            <img src="${ctx}/static/images/right.png" class="right">
                        </span>  
                    </a>  
                </div>  
            </div>  
        </div>
       </div>      
      </div>
    </header>
    <section class="news-box">
        <div class="container">
            <div class="row" id = "shangDiv">
                   <%--  <div class=" cont1 col-md-12 col-xs-12">
                        <div class="news col-md-6 col-sm-6 col-xs-6 ">
                         <h2><span>NWES</span>/新闻中心</h2>
                         <p>南京华脉作为国内领先的通信网络物理连接设备制造商，专注于为国内外电信运营商、电信主设备商和网络集成商提供一流的通信网络连接、分配和保护产品及整体智红化ODN解决方案</p>
                         </div>
                         <div class="pic col-md-6 col-sm-6 col-xs-6 ">
                            <img src="${ctx}/static/images/01.png">
                         </div> 
                    </div> --%>
            </div>
            </div>
    </section>
    <section class="news-box">
        <div class="container">
            <div class="row" id="zhongDiv">
                   <%--  <div class=" cont1 col-md-12 col-xs-12">
                        <div class="news col-md-6 col-sm-6 col-xs-6 ">
                         <h2><span>NWES</span>/产品中心</h2>
                         <p>光缆是一定数量的光纤按照一定方式组成缆心，外包有护套，有的还包覆外护层，用以实现光信号传输的一种通信线路。即：由光纤（光传输载体）经过一定的工艺而形成的线缆。光缆的基本结构一般是由缆心、加强钢丝、填充物和护套等几部分组成，另外根据需要还有防......</p>
                         </div>
                         <div class="pic col-md-6 col-sm-6 col-xs-6 ">
                            <img src="${ctx}/static/images/02.png">
                         </div> 
                    </div> --%>
            </div>
            </div>
      </section>
      <section class="new-box">
            <div class="container">
            <div class="row">
                <div class="yj col-md-4 col-sm-4 col-xs-4" id="xiazuoDiv">
                    <%-- <dl>
                        <dt><img src="${ctx}/static/images/03.png"></dt>
                        <dd>户外工程介于局端机房和用户大楼之间，在FTTB/FTTH中，用于连接从局端引出的馈线光缆</dd>
                        <dd class="xq">详情</dd>
                    </dl> --%>
                </div>
                <div class="yj col-md-4 col-sm-4 col-xs-4" id="xiazhongDiv">
                    <%-- <dl>
                        <dt><img src="${ctx}/static/images/04.png"></dt>
                        <dd>户外工程介于局端机房和用户大楼之间，在FTTB/FTTH中，用于连接从局端引出的馈线光缆</dd>
                        <dd class="xq">详情</dd>
                    </dl> --%>
                </div>
                <div class="yj col-md-4 col-sm-4 col-xs-4" id="xiayouDiv">
                   <%--  <dl>
                        <dt><img src="${ctx}/static/images/05.png"></dt>
                        <dd>户外工程介于局端机房和用户大楼之间，在FTTB/FTTH中，用于连接从局端引出的馈线光缆</dd>
                        <dd class="xq">详情</dd>
                    </dl> --%>
                </div>
            </div>
            </div>  
      </section> 
      <section class="hzhbx">
            <div class="container col-md-12 col-xs-12 col-sm-12">
                <div class="row">
                    <div class="hzhb">
                        <div class="hzhb1 col-md-1 col-xs-1 col-sm-1"></div>
                        <div class="hzhb2 col-md-1 col-xs-1 col-sm-1"></div>
                        <div class="hzhb3 col-md-1 col-xs-1 col-sm-1"></div>
                        <div class="hzhb4 col-md-1 col-xs-1 col-sm-1"></div>
                        <div class="hzhb5 col-md-1 col-xs-1 col-sm-1"></div>
                        <div class="hzhb6 col-md-1 col-xs-1 col-sm-1"></div>
                        <div class="hzhb7 col-md-1 col-xs-1 col-sm-1"></div>
                        <div class="hzhb8 col-md-1 col-xs-1 col-sm-1"></div>
                        <div class="hzhb9 col-md-1 col-xs-1 col-sm-1"></div>
                    </div>
                </div>
            </div> 
      </section>   
      <footer class="fot">
                <div class="container footer col-md-12 col-xs-12">
                    <div class="row">
                        <p>华脉科技股份有限公司 版权所有</p>
                        <ul class="fotnav">
                            <li><a href="#">隐私协议</a></li>
                            <li><a href="#">使用条款</a></li>
                            <li><a href="#">团队介绍</a></li>
                            <li><a href="#">联络华脉</a></li>
                        </ul>
                        <div class="fwrx">
                            <p>服务热线</p>
                            <img src="${ctx}/static/images/phone.png">
                            <a href="tel:400-025-9565">400-025-9565</a>
                            <span class="gz">关注华脉</span>
                            <img src="${ctx}/static/images/wx.png">      
                            <img src="${ctx}/static/images/QQ.png">  
                            <img src="${ctx}/static/images/xl.png">
                        </div>
                                    
                    </div>  
                </div>
            </footer>   
    
    <script type="text/javascript">
       var imagePath = "http://"+ window.location.host+"/download/gateway/banner";
        $(document).ready(function(){
        $(document).off('click.bs.dropdown.data-api');
        getBannerList();
        getDivByStatus();
        });
        /* window.onload=function(){  
            var myVideo=document.getElementById("audio");  
            function eventTester(e){  
                myVideo.addEventListener(e,function(){  
  
                    if(e=='pause'){  
                        $('.plays').show();  
                    }else{  
                        $('.plays').hide();  
                    }  
  
                });  
            }  
            eventTester("pause");  
            eventTester("play");
            $(".plays").on("click",function(){
                $(this).hide().next().trigger('play');
                $("#audio").show();
             });
        }   */
        $(function(){
            $('.carousel-inner').carousel({
              interval: 3000
            });
        }); 
        $('#carousel-example-generic').on('slide.bs.carousel', function () {
                document.getElementById('audio').pause();
        });
        $(".shipin").prop("src","${ctx}/static/images/play.mp4");
        
        function isImage(str){
        	if(str){
        		if(str.indexOf(".png") != -1){
        			return true;
        		}
        		return false;
        	}else{
        		return false;
        	}
        }
        
        //查询轮播图
        function getBannerList(){
        	$.ajax({
    			url : "${ctx}/frontview/firstpage/getBanner.do",
    			dataType : "json",
    			data : {},
    			type : "POST",
    			success : function(result) {
    				if (result.success) {
    					var data=result.list;
    					for(var i = 0;i<data.length;i++){
    						if(isImage(data[i].banner_image)){
    							$("#lunboDiv").append('<div class="item"><img src=\"'+imagePath+data[i].banner_image+'\"/></div');
    						}else{
    							$("#lunboDiv").append('<div class="item active"><video  src=\"'+imagePath+data[i].banner_image+'\" type="video/mp4" class="shipin" loop controls  id="audio" ></div>');
    						}
    					}
    					
    				} else {
    					alert(result.msg)
    				}
    			}
    		});
        }
        //查询可显示的div
        function getDivByStatus(){
        	$.ajax({
    			url : "${ctx}/frontview/firstpage/getDivByStatus.do",
    			dataType : "json",
    			data : {},
    			type : "POST",
    			success : function(result) {
    				if (result.success) {
    					var data=result.list;
    					showDiv(data)
    				} else {
    					alert(result.msg)
    				}
    			}
    		});
        }
        //如果页面有 则不添加
        function showDiv(data){
        	for(var i=0;i<data.length;i++){
        		if(data[i].div_position == "0" && ($("#shangDiv").html() == null || $("#shangDiv").html().length==0)){
        			alert(111)
        			$("#shangDiv").append('<div class="cont1 col-md-12 col-xs-12"><div class="news col-md-6 col-sm-6 col-xs-6 "><h2><span>NWES</span>/'
        			      +data[i].div_name+'</h2><p>'+data[i].div_content+'</p></div><div class="pic col-md-6 col-sm-6 col-xs-6 ">'
        			      +'<img src=\"'+imagePath+data[i].div_image+'\"></div></div>')
        		}else if(data[i].div_position == "1"){
        			
        		}else if(data[i].div_position == "2"){
        			
        		}else if(data[i].div_position == "3"){
        			
        		}else if(data[i].div_position == "4"){
        			
        		}
        	}
        }
    </script>
</body>
</html>
