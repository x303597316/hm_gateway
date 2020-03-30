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
    <link rel="stylesheet" type="text/css" href="${ctx}/static/plugins/ztree/zTreeStyle.css">
    <!-- js -->
    <%-- <script type="text/javascript" src="${ctx}/static/js/details.js"></script> --%>
    <script type="text/javascript" src="${ctx}/static/js/paging.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/ipconfig.js"></script>
    <style type="text/css">
* {
	margin: 0;
	padding: 0;
}



.zt {
	width: 800px;
	height: 600px;
	position: absolute;
	top: 50%;
	margin-top: -300px;
	left: 50%;
	margin-left: -400px;
}

/*  */
.ztree * {
	font-size: 14px;

}

.ztree li ul {
	margin: 0;
	padding: 0
}

.ztree li {
	line-height: 30px;
	font-size: 18px;
}

.ztree li a {
	width: 200px;
	height: 34px;
	padding-top: 0px;
}

.ztree li a:hover {
	text-decoration: none;
	background-color: #E7E7E7;
}

.ztree li a span.button.switch {
	visibility: hidden
}

.ztree.showIcon li a span.button.switch {
	visibility: visible
}

.ztree li a.curSelectedNode {
	background-color: #D4D4D4;
	border: 0;
	height: 30px;
}

.ztree li span {
	line-height: 30px;
}

.ztree li span.button {
	margin-top: -7px;
}

.ztree li span.button.switch {
	width: 16px;
	height: 16px;
}

.ztree li a.level0 span {
	font-size: 18px;
	/*font-weight: bold;*/
}

.ztree li span.button {
	background-image: url("${ctx}/static/images/left_menuForOutLook.png");
	*background-image: url("${ctx}/static/images/left_menuForOutLook.gif")
}

.ztree li span.button.switch.level0 {
	width: 20px;
	height: 20px
}

.ztree li span.button.switch.level1 {
	width: 20px;
	height: 20px
}

.ztree li span.button.noline_open {
	background-position: 0 0;
}

.ztree li span.button.noline_close {
	background-position: -18px 0;
}

.ztree li span.button.noline_open.level0 {
	background-position: 0 -18px;
}

.ztree li span.button.noline_close.level0 {
	background-position: -18px -18px;
}
/*  */
.nav_right_boxs {
    padding-top: 10px;
    height:auto;
    }
    
.img_bg1 {
margin-top:10px;
}
.nav_right_boxss{
	margin:0;
}

