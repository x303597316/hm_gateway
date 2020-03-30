<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/frontView/header.jsp"%>
<link rel="stylesheet" href="${ctx }/static/css/first.css">
    <style>
     #xiazuoDiv {
         	 width: 340px;
          
    	  	margin-left: 43px;


        }
        #xiazhongDiv {
            width: 340px;
            
            margin-left: 82px;

        }
        #xiayouDiv {
            width: 340px;
           
			 margin-left: 82px;
        }
 
        #s1{
               font-weight:750
           }

        #s2{
            font-weight:750
        }

        #s3{
            font-weight:750
        }
		  #dibu{
            margin-top: 30px;
            margin-bottom: 15px;
        }
      
      #img1{
      	height: 182px;
      	width: 323px;
      	
      }
          #img2{
      	height: 182px;
      	width: 323px;
    	
      }
          #img3{
      	height: 182px;
      	width: 323px;
      
      }

    </style>
</head>
<body>
<div class="navbar navbar-inverse">
	<div class="container">
         <div class="navbar-header">
             <a class="navbar-brand" href="${ctx}/proscenium/index.do">
                 <img src="${ctx}/static/images/logo.png" alt="华脉科技" class="logo" style="height: 35px;"></a>
         </div>
         <div class="nav-search pull-right">
                 <span>ENGLISH</span>
                 <div class="sea">
                     <%@ include file="/static/frontView/search.jsp"%>
                 </div>
             </div>
         <div class="navbar-collapse collapse">
<!-- 公共导航栏 -->
<%@ include file="/static/frontView/navigation.jsp"%>
<!-- 公共导航栏 -->
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
            <div class="row" id = "shangDiv"></div>
            </div>
    </section>
    <section class="news-box" style="margin-bottom:20px;">
        <div class="container">
            <div class="row" id="zhongDiv"></div>
            </div>
      </section>
    <section class="new-box">
            <div class="container" id="dibu">
            <div class="row">
            	<a  class="yj col-md-4 col-sm-4 col-xs-4"   id="xiazuoDiv"  href="javascript:void(0)" ></a>
               <!--  <div class="yj col-md-4 col-sm-4 col-xs-4" id="xiazuoDiv" ></div> -->
              <!--   <div class="yj col-md-4 col-sm-4 col-xs-4" id="xiazhongDiv"></div> -->
                <a  class="yj col-md-4 col-sm-4 col-xs-4"   id="xiazhongDiv"  href="javascript:void(0)" ></a>
               <!--  <div class="yj col-md-4 col-sm-4 col-xs-4" id="xiayouDiv"></div> -->
                <a  class="yj col-md-4 col-sm-4 col-xs-4"   id="xiayouDiv"  href="javascript:void(0)" ></a>
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
      
<!-- 公共底部 -->        
<%@ include file="/static/frontView/footer.jsp"%> 
<!-- 公共底部 -->


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
       
        /* $(".shipin").prop("src","${ctx}/static/images/play.mp4"); */
        
        function isImage(str){
        	var strArray = [ "bmp","dib","gif","jfif","jpe","jpeg","jpg","png","tif","tiff","ico"];
        	if(str){
        		for(var i =0;i<strArray.length;i++){
        			if(str.indexOf(strArray[i]) != -1){
        				return true;
        			}
        		}
        	}else{
        		return false;
        	}
        	return false;
        }
        
        //查询轮播图
        function getBannerList(){
        	$.ajax({
    			url : "${ctx}/frontview/firstpage/getBanner.do",
    			dataType : "json",
    			type : "POST",
    			success : function(result) {
    				if (result.success) {
    					var data=result.list
    					for(var i = 0;i<data.length;i++){
    						if(isImage(data[i].banner_image)){
    							if(i!=0){
    								$("#lunboDiv").append('<div class="item"><img src=\"'+imagePath+data[i].banner_image+'\"/></div');
    							}else{
    								$("#lunboDiv").append('<div class="item active"><img src=\"'+imagePath+data[i].banner_image+'\"/></div');
    							}
    							
    						}else{
    							if(i!=0){
    								$("#lunboDiv").append('<div class="item"><video  src=\"'+imagePath+data[i].banner_image+'\" type="video/mp4" class="shipin" loop controls  id="audio" ></div>');
    							}else{
    								$("#lunboDiv").append('<div class="item active"><video  src=\"'+imagePath+data[i].banner_image+'\" type="video/mp4" class="shipin" loop controls  id="audio" ></div>');
    							}
    							
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
        			$("#shangDiv").append('<a href=${ctx}'+data[i].div_href+'> <div class="cont1 col-md-12 col-xs-12"><div class="news col-md-6 col-sm-6 col-xs-6 "><h2><span>NWES</span>/'
        			+data[i].div_name+'</h2><p>'+data[i].div_content+'</p></div><div class="pic col-md-6 col-sm-6 col-xs-6 ">'
        			+'<img src=\"'+imagePath+data[i].div_image+'\"></div></div></a>')
        		}else if(data[i].div_position == "1" && ($("#zhongDiv").html() == null || $("#zhongDiv").html().length==0)){
                    $("#zhongDiv").append('<a href=${ctx}'+data[i].div_href+'><div class=" cont1 col-md-12 col-xs-12"><div class="news col-md-6 col-sm-6 col-xs-6 "><h2><span>NWES</span>/'
                    +data[i].div_name+'</h2><p>'+data[i].div_content+'</p></div><div class="pic col-md-6 col-sm-6 col-xs-6 ">' 		
                    +'<img src=\"'+imagePath+data[i].div_image+'\"></div></div>')
        		}else if(data[i].div_position == "2" && ($("#xiazuoDiv").html() == null || $("#xiazuoDiv").html().length==0)){
                    $("#xiazuoDiv").append('<dl><dt><img id="img1" src=\"'+imagePath+data[i].div_image+'\"></dt><dd >'+data[i].div_content.slice(0,30)+'<strong>. . .</strong> '+'</dd></dl>')
        		}else if(data[i].div_position == "3" && ($("#xiazhongDiv").html() == null || $("#xiazhongDiv").html().length==0)){
        			$("#xiazhongDiv").append('<dl><dt><img id="img2"  src=\"'+imagePath+data[i].div_image+'\"></dt><dd>'+data[i].div_content.slice(0,30)+'<strong>. . .</strong>'+'</dd></dl>')
        		}else if(data[i].div_position == "4" && ($("#xiayouDiv").html() == null || $("#xiayouDiv").html().length==0)){
        			$("#xiayouDiv").append('<dl><dt><img id="img3" src=\"'+imagePath+data[i].div_image+'\"></dt><dd>'+data[i].div_content.slice(0,30)+'<strong>. . .</strong>'+'</dd></dl>')
        		}
        	}
        }

   /*    $(function(){
           var oBox=document.getElementById('xiazuoDiv');
           var demoHtml = oBox.innerHTML.slice(0,0)+'...';
           oBox.innerHTML = demoHtml;
       });*/
    </script>
</body>
</html>
