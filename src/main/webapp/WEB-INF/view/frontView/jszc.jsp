<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/static/frontView/header.jsp"%>
    <link rel="stylesheet" href="${ctx}/static/css/jszc.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/paging.css">
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
                     <img src="${ctx}/static/images/home.png" class="hmzj"><a href="${ctx}/proscenium/jszc.do"><span style="font-size: 20px;">技术支持</span></a><img style="margin-right: -8px;" src="${ctx}/static/images/rig.png"><span id="mingcheng">资料下载</span>
                 </div>
                 <div class="snw">
					<p style="cursor: pointer;"  onclick="Jszc(1,1)" >资料下载</p >
					<p style="cursor: pointer;"  onclick="Jszc(2,1)" >软件下载</p >
					<p style="cursor: pointer;"  onclick="Jszc(3,1)" >常见问题</p >
				</div>
            </div>
            
            <div class="right col-md-8 col-sm-8 col-xs-8">
               <div class="tit">
                   <h1 id="h1">资料下载</h1>
                   <div class="zlcon" id="liebiao">
                       
                   </div>
                   <div id="page" class="page_div">
						<input type="hidden" name='current_page' id="current_page" value='1'> 
						<input type="hidden" name='total_page' id="total_page" value=''>
					</div>
            </div>
        </div>
    </div>
    </div>

    <%@ include file="/static/frontView/footer.jsp"%> 
    </div>
    <script type="text/javascript" src="${ctx}/static/js/paging.js"></script>
    <script type="text/javascript">
    	var type = ${type}; 
    	var page = 1;
    	var pagenum = 10;
	    $(document).ready(function(){
            $(document).off('click.bs.dropdown.data-api');
	    	Jszc(type,page);
        });
	    function Jszc(type,page){
	    	$.ajax({
	    		url:"${ctx}/proscenium/paperList.do",
	    		data:{
	    			"page":page,
	    			"limit":pagenum,
	    			"type":type
	    		},
	    		success:function(data){
	    			var resultPage = JSON.parse(data);
	    			var data = resultPage.data;
	    			var count = resultPage.count;
					var html = "";
					if(data!=null&&data!=""){
						for(var i = 0;i< data.length;i++){
							var paper = data[i]
							html += "<p><a href='#' onclick='jtjszc("+paper.id+")'>"+paper.papername+"<span>"+(paper.updatetime).substr(0,10)+"</span></a></p>";
						}
						$("#liebiao").html(html);
					}else{
						$(".zlcon").html("没有数据");
					}
					pageCount(type,count,page);
	    		},
	    	});
    		if(type == 1){
    			$("#mingcheng").html("资料下载");
    			$("#h1").html("资料下载");
    		}else if(type == 2){
    			$("#mingcheng").html("软件下载");
    			$("#h1").html("软件下载");
    		}else{
    			$("#mingcheng").html("常见问题");
    			$("#h1").html("常见问题");
    		}
	    }
	    var pages; 
	    function pageCount(type,count,page){
	    	if (count % pagenum > 0) {
				pages = Math.ceil(count / pagenum);
			} else {
				pages = count / pagenum;
			}
			//分页
			$("#page").paging({
				pageNo : page,
				totalPage : pages,
				callback : function(num) {
					Jszc(type,num);
				}
			})
	    }
    
    
    function jtjszc(id){
    	$.ajax({
	    	url:"${ctx}/proscenium/singlePaper.do",
			type:"POST",
			dataType:"json",
		    data:{
				"id":id
			}, 
			success:function(res){
				$(".zlcon").html("");
				$(".page_div").html("");
				var html="";
				if(res.type==1||res.type==2){
					html+="<p>名称 ："+res.papername+"</p>";
					html+="<p>更新时间 ："+res.updatetime+"</p>";
					html+="<p>类型 ："+res.papertype+"</p>";
					html+="<p>大小 ："+res.papersize+"</p>";
					//html+="<button class='download'";
					html+="<button class='download' style='margin-left: 22px;' onclick=download('"+res.paperurl+"')>下载文件</button>";
					html+="<p>介绍 ： "+res.introduce+"</p>";
				}else{
					html = res.parperContent;
					/* html+="<p>"+res.papername+"</p>";
					html+="<p>更新时间 ："+res.updatetime+"</p>";
					html+="<p>介绍 ： "+res.introduce+"</p>"; */
				}
				$(".zlcon").html(html);
			}
    	})
    } 
    
    function download(filePath){
		var url='${imgPath}'+filePath;
		window.location.href='${ctx}/proscenium/download.do?filePath='+filePath;
    }
    </script>
</body>
</html>