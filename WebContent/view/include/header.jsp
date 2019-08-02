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
	ul li {
		list-style: none;
	}
	a {
		text-decoration: none;
	}
	
	header {
		width: 100%;
		background-color: rgba(0,0,0);
		height: 85px;
		padding: 25px 0;
	}
	#header {
		width: 1050px;
		margin: 0 auto;
		position: relative;
	}
	header ul li {
		float: left;
	}
	header a {
		color: white;
	}
	#head1 {
		overflow: hidden;
		z-index: 10;
	}
	#head1_1 {
		float: left;
	}
	.sns {
		border: 1px solid #eee;
		display: inline-block;
	}
	#head1_2 {
		float: right;
		margin-bottom: 30px;
	}
	#head1_2 li {
		margin-right: 15px;
	}
	#head1_2 li:last-child {
		margin-right: 0;
	}
	#head1_2 a {
		font-size: 0.8em;
	}
	#head2 {
		overflow: hidden;
	}
	#head2_1 {
		float: left;
	}
	#head2_1 ul li, #head2_3 ul li {
		margin-right: 50px;
	}
	#head2_1 ul li:last-child, #head2_3 ul li:last-child {
		margin-right: 0;
	}
	#head2_2 {
		position: absolute;
		top: 5px;
		left: 390px;
	}
	#head2_3 {
		float: right;
	}
	#head2_1 a, #head2_3 a {
		font-weight: bold;     
	}
</style>
</head>
<body>
	<div id="container">
		<header>
			<div id="header">
				<div id="head1">
					<div id="head1_1">
						<a href="">
							<div class="sns">
								<img src="${pageContext.request.contextPath}/image/sns_face.png">
							</div>
						</a>
						<a href="">
							<div class="sns">
								<img src="${pageContext.request.contextPath}/image/sns_insta.png">
							</div>
						</a>
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
							<li><a href="">MENU</a></li>
							<li><a href="">COMMUNITY</a></li>
						</ul>
					</div>
					<div id="head2_2">
						<a href="">
							<img src="${pageContext.request.contextPath}/image/logo.png">
						</a>
					</div>
					<div id="head2_3">
						<ul>
							<li><a href="">RESERVATION</a></li>
							<li><a href="">DELIVERY</a></li>
							<li><a href="">DERECTION</a></li>
						</ul>
					</div>
				</div>
			</div>
		</header>
	</div>
</body>
</html>