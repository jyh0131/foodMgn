<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		 
		$("#reservation").click(function(){
			if(${Auth==null}){
				var a = confirm("회원일 경우 로그인하셔야 합니다. 비회원일 경우 취소를 누르세요.");
				if(a==true){
					location.href = "${pageContext.request.contextPath}/login.do";	
				}else{
					location.href = "${pageContext.request.contextPath}/reservation.do?isLogin=0"; // 비회원
				}
			}else{
				location.href = "${pageContext.request.contextPath}/reservation.do?isLogin=1"; // 회원
			}
		})
		

		$("#manager").click(function(){
			var a = confirm("권한이없습니다.\r\n\r\n로그인 후 이용하여 주세요.");
			if(a==true){
				location.href = "${pageContext.request.contextPath}/manager.do";
			}else{
				return;
			}
		})
		

		$("#li1").hover(function() {
			$("#li1 a").text("라라코스트 소개");
			$("#li1 a").css("font-size","0.9em");
		}, function() {
			$("#li1 a").text("INTRODUCE");
			$("#li1 a").css("font-size","1em");
		})
		
		$("#li2").hover(function() {
			$("#li2 > a").text("메뉴 소개");
		}, function() {
			$("#li2 > a").text("MENU");
		})
		
		$("#li3").hover(function() {
			$("#li3 > a").text("커뮤니티");
			$("#li3 > a").css("margin-right","20px");
		}, function() {
			$("#li3 > a").text("COMMUNITY");
			$("#li3 > a").css("margin-right","0");
		})
		
		$("#li4").hover(function() {
			$("#li4 > a").text("예약관리");
			$("#li4 > a").css("margin-left","30px");
		}, function() {
			$("#li4 > a").text("RESERVATION");
			$("#li4 > a").css("margin-left","0");
		})
		
		$("#li5").hover(function() {
			$("#li5 a").text("배달관리");
		}, function() {
			$("#li5 a").text("DELIVERY");
		})
		
		$("#li6").hover(function() {
			$("#li6 a").text("매장찾기");
			$("#li6 a").css("margin-right","20px");
		}, function() {
			$("#li6 a").text("DERECTION");
			$("#li6 a").css("margin-right","0");
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
							<li><a href="#" id="manager">관리자페이지</a></li>
						</ul>
					</div>
				</div>
				<div id="head2">
					<div id="head2_1">
						<ul>
							<li id="li1"><a href="${pageContext.request.contextPath}/introduce.do">INTRODUCE</a></li>
							<li class="center" id="li2">
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
							<li class="right" id="li3">
								<a href="${pageContext.request.contextPath}/notice.do">COMMUNITY</a>
								<ul class="submenu">
									<li><a href="${pageContext.request.contextPath}/notice.do">공지사항</a></li>
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
							<li id="li4">
								<a href="javascript:void(0);">RESERVATION</a>
								<ul class="submenu">
									<li><a href="javascript:void(0);" id="reservation">예약하기</a></li>
									<li><a href="${pageContext.request.contextPath}/search.do" id="searchRsv">예약조회</a></li>
								</ul>
							</li>

							<li class="center2" id="li5"><a href="${pageContext.request.contextPath}/delivery.do">DELIVERY</a></li>
							<li class="right2" id="li6"><a href="${pageContext.request.contextPath}/derection.do">DERECTION</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</header>
