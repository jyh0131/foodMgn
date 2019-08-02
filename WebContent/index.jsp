<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="WEB-INF/view/include/header.jsp" %>

<style>
	#wrap {
		width: 100%;
		z-index: -100;
	}
	.bxslider {
		border: none;
	}
</style>

<script>
	$(function(){
		  $('.bxslider').bxSlider({
							auto: true,
						    mode: 'fade',
						    pause: 2000,
						    pager: false,
						    controls: false
						    /* page: true */
		  });
	});
</script>

	<div id="wrap">
		<div class="bxslider">
			<div>
				<img src="${pageContext.request.contextPath}/images/main/m_banner0.jpg">
			</div>
			<div>
				<img src="${pageContext.request.contextPath}/images/main/m_banner1.jpg">
			</div>
			<div>
				<img src="${pageContext.request.contextPath}/images/main/m_banner2.jpg">
			</div>
		</div>
	</div>
	
<%@ include file="WEB-INF/view/include/footer.jsp" %>