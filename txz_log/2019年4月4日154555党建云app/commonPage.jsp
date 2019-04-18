<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.sinokj.common.util.WebUtil"%>
<%
	String path = request.getContextPath();
	/* String basePath = "http://192.168.1.252:8099/"; */
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<base href="<%=basePath%>"/>
	<!-- meta使用viewport以确保页面可自由缩放 -->
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!-- 引入 jQuery Mobile 样式 -->
	<link rel="stylesheet"
		href="<%=basePath%>/js/jquery-mobile/jquery.mobile-1.4.5.min.css"/>
	<link rel="stylesheet"
		href="<%=basePath%>/js/jquery-mobile/flatui/jquery.mobile.flatui.css"/>
	<!-- 引入 jQuery 库 -->
	<script src="<%=basePath%>/js/jquery/jquery-1.7.2.min.js"></script>
	<!-- 引入 jQuery Mobile 库 -->
	<script src="<%=basePath%>/js/jquery-mobile/jquery.mobile-1.4.5.min.js"></script>
	<script src="<%=basePath%>/js/date_format.js"></script>
	<style type="text/css">
		p.sansserif{
					    font-size: 24px;
					    font-weight: bold;
					    line-height: 38px;
					    margin-top: 40px;
						}
		p.titer{ color: #333;
					    font-size: 16px;
					    margin: 0 5px;
					    }
		.title{
			width: 95%;
		    margin: 1rem auto;
		    text-align: center;
		    font-size: x-large;
		    font-weight: bold;
		}
		.time{
			width: 95%;
		    margin: auto;
		    color: darkgrey;
		    font-size: small;
		}
		/* .type{
			    float: right;
			    margin-right: 8px;
			    border: 1px solid red;
			    border-radius: 5px;
			    padding: 0 .5rem;
			    color: red;
		} */
	</style>
	<script type="text/javascript">
			var nReadTiming=0;
			var nId;
			var nCommitteeId = ${nCommitteeId};
			$(function() {
				nId = ${result.nId};
				nReadTiming = ${result.nReadTiming};
				if(nCommitteeId == 2){
					readArticle();
				}else{
					window.setTimeout("readArticle()",nReadTiming * 1000);
				}
				
			});	
			
			function readArticle(){
				$.ajax({
					type:"POST",
					async: false,
					url:  '<%=basePath%>article/readArticle.do?nId=' + nId + '&nComminttedID=' + nCommitteeId,
					success: function(data){
						if(data.nRes == 1){
							if(nReadTiming == 0 || nCommitteeId == 2){
							}else{
								//alert("您已完成此篇文章的阅读！");
							}
						}
					}
				});				
			}
	</script>
</head>
<body id="contain" style="overflow-y:auto; overflow-x:hidden;">
		 <div class="title" style="text-align:left">
		 <span style="font-size: 20px;">${result.vcTitle}</span>
		 </div>
		<div class="time"><span >${result.nclick}</span><span style="margin-left:.5rem;">阅读</span><span style="margin-right:8px;float:right;">${dtReg }</span>

		</div> 
		<div id = "myInfo" style="margin:8px auto 40px auto;width: 95%;">
			${result.vcContent}
		</div>
</body>
</html>
