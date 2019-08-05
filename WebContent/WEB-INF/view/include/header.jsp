<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<li><a href="${pageContext.request.contextPath}">HOME</a></li>
							<c:if test="${Auth != null}">
								<li><a href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
								<li><a href="${pageContext.request.contextPath}/mypage.do">마이페이지</a></li>
							</c:if>
							<c:if test="${Auth == null}">
								<li><a href="${pageContext.request.contextPath}/login.do">로그인</a></li>
								<li><a href="${pageContext.request.contextPath}/join.do">회원가입</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				<div id="head2">
					<div id="head2_1">
						<ul>
							<li><a href="${pageContext.request.contextPath}/introduce.do">INTRODUCE</a></li>
							<li class="center">
								<a href="${pageContext.request.contextPath}/menu.do?fkno=1">MENU</a>
								<ul class="submenu">
									<li><a href="${pageContext.request.contextPath}/menu.do?fkno=1">PASTA</a></li>
									<li><a href="${pageContext.request.contextPath}/menu.do?fkno=2">STEAK & CUTLET</a></li>
									<li><a href="${pageContext.request.contextPath}/menu.do?fkno=3">PILAF & RISOTTO</a></li>
									<li><a href="${pageContext.request.contextPath}/menu.do?fkno=4">SALAD</a></li>
									<li><a href="${pageContext.request.contextPath}/menu.do?fkno=5">SIGNATURE PIZZA</a></li>
									<li><a href="${pageContext.request.contextPath}/menu.do?fkno=6">PIZZA</a></li>
									<li><a href="${pageContext.request.contextPath}/menu.do?fkno=7">SIDE MENU</a></li>
									<li><a href="${pageContext.request.contextPath}/menu.do?fkno=8">BEVERAGE</a></li>
									<li><a href="${pageContext.request.contextPath}/menu.do?fkno=9">BEER</a></li>
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
							<li><a href="${pageContext.request.contextPath}/reservation.do">RESERVATION</a></li>
							<li class="center2"><a href="">DELIVERY</a></li>
							<li class="right2"><a href="${pageContext.request.contextPath}/derection.do">DERECTION</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</header>
