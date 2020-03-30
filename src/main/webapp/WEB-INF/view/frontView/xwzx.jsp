<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/static/frontView/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/details.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/all.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/paging.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/cpzx.css">
    <!-- js -->
    <script type="text/javascript" src="${ctx}/static/js/details.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/paging.js?v=2"></script>
    <style type="text/css">
    	.zt_box{
    		overflow:hidden;
		}
		.zt_box p{
			float:left;
		}
    </style>
</head>
<body style="font-size:14px;">
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

    <div class="content">
        <p class="content_top">


        </p>
        <div class="content_nav">
            <div class="content_nav_left" id="xinwen">
                <div>  <i class="home"></i>
                    <span >新闻中心</span>
                </div>

                <div style="padding-top: 15px;">
                    <div class="nav_left_text">
                        <p class="nav_left_texts"><a href="${ctx}/proscenium/xwzx.do?newType=1" style="font-size: 14px;margin-left: 10px;line-height: 35px">公司新闻</a></p>
                    </div>
                    <div class="nav_left_text">
                        <p class="nav_left_texts"><a href="${ctx}/proscenium/xwzx.do?newType=2" style="font-size: 14px;padding-left: 10px;line-height: 35px">行业动态</a></p>
                    </div>
                    <div class="nav_left_text">
                        <p class="nav_left_texts"><a href="${ctx}/proscenium/xwzx.do?newType=3" style="font-size: 14px;padding-left: 10px;line-height: 35px">展会信息</a></p>
                    </div>
                    <div class="nav_left_text">
                        <p class="nav_left_texts"><a href="${ctx}/proscenium/xwzx.do?newType=4" style="font-size: 14px;padding-left: 10px;line-height: 35px">员工活动</a></p>
                    </div>
                </div>
            </div>
            <div class="content_nav_right">
                <div class="nav_right_box" >
	                <!-- <div id="newsContent">
	                </div>
                    <div id="page" class="page_div">
                        <input  name='current_page' id="current_page" value='1'>
                        <input  name='total_page' id="total_page" value='30'>
                    </div> -->
                </div>
            </div>
        </div>
    </div>
<!-- 公共底部 -->        
<%@ include file="/static/frontView/footer.jsp"%> 
<!-- 公共底部 -->
</div>
<script type="text/javascript">
var htmlDiv = "<div id='newsContent' ></div><div id='page' class='page_div'><input  name='current_page' id='current_page' value='1'><input  name='total_page' id='total_page' value='30'></div></div>";

var type=1;
var pagenum = 8;
var pages;
if(getQueryString("newType")){
	type= getQueryString("newType");
}
	 $(document).ready(function(){
        $(document).off('click.bs.dropdown.data-api');
        getCount(type);
        });
	 
	 function getCount(vtype){
		 $(".nav_right_box").html("");
		 $(".nav_right_box").append(htmlDiv);
		 $.ajax({
				url : "${ctx}/proscenium/pageCount.do",
				dataType : "json",
				data : {
					"type" : type
				},
				async : false,
				type : "POST",
				success : function(result) {
					if (result.code == 0) {
						var count = result.data;
						if(count ==0){
							fenPage(0,0);
						}else{
							if (count % pagenum > 0) {
								pages = Math.ceil(count / pagenum);
							} else {
								pages = count / pagenum;
							}
							investorList(type,pagenum,1);
							fenPage(1,pages);
						}
						
					}  else {
						fenPage(0,0);
					} 
				}
			});
	 }
	//分页查询数据
		function investorList(type,pagenum,pages) {
			$("#newsContent").empty();
			$.ajax({
				url : "${ctx}/proscenium/pageNews.do",
				dataType : "json",
				data : {
					"type" : type,
					"pagenum":pagenum*(pages-1),
					"size":pages*(pagenum),
				},
				type : "POST",
				success : function(result) {
					if (result.record == 0) {
						var data = result.data;
						showData(data,type);
					}  else {
						$("#total_page").attr("value",0);
					} 
				}
			});
		}
	
		//显示数据
		function showData(data, type) {
            debugger
            console.log(data);
				 var str = "";
     			$.each(data,function(i,val){

     				str += "<div class='nav_right_boxs'>";
                    str += "<img class='img_bg1' src='${imagePath}/gateway/banner"+val.imgurl+"' alt=''>";
     				str += "<div class='nav_right_boxss'>";

                    str += "<div>";
     				str += "<p class='nav_right_boxss_p' onclick='getDetail("+val.id+")'>"+val.title+"</p>";
     				str += "<p class='nav_right_boxss_p1'>"+val.present.slice(0,31).concat(". . . ")+"<span style='float: right;' onclick='getDetail("+val.id+")'>"+"<strong style='font-weight: 900;'> . </strong> "+val.createtime.slice(0,10)+"</span></p>";
     				/*str += "<p class='showtime'>"+ val.createtime+"</p>";*/
                    str += "</div >";
     				str += "</div>";
     				str += "</div>";
     			})
                 $("#newsContent").append(str);
     			debugger
     			var h =$(".nav_right_box").height();
     			console.log(h);
            if(h<1300){
                $("#xinwen").height(1309);
            }else {
                $("#xinwen").height(h+78);
            }


        }
		
		function fenPage(current_page,total_page) {
			var a = parseInt(current_page);
			var b = parseInt(total_page);
			//分页
			$("#page").paging({
				pageNo : a,
				totalPage : b,
				callback : function(num) {
					if( total_page!=0 && total_page != undefined && total_page != null ){
						investorList(type,pagenum,num)
					}
				}
			})
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
		
	//显示新闻详情
	function getDetail(index){
		$.ajax({
			url:"${ctx}/proscenium/getNewsDetail.do",
			type:"post",
			dataType:"json",
			data:{"id":index},
			success:function(result){
				$(".nav_right_box").html("");
				var str = "";
				str += "<div style='text-align:center;'><h2 style='font-family:\"Microsoft YaHei\",微软雅黑,\"MicrosoftJhengHei\",华文细黑,STHeiti,MingLiu;  font-size: 28px;'>"+result.data.title+"</h2>";
				str += "<br />";
			/*	str += "<div class='zt_box' ><p style='margin-left:330px'>浏览次数："+result.data.visittime+"</p><p style='float:right;  font-size: 16px;'><strong>.</strong>  "+result.data.createtime+"</p></div>";*/
                str += "<div class='zt_box' ><p style='float:right;  font-size: 16px;'><strong style='font-size: 18px;'>.   </strong>  "+result.data.createtime+"</p></div>";
                str += "<hr />";
				str += result.data.content;
				str += "</div>";
				$(".nav_right_box").append(str);

        //        debugger
                var h=$(".nav_right_box").height();
                console.log(h);
                if(h<1300){
                    $("#xinwen").height(1309);
                }else {
                    $("#xinwen").height(h+120);
                }




			}
		});
	}
			
	
	</script>
</body>
</html>