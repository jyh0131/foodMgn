<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../WEB-INF/view/include/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/derection.css" type="text/css">

<div id="wrap">
	<div class="sub">
		<div class="s_visu1">
			<img id="i1" src="${pageContext.request.contextPath}/images/introduce/sub01_visu.jpg">
			<img id="i2" src="${pageContext.request.contextPath}/images/introduce/s_visu3.jpg">
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
						
						var markerPosition  = new kakao.maps.LatLng(35.860593,128.557132); 

						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
						    position: markerPosition
						});

						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);

					</script>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../../WEB-INF/view/include/footer.jsp"%>