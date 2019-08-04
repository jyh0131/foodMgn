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
	
	
	#joinForm_content > p {
		padding: 20px 0 50px;
		text-align: center;
		font-size: 32px;
		line-height: 32px;
		color: #55423b;
		font-weight: bolder;
		letter-spacing: -0.1em;
		font-family: "굴림";
	}
	.jf_div1 {
		padding: 10px 0;
		border-bottom: 3px solid black;
	}
	.jf_div2 {
		border-bottom: 1px solid #c7a593;
	}
	.jf_div3 {
		text-align: center;
		margin: 20px 0 60px;
	}
	.span1 {
		background-color: #F7F7F7;
		display: inline-block;
		padding: 20px 10px;
		width: 150px;
	}
	.span_color {
		color: #66A2C8;
		font-size: 0.9em;
	}
	input[type="submit"] {
		background-color: #3f87dc;
		border: 1px solid #3f87dc;
		color: white;
		padding: 10px 50px;
		border-radius: 5px;
		cursor: pointer;
		font-size: 17px;
	}
	input[type="text"], input[type="date"] {
		padding: 5px;
	}
</style>
<script>
	$(function() {
		$("#menu_li").click(function() {
			$("#menulist").toggle();
		})
		
		$("form").submit(function() {
			if($(".agree1 input[type='radio']:checked").val() != "agree") {
				alert("회원가입약관의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
				return false;
			}
			if($(".agree2 input[type='radio']:checked").val() != "agree") {
				alert("개인정보취급방침의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
				return false;
			}
		})
	})
</script>

	<div class="sub">
		<div class="s_visu1">
			<img src="${pageContext.request.contextPath}/images/login/sub03_visu.jpg">
		</div>
		<div class="content">
			<div id="menu_li2">
				<ul>
					<li>HOME</li>
					<li>></li>
					<li>MEMBER</li>
					<li>></li>
					<li><b>회원가입</b></li>
				</ul>
			</div>
			<div class="clear"></div>
			<div id="joinForm_content">
				<p>회원가입</p>
				<form>
					<div class="jf_div1"><b>개인 정보</b></div>
					<div class="jf_div2">
						<span class="span1">이름</span>
						<span>
							<input type="text" size="30">
							<span class="span_color">※ 공백없이 한글만 입력가능.</span>
						</span>
					</div>
					<div class="jf_div2">
						<span class="span1">전화번호</span>
						<span><input type="text" size="30"></span>
					</div>
					<div class="jf_div2">
						<span class="span1">생년월일</span>
						<span><input type="date"></span>
					</div>
					<div class="jf_div2">
						<span class="span1">주소</span>
						<span><input type="text" size="80"></span>
					</div>
					<div class="jf_div3">
						<input type="submit" value="확 인">
					</div>
				</form>
			</div>
		</div>
	</div>

<%@ include file="../include/footer.jsp" %>