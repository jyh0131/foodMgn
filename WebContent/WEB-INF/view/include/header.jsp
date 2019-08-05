<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식점 관리 프로그램</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(function() {
		$("#head2 li").hover(function() {
			$(this).find(".submenu").stop().slideDown(100)
		}, function() {
			$(this).find(".submenu").stop().slideUp(100)
		})
	})
</script>
</head>
<body>
	<div id="container">
		<header>
			<div id="header">
				<div id="head1">
					<div id="head1_1">
						<a href="">
							<div class="sns">
								<img src="${pageContext.request.contextPath}/images/include/sns_face.png">
							</div>
						</a>
						<a href="">
							<div class="sns">
								<img src="${pageContext.request.contextPath}/images/include/sns_insta.png">
							</div>
						</a>
					</div>
					<div id="head1_2">
						<ul>
							<li><a href="${pageContext.request.contextPath}">HOME</a></li>
							<li><a href="${pageContext.request.contextPath}/login.do">로그인</a></li>
							<li><a href="${pageContext.request.contextPath}/join.do">회원가입</a></li>
						</ul>
					</div>
				</div>
				<div id="head2">
					<div id="head2_1">
						<ul>
							<li><a href="${pageContext.request.contextPath}/introduce.do">INTRODUCE</a></li>
							<li class="center">
								<a href="${pageContext.request.contextPath}/menu.do">MENU</a>
								<ul class="submenu">
									<li><a href="${pageContext.request.contextPath}/menu.do">PASTA</a></li>
									<li><a href="${pageContext.request.contextPath}/menu.do">STEAK & CUTLET</a></li>
									<li><a href="${pageContext.request.contextPath}/menu.do">PILAF & RISOTTO</a></li>
									<li><a href="${pageContext.request.contextPath}/menu.do">SALAD</a></li>
									<li><a href="${pageContext.request.contextPath}/menu.do">SIGNATURE PIZZA</a></li>
									<li><a href="${pageContext.request.contextPath}/menu.do">PIZZA</a></li>
									<li><a href="${pageContext.request.contextPath}/menu.do">SIDE MENU</a></li>
									<li><a href="${pageContext.request.contextPath}/menu.do">BEVERAGE & BEER</a></li>
								</ul>
							</li>
							<li class="right">
								<a href="">COMMUNITY</a>
								<ul class="submenu">
									<li><a href="">공지사항</a></li>
								</ul>
							</li>
						</ul>
					</div>
					<div id="head2_2">
						<a href="${pageContext.request.contextPath}">
							<img src="${pageContext.request.contextPath}/images/include/logo.png">
						</a>
					</div>
					<div id="head2_3">
						<ul>
							<li><a href="">RESERVATION</a></li>
							<li class="center2"><a href="">DELIVERY</a></li>
							<li class="right2"><a href="${pageContext.request.contextPath}/derection.do">DERECTION</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</header>
