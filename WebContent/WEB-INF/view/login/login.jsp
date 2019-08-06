<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	
	
	#login_content > p {
		padding-top: 20px;
		text-align: center;
		font-size: 32px;
		color: #55423b;
		line-height: 32px;
		font-weight: bolder;
		letter-spacing: -0.1em;
		font-family: "굴림";
	}
	#login_center {
		text-align: center;
		margin: 50px 0 30px;
	}
	.title {
		font-size: 2.2em;
		color: #232423;
		margin-top: 20px;
		letter-spacing: -0.1em;
		font-family: "굴림";
	}
	.txt {
		color: #777;
		margin: 15px 0 10px;
	}
	#loginBox {
		border: 1px solid #e7e7e7;
		padding: 30px 0 30px;
		width: 750px;
		margin: 0 auto;
	}
	#loginBox form {
		width: 550px;
		margin: 20px auto;
	}
	#loginBox input {
		padding: 5px;
	}
	#loginBox input[type="submit"] {
		background-color: #3f87dc;
		border: 1px solid #3f87dc;
		color: white;
		padding: 30px 20px;
		border-radius: 5px;
		font-weight: bold;
		cursor: pointer;
		margin-left: 15px;
	}
	.loginimg {
		padding-right: 25px;
	}
	.under {
		border-bottom: 1px solid #c7a593;
		width: 70px;
		padding-right: 5px;
	}
	.under2 {
		border-bottom: 1px solid #c7a593;
	}
	#loginBox2 {
		width: 750px;
		margin: 30px auto;
		margin-bottom: 50px;
		overflow: hidden;
	}
	#loginBox2 li {
		float: left;
		width: 248px;
		text-align: center;
	}          
	#loginBox2 li:nth-child(2) {
		border-left: 1px dotted #999;
		border-right: 1px dotted #999;
	}
	#loginBox2 button {
		background-color: #777;
		color: white;
		font-weight: bold;
		padding: 5px 10px;
		border: none;
		cursor: pointer;
	}
	#loginBox2 button:hover {
		background-color: #087ec5;
	}
	.txt2 {
		color: #777;
		margin: 10px 0 15px;
		font-size: 0.9em;
	}
	.reg {
      color: red;
      font-size: 0.8em;
      display: none;
      margin: 5px;
   }
</style>
<script>
	$(function() {
		$("#menu_li").click(function() {
			$("#menulist").toggle();
		})
		
		$("form").submit(function() {
			$(".reg").css("display", "none");
			
			if($("input[name='name']").val() == "") {
	            $("input[name='name']").nextAll(".reg").css("display", "inline");
	            return false;
	         }
	         
	         if($("input[name='tel']").val() == "") {
	            $("input[name='tel']").nextAll(".reg").css("display", "inline");
	            return false;
	         }
	         
	         $.ajax({
	 			url:"${pageContext.request.contextPath}/login.do",
	 			type:"post",
	 			data:{"name":$("input[name='name']").val(), "tel":$("input[name='tel']").val()},
	 			dataType:"json",
	 			success: function(res) {
	 				console.log(res);
	 				
	 				if(res.success == false) { //실패-alert
	 					alert("아이디와 비밀번호를 다시 확인하세요.");
	 				}else if(res.success == "noMem") {
	 					alert("회원이 아닙니다.");
	 				}else { //성공 -홈으로이동
	 					location.href = "${pageContext.request.contextPath}/";
	 				}
	 			}
	 		})
	 		return false;
		})
	})
</script>
	<div class="sub">
		<div class="s_visu1">
			<img src="${pageContext.request.contextPath}/images/login/sub03_visu.jpg">
		</div>
		<div class="content">
			<div id="menu_li">
				로그인
				<span class="li_img"></span>
				<ul id="menulist">
					<li><a href="${pageContext.request.contextPath}/login.do">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/join.do">회원가입</a></li>
					<li><a href="">정보수정</a></li>
				</ul>
			</div>
			<div id="menu_li2">
				<ul>
					<li>HOME</li>
					<li>></li>
					<li>MEMBER</li>
					<li>></li>
					<li><b>로그인</b></li>
				</ul>
			</div>
			<div class="clear"></div>
			<div id="login_content">
				<p>로그인</p>
				<div id="login_center">
					<p class="title">라라코스트에 오신 것을 환영합니다.</p>
					<p class="txt">라라코스트에서는 고객님께 보다 나은 서비스를 제공하기 위하여 회원제로 운영하고 있습니다.</p>
				</div>
				<div id="loginBox">
					<form action="${pageContext.request.contextPath}/login.do" method="post">
						<table>
							<tr>
								<td rowspan="2" class="loginimg"><img src="${pageContext.request.contextPath}/images/login/ico_lock.png"></td>
								<td class="under">이  름</td>
								<td class="under2">
									<input type="text" size="30" name="name" placeholder="">
									<span class="reg">※ 이름을 입력하세요</span>
								</td>
								<td rowspan="2"><input type="submit" value="로그인"></td>
							</tr>
							<tr>
								<td class="under">전화번호</td>
								<td class="under2">
									<input type="text" size="30" name="tel">
									<span class="reg">※ 전화번호를 입력하세요</span>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div id="loginBox2">
					<ul>
						<li>
							<p class="txt2">라라코스트를<br>소개합니다.</p>
							<p><a href="${pageContext.request.contextPath}/introduce.do"><button>라라코스트 소개</button></a></p>
						</li>
						<li>
							<p class="txt2">아이디/비밀번호를<br>잊으셨습니까?</p>
							<p><a href=""><button>아이디/비밀번호찾기</button></a></p>
						</li>
						<li>
							<p class="txt2">라라코스트의<br>회원이 아니십니까?</p>
							<p><a href="${pageContext.request.contextPath}/join.do"><button>회원가입</button></a></p>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

<%@ include file="../include/footer.jsp" %>