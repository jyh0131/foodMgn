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
		<header>
			<div id="header">
				<div id="head1">
					<div id="head1_1">
						<div class="sns">
							<a href="">
								<img src="${pageContext.request.contextPath}/images/include/sns_face.png">
							</a>	
						</div>
						<div class="sns">
							<a href="">
								<img src="${pageContext.request.contextPath}/images/include/sns_insta.png">
							</a>
						</div>
					</div>
					<div id="head1_2">
						<ul>
							<li><a href="">HOME</a></li>
							<li><a href="">로그인</a></li>
							<li><a href="">회원가입</a></li>
						</ul>
					</div>
				</div>
				<div id="head2">
					<div id="head2_1">
						<ul>
							<li><a href="">INTRODUCE</a></li>
							<li class="center">
								<a href="">MENU</a>
								<ul class="submenu">
									<li><a href="">STEAK & CUTLET</a></li>
									<li><a href="">PASTA</a></li>
									<li><a href="">PILAF & RISOTTO</a></li>
									<li><a href="">SALAD</a></li>
									<li><a href="">SIGNATURE PIZZA</a></li>
									<li><a href="">PIZZA</a></li>
									<li><a href="">SIDE MENU</a></li>
									<li><a href="">BEVERAGE & BEER</a></li>
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
						<a href="">
							<img src="${pageContext.request.contextPath}/images/include/logo.png">
						</a>
					</div>
					<div id="head2_3">
						<ul>
							<li><a href="">RESERVATION</a></li>
							<li class="center2"><a href="">DELIVERY</a></li>
							<li class="right2"><a href="">DERECTION</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</header>
