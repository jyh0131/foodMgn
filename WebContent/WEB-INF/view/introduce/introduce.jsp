<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../WEB-INF/view/include/header.jsp"%>

<style>
.s_visu1 {
	width: 100%;
	height: 350px;
}

.s_visu1 img{
	width: 100%;
	height: 350px;
}

.sub .content {
	padding: 20px 0;
}

.sub h2 {
	text-align: center;
	font-size: 32px;
	line-height: 32px;
	color: #55423b;
	padding-top: 20px;
	margin-bottom: 30px;
}

.content {
	position: relative;
	width: 1000px;
	margin: 0 auto;
	padding-top: 20px;
	overflow: hidden;
	clear: both;
}

.content .depth {
	position: absolute;
	top: 20px;
	right: 0
}

.content .depth li {
	float: left;
	padding: 5px; 
}

.content .depth .bold {
	font-weight: bold;
}

.content .clear {
	clear: both;
	margin-top: 40px;
}

.content div.sub0101 {
	width: 100%;
	overflow: hidden;
	margin-bottom: 60px;
}

.sub0101 .sub0101_1 {
	width: 464px;
	height: 556px;
	float: left;
}

.sub0101 .sub0101_2 {
	width: 464px;
	height: 556px;
	float: left;
}

.brown_fs_01 {
	font-size: 25px;
	font-weight: bold;
	color: #814b34;
	padding-left: 30px;
	margin-bottom: 30px;
}

.brown_fs_02 {
	font-size: 17px;
	font-weight: bold;
	color: #814b34;
}

.info_font {
	font-size: 14px;
	margin-bottom: 20px;
	padding-left: 30px;
}
</style>

<div id="wrap">
	<div class="sub">
		<div class="s_visu1">
			<img
				src="${pageContext.request.contextPath}/images/introduce/sub01_visu.jpg">
		</div>
		<div class="content">
			<ul class="depth">
				<li>HOME</li>
				<li>&gt;</li>
				<li>라라코스트 소개</li>
				<li>&gt;</li>
				<li class="bold">인사말</li>
			</ul>
			<h2 class="clear">인사말</h2>
			<div class="sub0101">
				<div class="sub0101_1">
					<img src="${pageContext.request.contextPath}/images/introduce/sub0101_img.jpg"> 
				</div>
				<div class="sub0101_2">
					<h2>
						<img src="${pageContext.request.contextPath}/images/introduce/sub0101_h3.png">
					</h2>
					<p class="brown_fs_01">Welcome everybody!</p>
					<p class="info_font"> 
						행복한 식사 시간을 선물하는 패밀리 레스토랑 라라코스트입니다.<br>
						라라코스트는 국내에서 출발한 대한민국 대표 패밀리 레스토랑으로,<br>
						다양성과 즐거움이라는 고객 중심의 가치를 추구합니다.
					</p>
					<p class="info_font">
						또한, 남녀노소가 좋아하는 메뉴 개발, 음료와 커피의 기본 제공,<br>
						가족 고객을 위한 키즈존 설비, 이용 편의에 최적화된 매장 디자인 등<br>
						패밀리 레스토랑의 격을 완성하려는 노력을 아끼지 않고 있습니다.
					</p>
					<p class="info_font">라라코스트에서 <span class="brown_fs_02">합리적인 가격, 그 이상의 가치</span>를 느껴 보세요.</p>
				</div>
			</div>
			<div>
				<img src="${pageContext.request.contextPath}/images/introduce/story_img_intro.jpg">
			</div>
		</div>
	</div>
</div>


<%@ include file="../../../WEB-INF/view/include/footer.jsp"%>