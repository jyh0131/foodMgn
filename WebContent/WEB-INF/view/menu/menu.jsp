<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp" %>

<style>
	.s_visu1 {
		width: 100%;
		height: 350px;
	}
	
	.s_visu1 img{
		width: 100%;
		height: 350px;
	}
	.content {
		position: relative;
		width: 1000px;
		margin: 0 auto;
		padding: 20px 0;
		overflow: hidden;
		clear: both;
	}
	#menu_li {
		border: 1px solid #887c75;
		width: 200px;
		height: 25px;
		line-height: 25px;
		padding: 10px 0;
		background-color: #f2efec;
		font-size: 15px;
		text-indent: 16px;
		position: relative;
		cursor: pointer;
		float: left;
	}
	#menu_li2 {
		float: right;                 
	}
	#menu_li2 li {
		list-style: none;
		float: left;
		padding: 5px; 
	}
	.li_img {
		background: url("${pageContext.request.contextPath}/images/menu/s_menu_bg.gif") no-repeat;
		position: absolute;
		top: 20px;
		right: 10px;
		width: 20px;
		height: 10px;
	}
	#menulist {
		display: none;
		width: 200px;
		position: absolute;
		top: 46px;
		left: -1px;
	}
	#menulist li {
		border: 1px solid #887c75;
		border-bottom: 1px dotted #887c75;
		border-top: none;
		width: 200px;
		height: 20px;
		line-height: 20px;
		padding: 10px 0;
		background-color: #f2efec;
	}
	#menulist li:hover {
		background-color: #887c75;
	}
	#menulist li:hover a {
		color: white;
	}
	#menulist li a {
		color: black;
		padding: 10px;
	}
	#menulist li:last-child {
		border-bottom: 1px solid #887c75;
	}
	
	
	
	#menu_content {
		margin: 50px 0;
	}
	#title_img {
		padding: 30px 0;
	}
	#menu_name {
		padding: 20px;
		text-align: center;
	}
	#menu_name h1 {
		color: #814b34;
		font-weight: bold;
		font-size: 34px;
	}
	#menu_name p {
		color: #766f6c;
		font-size: 15px;
		padding: 10px;
	}
</style>

<script>
	$(function() {
		$("#menu_li").click(function() {
			$("#menulist").toggle();
			      
		})
		
	})
</script>
	<div class="sub">
		<div class="s_visu1">
			<img src="${pageContext.request.contextPath}/images/menu/sub02_visu.jpg">
		</div>
		<div class="content">
			<div id="menu_li">
				PASTA
				<span class="li_img"></span>
				<ul id="menulist">
					<c:forEach var="list" items="${fkList}" begin="0">
						<li class="menu${list.fkNo}"><a href="${pageContext.request.contextPath}/menu.do">${list}</a></li>
					</c:forEach>
					<!-- <li><a href="">STEAK & CUTLET</a></li>
					<li><a href="">PASTA</a></li>
					<li><a href="">PILAF & RISOTTO</a></li>
					<li><a href="">SALAD</a></li>
					<li><a href="">SIGNATURE PIZZA</a></li>
					<li><a href="">PIZZA</a></li>
					<li><a href="">SIDE MENU</a></li>
					<li><a href="">BEVERAGE & BEER</a></li> -->
				</ul>
			</div>
			<div id="menu_li2">
				<ul>
					<li>HOME</li>
					<li>></li>
					<li>메뉴소개</li>
					<li>></li>
					<li><b>PASTA</b></li>
				</ul>
			</div>
			<div class="clear"></div>
			<div id="menu_content">
				<div id="title_img">
					<img src="${pageContext.request.contextPath}/images/menu/pasta_top1.jpg">
				</div>
				<div id="menu_name">
					<h1>Pasta</h1>
					<p>[파스타]</p>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="../include/footer.jsp" %>