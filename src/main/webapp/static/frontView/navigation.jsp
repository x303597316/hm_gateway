<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

             <ul class="nav navbar-nav mainNav col-md-12 col-xs-12">
                 <li class="first col-md-1 col-xs-1 col-sm-1">
                     <a href="${ctx}/proscenium/index.do" class="dropdown-toggle" data-toggle="dropdown">首页</a>
                 </li>
                 <li class="col-md-1 col-xs-1 col-sm-1">
                     <a href="${ctx}/proscenium/zjhm.do?id=1" class="dropdown-toggle" data-toggle="dropdown">走进华脉</a>
                     <ul class="dropdown-menu">
                         <li><a href="${ctx}/proscenium/zjhm.do?id=1" style="margin: 5px">集团介绍</a></li>
                         <li><a href="${ctx}/proscenium/zjhm.do?id=2" style="margin: 5px">社会职能</a></li>
                         <li><a href="${ctx}/proscenium/zjhm.do?id=3" style="margin: 5px">组织架构</a></li>
                         <li><a href="${ctx}/proscenium/zjhm.do?id=4" style="margin: 5px">资质荣誉</a></li>
                         <li><a href="${ctx}/proscenium/zjhm.do?id=5" style="margin: 5px">公司视频</a></li>
                         <li><a href="${ctx}/proscenium/lxwm.do" style="margin: 5px">联系我们</a></li>
                     </ul>
                 </li>
                 <li class="col-md-1 col-xs-1 col-sm-1">
                     <a href="${ctx}/proscenium/cpzx.do" class="dropdown-toggle" data-toggle="dropdown"   > 产品中心</a>
                     <ul class="dropdown-menu cpzxnav" style="height: 200px;   margin-left: -375px;   width: 1370px;">
                         
                     </ul>
                 </li>
                 <li class="col-md-1 col-xs-1 col-sm-1">
                     <a href="${ctx}/proscenium/jjfa.do?type=1" class="dropdown-toggle" data-toggle="dropdown">解决方案</a>
                     <ul class="dropdown-menu jjfanav"style="height: 135px;    width: 603px;">
                         <li><a href="${ctx}/proscenium/jjfa.do?type=1">光接入</a>
	                         <ul id="l1">
	                         </ul>
                         </li>
                         <li><a href="${ctx}/proscenium/jjfa.do?type=2">节能环保</a>	
	                         <ul id="l2">
	                         </ul>
                         </li>
                         <li><a href="${ctx}/proscenium/jjfa.do?type=3">数据中心</a>
	                         <ul id="l3">
	                         </ul>
                         </li>
                         <li><a href="${ctx}/proscenium/jjfa.do?type=4" class="zngx">智能光线路管理系统</a>
	                         <ul id="l4">
	                         </ul>
                         </li>
                     </ul>
                 </li>
                 <li class="col-md-1 col-xs-1 col-sm-1">
                     <a href="${ctx}/proscenium/jszc.do" class="dropdown-toggle" data-toggle="dropdown">技术支持</a>
                     <ul class="dropdown-menu">
                         <li style="margin: 5px;"><a href="${ctx}/frontview/mobile/toPaper.do">资料下载</a></li>
                         <li style="margin: 5px;"><a href="${ctx}/frontview/mobile/toruanjian.do">软件下载</a></li>
                         <li style="margin: 5px;"><a href="${ctx}/href/downGo/vDowngo.do">内部资料下载</a></li>
                         <li style="margin: 5px;"><a href="${ctx}/frontview/mobile/toProblem.do">常见问题</a></li>
                     </ul>
                 </li>
                 <li class="col-md-1 col-xs-1 col-sm-1">
                     <a href="${ctx}/proscenium/yxwl.do?op=1" class="dropdown-toggle" data-toggle="dropdown">营销网络</a>
                     <ul class="dropdown-menu">
                         <li style="margin: 5px;"><a href="${ctx}/proscenium/yxwl.do?op=1">国内网络</a></li>
                         <li style="margin: 5px;"><a href="${ctx}/proscenium/yxwl.do?op=2">国际网络</a></li>
                     </ul>
                 </li>
                 <%-- <li class="col-md-1 col-xs-1 col-sm-1">
                     <a href="${ctx}/proscenium/xwzx.do" class="dropdown-toggle" data-toggle="dropdown">新闻中心</a>
                     <ul class="dropdown-menu">
                         <li><a href="#">公司新闻</a></li>
                         <li><a href="#">行业动态</a></li>
                         <li><a href="#">展会信息</a></li>
                         <li><a href="#">员工活动</a></li>
                     </ul>
                 </li> --%>
                 <li class="col-md-1 col-xs-1 col-sm-1">
                     <a href="${ctx}/proscenium/tzzgx.do?type=2" class="dropdown-toggle" style="width: max-content;" data-toggle="dropdown">投资者关系</a>

                     <ul class="dropdown-menu tzzgx">
                         <li ><a href="${ctx}/proscenium/tzzgx.do?type=2">定期报告</a></li>
                         <li ><a href="${ctx}/proscenium/tzzgx.do?type=3">公告</a></li>
                         <li ><a href="${ctx}/proscenium/tzzgx.do?type=4">制度</a></li>
                         <li ><a href="http://sns.sseinfo.com/company.do?uid=93066">投资者互动平台</a></li>
                     </ul>
                 </li>
                 <li class="col-md-1 col-xs-1 col-sm-1">
                     <a href="${ctx}/proscenium/ContactUs.do" class="dropdown-toggle" data-toggle="dropdown">联系我们</a>
                 </li>
                 <li class="col-md-1 col-xs-1 col-sm-1">
                     <a href="${ctx}/proscenium/zxns.do" class="dropdown-toggle" data-toggle="dropdown">招贤纳士</a>
                     <ul class="dropdown-menu">
                         <li style="margin: 5px;"><a href="${ctx}/frontview/mobile/toSheHuiPage.do">社会招聘</a></li>
                         <li style="margin: 5px;"><a href="${ctx}/frontview/mobile/toSchoolPage.do">校园招聘</a></li>
                     </ul>
                 </li>
             </ul>
