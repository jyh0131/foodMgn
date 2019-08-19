<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" type="text/css">

<script>
	$(function() {
		$("#menu_li").click(function() {
			$("#menulist").toggle();
		})
		
		$("#f1").submit(function() {
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
		
		$("#f2").submit(function() {
			$(".reg2").css("display", "none");
			
			if($("input[name='name']").val() == "") {
	            $("input[name='name']").nextAll(".reg2").css("display", "block");
	            return false;
	         }
	         
	         if($("input[name='tel']").val() == "") {
	            $("input[name='tel']").nextAll(".reg2").css("display", "block");
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
			<img id="s_visu1_1" src="${pageContext.request.contextPath}/images/login/sub03_visu.jpg">
			<img id="s_visu1_2" src="${pageContext.request.contextPath}/images/login/s_visu3.jpg">
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
					<form action="${pageContext.request.contextPath}/login.do" method="post" id="f1">
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
									<input type="password" size="30" name="tel">
									<span class="reg">※ 전화번호를 입력하세요</span>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div id="loginBoxMobile">
					<form action="${pageContext.request.contextPath}/login.do" method="post" id="f2">
						<div>
							<input type="text" size="40" name="name" placeholder="이름을 입력하세요">
							<span class="reg2">※ 이름을 입력하세요</span>
						</div>
						<div>
							<input type="password" size="40" name="tel" placeholder="전화번호를 입력하세요">
							<span class="reg2">※ 전화번호를 입력하세요</span>
						</div>
						<div>
							<input type="submit" value="로그인">
						</div>
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
				<div id="loginBox2Mobile">
					<ul>
						<li>
							<p><a href="${pageContext.request.contextPath}/introduce.do"><span>라라코스트<br>소개</span></a></p>
						</li>
						<li>
							<p><a href=""><span>아이디/<br>비밀번호찾기</span></a></p>
						</li>
						<li>
							<p><a href="${pageContext.request.contextPath}/join.do"><span>회원가입</span></a></p>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

<%@ include file="../include/footer.jsp" %>