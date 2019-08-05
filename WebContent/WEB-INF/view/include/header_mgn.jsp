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
							<li><a href="">결제관리</a></li>
							<li class="center">
								<a href="">판매관리</a>
							</li>
							<li class="right">
								<a href="">음식관리</a>
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
							<li><a href=""></a>     </li>
							<li class="center2"><a href="">회원관리</a></li>
							<li class="right2"><a href="">예약관리</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</header>
