<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/static/frontView/header.jsp"%>
<link rel="stylesheet" href="${ctx}/static/css/tzzgx.css">

<link rel="stylesheet" type="text/css"
	href="${ctx}/static/css/details.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/all.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/static/css/paging.css">
<!-- js -->
<script type="text/javascript" src="${ctx}/static/js/details.js"></script>
<script type="text/javascript" src="${ctx}/static/js/paging.js"></script>
<style type="text/css">
.myclass{
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-box-orient: vertical; 
    -webkit-line-clamp: 4;
}
.biaoti{
	width: 111%;
    text-align: center;
    padding-top: 20px;
    font-size: 27px;
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


	<div class="container contert">
		<div class="row">
			<div class="hmfir col-md-4 col-sm-4 col-xs-4"  id="youbian">
				<div class="title">
					<img src="${ctx}/static/images/home.png" class="hmzj"> <a
						href="${ctx}/proscenium/tzzgx.do?type=2"><span style="font-size: 20px;">投资者关系</span></a><img style="margin-right: -13px;
    margin-left: -9px;"
						src="${ctx}/static/images/rig.png"><span id = "titlename" name=2>定期报告</span>
				</div>
				<div class="snw">
				    <p style="cursor: pointer;" id="itemid1" name=2 onclick="clickFun(this)" >定期报告</p>
					<p style="cursor: pointer;" id="itemid1" name=3 onclick="clickFun(this)" >公告</p>
					<p style="cursor: pointer;" id="itemid2" name=4 onclick="clickFun(this)" >制度</p>
					<p style="cursor: pointer;"  ><a href="http://sns.sseinfo.com/company.do?uid=93066">投资者互动平台</a></p>
				</div>
			</div>
			<div class="right col-md-8 col-sm-8 col-xs-8">
				<div class="dqbg">
				<div id="dataContent">
                   </div>

					<div id="page" class="page_div" >
						<input type="hidden" name='current_page' id="current_page" value='1'> 
						<input type="hidden" name='total_page' id="total_page" value=''>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 公共底部 -->
	<%@ include file="/static/frontView/footer.jsp"%>
	<!-- 公共底部 -->
	</div>
	<script type="text/javascript">
	
		var pagenum = 5;
		var pages;
		//默认类型 
		var type 
		$(document).ready(function() {
			$(document).off('click.bs.dropdown.data-api');
			if( ${type} !="" || ${type} !=null || ${type} != undefined ){
				type =${type};
			}
			if(type==2){
				
			}else if(type==3){
				$("#titlename").text("公告");
				$("#titlename").attr("name",3);
				$("#dataContent").empty();
			}else if(type==4){
				$("#titlename").text("制度");
				$("#titlename").attr("name",4);
				$("#dataContent").empty();
			}
			getCount(type);
        });
       
		//获取总条数
		function getCount(type) {
			$.ajax({
				url : "${ctx}/frontview/firstpage/getInvestorCount.do",
				dataType : "json",
				data : {
					"type" : type
				},
				async : false,
				type : "POST",
				success : function(result) {
					if (result.record == 0) {
						$("#page").css("display","block");
						var count = result.count;
						if (count % pagenum > 0) {
							pages = Math.ceil(count / pagenum);
						} else {
							pages = count / pagenum;
						}
						investorList(type,pagenum,1);
						fenPage(1,pages);
					} else {
						alert(result.msg)
						$("#page").css("display","none");
						fenPage(0,0);
					}
				}
			});
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
		//分页查询数据
		function investorList(type,pagenum,pages) {
			$("#dataContent").empty();
			$.ajax({
				url : "${ctx}/frontview/firstpage/getInvestorList.do",
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
					} else {
						/* alert(result.msg) */
						$("#total_page").attr("value",0);
					}
				}
			});
		}
		//显示数据
		function showData(data, type) {
			 if(type ==2 ){
			   $("#dataContent").append('<div class="tit" ><h1>定期报告</h1></div><div id = "litemContent" class="cont"></div>'); 
			   for(var i =0 ;i<data.length;i++){
				   $("#litemContent").append('<div class="lice"><a onclick="showmx(\''+data[i].id+'\')" style="cursor:pointer;" title='+data[i].contentname+'><h3><span class="font"></span>'
					+data[i].contentname+'</h3><div class ="myclass">'+data[i].details+'</div></a></div>'	   
				   )
			   }

			}else if(type==3){
				$("#dataContent").append('<div class="tit" ><h1>公告</h1></div><div id = "litemContent" class="cont"></div>'); 
				   for(var i =0 ;i<data.length;i++){
					   $("#litemContent").append('<div class="lice"><a onclick="showmx(\''+data[i].id+'\')" style="cursor:pointer;" title='+data[i].contentname+'><h3><span class="font"></span>'
						+data[i].contentname+'</h3><div class ="myclass">'+data[i].details+'</div></a></div>'	   
					   )
				   }
			}else if(type==4){
				$("#dataContent").append('<div class="tit" ><h1>制度</h1></div><div id = "litemContent" class="cont"></div>'); 
				   for(var i =0 ;i<data.length;i++){
					   $("#litemContent").append('<div class="lice"><a onclick="showmx(\''+data[i].id+'\')" style="cursor:pointer;" title='+data[i].contentname+'><h3><span class="font"></span>'
						+data[i].contentname+'</h3><div class ="myclass">'+data[i].details+'</div></a></div>'	   
					   )
				   }   
			}

		}
		//点击事件
		function clickFun(obj){
			 type = $(obj).attr("name");
			var title =$(obj).text();
			var oldtitle = $("#titlename").text();
			var oldtype = $("#titlename").attr("name");
			$("#titlename").text(title);
			$("#titlename").attr("name",type);
			$("#dataContent").empty();
			 getCount(type)
		}



		var h; //高度
		var w; //宽度
		function showmx(id){
			$("#litemContent").empty();
			$("#page").css("display","none");


			$.ajax({
				url : "${ctx}/proscenium/getInvestoById.do",
				dataType : "json",
				data : {"id":id},
				type : "POST",
				success : function(result) {
					if (result.record == 0) {
						var data = result.data;
				//		debugger
				//		console.log(data);
						var str = "<div class='biaoti'>"+data.contentname+"</div><hr>";
						$("#litemContent").append(str);
						$("#litemContent").append(data.textcontent);

				//		debugger
						var o = $("#dataContent");
						 h = o.height(); //高度
						 w = o.width(); //宽度
						console.log(h);
						console.log(w);
						$("#youbian").height(h+120);


						<%--<%request.setAttribute(height,h);%>--%>
						<%--<%session.setAttribute("heigth",String.valueOf(h));%>--%>
					} else {

					}
				}
			});
		}



	</script>
</body>
</html>