<script type="text/javascript">

	$.ajax({
		url:"${ctx}/proscenium/navigation.do",
		type:"post",
		dataType:"json",
		success:function(data){
			
			console.log(data)
			var result=$(".cpzxnav");
			var str = "";
			$.each(data.data,function(i,val){
				str += "<li><a href='${ctx}/proscenium/cpzx.do?id="+val.id+"'><b>"+val.productname+"</b></a><ul>"; 
				 $.each(val.nodelist,function(i,item){
					str+="<li style='float:none;text-align:left;margin-top:5px;'><a href='${ctx}/proscenium/cpzx.do?id="+item.id+"'>"+item.productname+"</a></li>";
				}); 
				str += "</ul ></li>";
			});
			result.append(str);
		}
	});
	
	$.ajax({
		url:"${ctx}/proscenium/jjfanavigation.do",
		type:"post",
		dataType:"json",
		success:function(e){
			var l1=$("#l1"),l2=$("#l2"),l3=$("#l3"),l4=$("#l4");
			var str1="",str2="",str3="",str4="";
			$.each(e.data.list1,function(i,val){
				str1 += "<li style='float:none;margin-top:5px;'><a href='${ctx}/proscenium/jjfa.do?id="+val.id+"'>"+val.solutionname+"</a></li>";
			});
			l1.append(str1);
			$.each(e.data.list2,function(i,val){
				str2 += "<li style='float:none;margin-top:5px;'><a href='${ctx}/proscenium/jjfa.do?id="+val.id+"'>"+val.solutionname+"</a></li>";
			});
			l2.append(str2);
			$.each(e.data.list3,function(i,val){
				str3 += "<li style='float:none;margin-top:5px;'><a href='${ctx}/proscenium/jjfa.do?id="+val.id+"'>"+val.solutionname+"</a></li>";
			});
			l3.append(str3);
			$.each(e.data.list4,function(i,val){
				str4 += "<li style='float:none;margin-top:5px;'><a href='${ctx}/proscenium/jjfa.do?id="+val.id+"'>"+val.solutionname+"</a></li>";
			});
			l4.append(str4);
		}
	});
</script>

