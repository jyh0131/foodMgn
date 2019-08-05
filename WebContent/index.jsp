<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="WEB-INF/view/include/header.jsp" %>

<style>
	#wrap {
		width: 100%;
		z-index: -100;
		position:relative;
	}
	div.bx-wrapper{
		width:100%;
		box-shadow: none;
		margin-bottom:60px;                      
	}
	.bxslider{
		width: 100%;
	}
	
	.bxslider, .bx-wrapper {
		border: none;
	}
	.bx-wrapper .bx-pager {
    position: absolute;
    bottom: 50px;
    left:0;                          
    }
    .bx-wrapper .bx-pager.bx-default-pager a:hover,
	.bx-wrapper .bx-pager.bx-default-pager a.active,
	.bx-wrapper .bx-pager.bx-default-pager a:focus {
 	 	background: #4a83da;
	}
    .bx-wrapper .bx-controls-auto{
   	display: none;
  	  
    }           
    .main_img{
    	width:100% !important;
    }
</style>

<script>
	$(function(){
		  $('.bxslider').bxSlider({
							auto: true,
						    mode: 'fade',
						    pause: 2000,
						    pager: true,               
						    controls: false
						    /* page: true */
		  });
	});
</script>

	<div id="wrap">
		<div class="bxslider">
			<div class="main_img">
				<img src="${pageContext.request.contextPath}/images/main/m_banner0.jpg">
			</div>
			<div class="main_img">
				<img src="${pageContext.request.contextPath}/images/main/m_banner1.jpg">
			</div>
			<div class="main_img">
				<img src="${pageContext.request.contextPath}/images/main/m_banner2.jpg">
			</div>
		</div>
	</div>
	
<%@ include file="WEB-INF/view/include/footer.jsp" %>