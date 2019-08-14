<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
	.s_visu1 {
		width: 100%;
		height: 350px;
	}
	.s_visu1 img{
		width: 100%;
		height: 350px;
	}
	#mainContainer{
		min-width: 1400px;
	}
	#leftUi{
		border:1px solid black;
		float:left;
		width:250px;
		height:600px;
		margin-right:30px;
	}
	#leftUi ul{
		width:250px;
		height:600px;
		background: rgb(0,0,0);
	}
	#leftUi ul li{
		width:250px;
		height:50px;
		line-height:50px;
		border-bottom:1px solid black;
	}
	#leftUi ul li a{
		display: block;
		width:220px;
		height:50px;
		line-height:50px;
		padding-left:30px;
		font-weight: bold;
		color:white;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.css">
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<div class="s_visu1">
	<img src="${pageContext.request.contextPath}/images/main/f_visu4.jpg">
</div>
<div id="mainContainer">
<div id="leftUi">
	<ul>
		<li id="updateMember"><a href="${pageContext.request.contextPath}/my/mypage.do">회원정보수정</a></li>
		<li id="searchRsv2"><a href="${pageContext.request.contextPath}/my/searchMyRsv.do">예약내역</a></li>	
		<li id="searchPay"><a href="${pageContext.request.contextPath}/my/mypageSaleList.do">결제내역</a></li>		
	</ul>
</div>
