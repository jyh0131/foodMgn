<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>음식점 관리 프로그램</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_mgn.css" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(function() {
		$("#head2_1 li").hover(function() {
			$(this).find(".submenu").stop().slideDown(100);
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
					<div id="head1_2">
						<ul>
							<li><a href="${pageContext.request.contextPath}/">HOME</a></li>
							<li><a href="${pageContext.request.contextPath}/mgn/logout.do">로그아웃</a></li>
						</ul>
					</div>
				</div>
				<div id="head2">
					<div id="head2_1">
						<ul>
							<li>

								<a href="${pageContext.request.contextPath}/mgn/saleList.do">결제관리</a>
								<ul class="submenu">
									<li><a href="${pageContext.request.contextPath}/mgn/saleList.do">결제현황</a></li>
									<li><a href="${pageContext.request.contextPath}/mgn/saleListChart.do">결제차트</a></li>
								</ul>

							</li>
						   <li><a href="${pageContext.request.contextPath}/mgn/salesList.do">판매관리</a>
						   		<ul class="submenu">
									<li><a href="${pageContext.request.contextPath}/mgn/salesList.do">판매현황</a></li>
									<li><a href="${pageContext.request.contextPath}/mgn/salesListChart.do">판매차트</a></li>
								</ul>
						   </li>
							<li><a href="${pageContext.request.contextPath}/mgn/menuMgnlist.do">음식관리</a></li>
							<li><a href="${pageContext.request.contextPath}/mgn/memberMgnlist.do">회원관리</a></li>
							<li><a href="${pageContext.request.contextPath}/mgn/reservationMgn.do">예약관리</a></li>
							<li><a href="${pageContext.request.contextPath}/mgn/noticeMgnlist.do">공지사항관리</a></li>

						</ul>
					</div>
					<div id="head2_2">
						<a href="">
							<img src="${pageContext.request.contextPath}/images/include/logo.png">
						</a>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</header>
