<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../WEB-INF/view/include/header.jsp"%>
<style>
.s_visu1 {
	width: 100%;
	height: 350px;
}

.s_visu1 img {
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
.sub0102{
	width: 100%;
	height:500px; 
}

.sub0102 .sub0102_1 {
	width: 629px;
	height: 427px;
	float: left;
}

.sub0102_1 img {
	width: 629px;
	height: 427px;
}

.sub0102 .sub0102_2 {
	width: 326.5px;
	height: 427px;
	float: left;
}

.transport {
	overflow: hidden;
	padding-left: 20px;
}

.transport img {
	float: left;
	margin-right: 10px;
}

.transport .sub_tp {
	float: left;
	height: 55px;
	padding-top: 13px;
}

.brown_fs_01 {
	font-size: 25px;
	font-weight: bold;
	color: #814b34;
	padding-left: 30px;
	margin-bottom: 20px;
}

.info_font {
	font-size: 14px;
	margin-bottom: 20px;
	padding-left: 30px;
}
.info_font2 {
	font-size: 14px;
	margin-bottom: 20px;
}
.tp {
	margin-top: 5px;
	margin-bottom: 5px; color : #d6673b;
	font-weight: bold;
	color: #d6673b;
}

/* 지도 */
#map_wrap {
	width: 100%;
	margin-bottom: 30px;
}
#map{
	width: 100%;
	height: 600px;
}

#map_wrap h3{
	text-align: center;
	font-size: 34px;
	color:#814b34;
}

#map_title p{
	font-size: 15px;
    color: #766f6c;
    font-weight: normal;
    padding: 10px 0;
    text-align: center;
    margin-bottom: 20px;
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
				<li>라라코스트 위치</li>
				<li>&gt;</li>
				<li class="bold">찾아오시는 길</li>
			</ul>
			<h2 class="clear">찾아오시는 길</h2>
			<div class="sub0102">
				<div class="sub0102_1">
					<img
						src="${pageContext.request.contextPath}/images/introduce/map.jpg">
				</div>
				<div class="sub0102_2">
					<p class="brown_fs_01">주소</p>
					<p class="info_font">
						대구 서구 서대구로 30<br> (내당동 230-6 3층)
					</p>
					<p class="brown_fs_01">연락처</p>
					<p class="info_font">
						TEL : 053-555-1333<br> FAX : 053-555-1333
					</p>
					<p class="brown_fs_01">대중교통 이용시</p>
					<div class="transport">
						<img src="${pageContext.request.contextPath}/images/introduce/subway.png">
						<div class="sub_tp">
							<span class="tp">지하철</span>
							<p class="info_font2">두류역</p>
						</div>
					</div>
					<div class="transport">
						<img src="${pageContext.request.contextPath}/images/introduce/bus.png">
						<div class="sub_tp">
							<span class="tp">버스</span>
							<p class="info_font2">356번, 425번, 623번, 순환 3번</p>
						</div>
					</div>
				</div>
			</div>
			<div id="map_wrap">
				<div id="map_title">
					<h3 class="brown_fs_03">CONTACT US</h3>
					<P>지도 자세히 보기</P>
				</div>
				<div id="map">
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=718759cf62df9bfdcccf59fad89ddecb"></script>
					<script>
						var container = document.getElementById('map');
						var options = {
							center : new kakao.maps.LatLng(35.860593,128.557132),
							level : 3
						};

						var map = new kakao.maps.Map(container, options);
					</script>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../../WEB-INF/view/include/footer.jsp"%>