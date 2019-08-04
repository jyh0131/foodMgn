<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
}

#footerWrap {
	width: 100%;
	height: 262px;
	background-color: black;
}

#footerWrap .footer {
	width: 1050px;
	height: 262px;
	margin: 0 auto;
	overflow: hidden;
	position: relative;
}

#footerWrap .f_gnb {
	overflow: hidden;
	padding-top: 50px;
	margin-bottom: 20px;
}

#footerWrap .f_gnb li {
	float: left;
}

#footerWrap .f_gnb li img {
	width: 90%;
}

#footerWrap .footer .f_logo {
	display: inline-block;
	float: left;
}

.footer .copy_clear{
	float:left;
	font-size:12px;
	color: white;
	margin-left: 30px;
}
.footer .copy_clear a{
	color:white;
	text-decoration: none;
}

.footer .toTop{
	position: absolute;
	right: 10px;
	top:20px;
	width: 51px;
	height: 51px;
}

.footer #f_sns{
	position: absolute;
	bottom: 60px;
	right: 5px;
	
}
</style>
</head>
<body>
	<div id="footerWrap">
		<div class="footer">
		<div class="toTop"><a href="#"><img src="${pageContext.request.contextPath}/images/include/top.png" alt="위로"></a></div>
			<ul class="f_gnb">
				<li><img src="${pageContext.request.contextPath}/images/include/footer_img_1.png" alt=""></li>
				<li><img src="${pageContext.request.contextPath}/images/include/footer_img_2.png" alt=""></li>
				<li><img src="${pageContext.request.contextPath}/images/include/footer_img_3.png" alt=""></li>
			</ul>
			<h1 class="f_logo">
				<img src="${pageContext.request.contextPath}/images/include/f_logo.gif" alt="라라코스트">
			</h1>
			<div class="copy_clear">
				<a href="#">개인정보처리방침</a>&nbsp;&nbsp;│&nbsp;&nbsp;<a href="#">이메일무단수집거부</a><br>
				상호명: (주)라라에프앤비&nbsp;&nbsp;│&nbsp;&nbsp;F&amp;B대표:
				안영진&nbsp;&nbsp;│&nbsp;&nbsp;사업자등록번호 :
				552-88-00775&nbsp;&nbsp;│&nbsp;&nbsp;고객센터 : 070-8884-3235<br>
				사업장소재지: 대구광역시 수성구 들안로 33-1 3층 일부, 4층&nbsp;&nbsp;│&nbsp;&nbsp;서울본부 :
				서울특별시 영등포구 당산로 41길 11, 더블유 601호<br> CopyrightⓒRARACOST All
				rights Reserved.
			</div>
			<div id="f_sns">
				<a href="#"><img src="${pageContext.request.contextPath}/images/include/footer_sns_1.png"></a>
				<a href="#"><img src="${pageContext.request.contextPath}/images/include/footer_sns_2.png"></a>
			</div>
		</div>
	</div>
</body>
</html>