.nav_right_boxss_p1 {
	width:100%;
	line-height:1.3;
	display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    overflow: hidden;
    position:relative;
	height: 131px;
}
.nav_right_boxss_p1:after {
        content: '';
        text-align: right;
        position: absolute;
        bottom: 0;
        right: 0;
        width: 10%;
        height: 1.05em;
        background: linear-gradient(to right, rgba(255, 255, 255, 0), rgba(255, 255, 255, 1) 50%);
    }
    .content_top{
    	  margin-bottom: 10px;
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
                        <%@ include  file="/static/frontView/search.jsp"%>
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

				<div class="content_nav">
					<div class="content_nav_left" id="plt">
						<p class="content_top">
							<i class="home"></i>
							<span style="font-size: 20px;color:#434343; ">产品中心</span>
						</p>
					<ul id="ztree" class="ztree"></ul>

					</div>
					<div class="content_nav_right" id="chan">
						<c:if test="${empty entity}"> <%--entity 包含Product 和 ProductList entity为空就是id，不存在（没有点击产品）--%>
							<div class="nav_right_box" >
							<c:forEach var="item" items="${entityList }">
								<div class="nav_right_boxs">
									<img class="img_bg1" src="${imagePath}${item.img}" alt="">
									<div class="nav_right_boxss" onclick="redirect(${item.id});">
										<p class="nav_right_boxss_p">${item.productname }</p>
										<p class="nav_right_boxss_p1" >${item.describe }</p>
										<span><a href="${ctx}/proscenium/cpzx.do?id=${item.id}" style="color:#ADD8E6">更多>></a></span>
									</div>
								</div>
							</c:forEach>
							</div>
						</c:if>
						<c:if test="${empty entityList}"> <%--直接点击一个 entity为entity--%>
							<p class="content_nav_right_p">${entity.productname}</p>
							<c:if test="${!empty  entity.img}">
								<img class="img_bg" src="${imagePath}${entity.img}" alt="">
							</c:if>
							<div class="img_bg_text">
								<p class="img_bg_text_p"><b>概述：</b></p>
								<p class="img_bg_text_p"><span style="display:block;text-indent:4.5em;">${entity.describe}</span></p>
								<c:if test="${empty entity.nodelist }"> <%--没有子节点就没有特点--%>
									<p class="img_bg_text_p"><b>特点：</b></p>
									<p class="img_bg_text_p"><span style="display:block;text-indent:4.5em;">${entity.point}</span></p>
									${entity.summary }
								</c:if>
							</div>
							<c:if test="${!empty entity.nodelist }"> <%--如果有子节点--%>
							<div class="nav_right_box">
							<c:forEach var="item" items="${entity.nodelist }">
								<div class="nav_right_boxs" onclick="redirect(${item.id});">
									<img class="img_bg1" src="${imagePath}${item.img}" alt="">
									<div class="nav_right_boxss">
										<p class="nav_right_boxss_p">${item.productname }</p>
										<p class="nav_right_boxss_p1" >${item.describe }</p><span><a href="${ctx}/proscenium/cpzx.do?id=${item.id}" style="color:#ADD8E6">更多>></a></span>
									</div>
								</div>
							</c:forEach>
							</div>
							</c:if>
						</c:if>
					</div>
				</div>
			</div>

<!-- 公共底部 -->        
<%@ include file="/static/frontView/footer.jsp"%> 
<!-- 公共底部 -->
</div>
<script type="text/javascript" src="${ctx}/static/plugins/ztree/jquery.ztree.all-3.5.js"></script>
<script type="text/javascript">
var zNodes=1;
var zTree = $("#ztree");
	 $(document).ready(function(){
        $(document).off('click.bs.dropdown.data-api');
        
        $.post("${ctx}/proscenium/productList.do", function(e) {
            zNodes=JSON.parse(e).data;
            zTree = $.fn.zTree.init(zTree, setting, zNodes);
            //加载完内容，获取内容高度
	//		debugger
			var h =$("#chan").height();
			//console.log(h);
			if(h<=1300){
				$("#plt").height(1309);
			}else {
				$("#plt").height(h+400);
			}




        });
        
	 	var current_page = $("input[name='current_page']").val();
	    var total_page = $("input[name='total_page']").val();
	    var a = parseInt(current_page);
	    var b = parseInt(total_page);
	    //分页
	    $("#page").paging({
	        pageNo: a,
	        totalPage: b,
	        // totalSize: 300,
	        callback: function (num) {
	            // alert(num)
	        }
	    })


        });
	 
	 function redirect(id){
			window.location.href="${ctx}/proscenium/cpzx.do?id="+id;
			/*debugger
			var h =$("#chan").height;
		    console.log(h);*/

		}
			
	 var setting = {
				view: {
		            dblClickExpand: false,
		            showLine: false,
		            selectedMulti: false
		        },
		        check: {
		            enable: false,
		            chkStyle: "checkbox",
		        },
		        data: {
		        	key: {
		    			name: "productname"
		    		},
		            simpleData: {
		                enable:true,
		                idKey: "id",
		                pIdKey: "parentid",
		                rootPId: ""
		            }
		        },
		        callback: {
		            onClick: function(event, treeId, treeNode, clickFlag){
		            	window.location.href="${ctx}/proscenium/cpzx.do?id="+treeNode.id;
		            }
		        }
		}

	/*	$(function () {
			debugger
			var h =$("#chan").height();
			console.log(h);

		});*/
	
	</script>
</body>
</html>