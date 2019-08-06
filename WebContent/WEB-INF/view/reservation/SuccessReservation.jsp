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
	
	#rsvContainer{
		width:1000px;
		margin: 0 auto;
	}
	#rsvInnerContainer{
		padding:30px;
		background: white;
		text-align: center;
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
			<h2><fmt:formatDate value="${rsv.rsvTime}" pattern="yyyy-MM-dd kk:mm"/>에 예약 되었습니다.</h2>
		</c:if>
		<c:if test="${isRsv==false }">
			<h2><fmt:formatDate value="${rsv.rsvTime}" pattern="yyyy-MM-dd kk:mm"/>에 해당 좌석에 예약이 있습니다. 다른 좌석을 선택하세요.</h2>
		</c:if>
		</div>
	</div>
	
<%@ include file="../include/footer.jsp" %>












