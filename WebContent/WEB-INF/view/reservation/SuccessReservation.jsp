<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
<style>
	body{
		background: #f7f7f7;
	}
	.s_visu1 {
		width: 100%;
		height: 350px;
	}
	
	.s_visu1 img{
		width: 100%;
		height: 350px;
	}
	h1{
		text-align: center;
		margin:20px;
		font-size: 35px;
	}
	#rsvContainer{
		width:1000px;
		margin: 0 auto;
	}
	#rsvInnerContainer{
		padding:30px;
		background: white;
		
	}
	#rsvGuide{
		background:#f7f7f7;
		height:500px;
		font-size: 20px;
		font-family: "나눔고딕",NanumGothic,ng,"맑은 고딕","Malgun Gothic",sans-serif;
		font-weight: 600;
		padding:15px;
		position: relative;
	}
	#rsvGuide p{
		margin:20px 10px;
	}
	#link{
		text-align: right;
		position: absolute;
		right:5px;
		bottom:5px;
	}
	span{
		color:green;
	}
</style>
<script>
	
</script>

	<div class="s_visu1">
			<img src="${pageContext.request.contextPath}/images/main/f_visu7.jpg">
	</div>
	<div id="rsvContainer">
		<div id="rsvInnerContainer">
		<c:if test="${isRsv==true }">
			<div id="rsvGuide" class="success">
				<h1>예약 성공!</h1>
				<h1><span><fmt:formatDate value="${rsv.rsvTime}" pattern="yyyy-MM-dd kk:mm"/></span>일에 예약 되었습니다.</h1>
				<p>&nbsp;</p>
				<p>1. 회원일 경우 마이페이지에서 예약 취소가 가능합니다.</p>
				<p>2. 당일 취소나, 예약시간 변경은 전화로 문의주시기 바랍니다.</p>
				<p>3. 비회원이실 경우 예약사항의 변동은 전화로 문의주시기 바랍니다.</p>
				<p id="link"><a href="${pageContext.request.contextPath}"><img src="images/go_main.gif"></a></p>
			</div>
		
		</c:if>
		<c:if test="${isRsv==false }">
		<div id="rsvGuide" class="fail">
			<h1>예약 실패</h1>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<h1><span><fmt:formatDate value="${rsv.rsvTime}" pattern="yyyy-MM-dd kk:mm"/></span>일 해당 좌석에 예약이 있습니다.</h1>
			<h1>다른 좌석을 선택하세요.</h1>
			<p id="link"><a href="${pageContext.request.contextPath}"><img src="images/go_main.gif"></a></p>
		</div>
		</c:if>
		</div>
	</div>
	
<%@ include file="../include/footer.jsp" %>












