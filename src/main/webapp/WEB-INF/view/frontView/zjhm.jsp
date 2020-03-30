<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/static/frontView/header.jsp"%>
	<link rel="stylesheet" href="${ctx}/static/css/zjhm.css">
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
                <%@ include file="/static/frontView/navigation.jsp"%>
        </div>
        </div>
	</div>
	<div class="container contert">
		<div class="row">
			<div class="hmfir col-md-4 col-sm-4 col-xs-4">
					<div class="title">
						<img src="${ctx}/static/images/home.png" class="hmzj"><a href="${ctx}/proscenium/zjhm.do?id=1"><span style="font-size: 20px;">走进华脉</span></a><%-- <img src="${ctx}/static/images/rig.png"><span>集团简介</span> --%>
					</div>
					<div class="gp">
						股票代码
					</div>
					<div class="number1">
						603042
					</div>
					<div class="gsgk">
					    <h4>公司概况</h4>
					    <p class="a1"><span>20</span>年的发展</p>
					    <p class="a1"><span>31</span>个办事处</p>
					    <p class="a2"><span>1500</span>多名员工</p>
					</div>
					<div class="ppjz">
					    <h4>品牌价值</h4>
					    <p class="a1"><span>1998</span>年创建公司</p>
					    <p class="a2"><span>13867</span>万注册资金</p>
					    <p class="a3"><span>2017</span>公司挂牌上市</p>
					</div>
					<div class="qyry">
					    <h4>企业荣誉</h4>
					    <p class="a1">高科技成长创新型百优企业</p>
					    <p class="a2">江苏省科技创业企业</p>
					    <p class="a3">南京市市级企业技术中心</p>
					</div>
			</div>
			<div class="right col-md-8 col-sm-8 col-xs-8">
				<div style="padding:20px;">
					 <%--  <h1>${entity.sectionname }</h1> --%>
				${entity.companyintroduction }</div>
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
	
	$
	</script>
</body>
</html>