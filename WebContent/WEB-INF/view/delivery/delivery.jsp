<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	body{
		background: #f7f7f7;
	}
	#deliveryContainer{
		width:1000px;
		margin: 40px auto;
		
	}
	.s_visu1 {
		width: 100%;
		height: 350px;
	}
	
	.s_visu1 img{
		width: 100%;
		height: 350px;
	}
	#deliveryInnerContainer{
		padding:30px;
		background: white;
	}
	h1{
		margin-bottom:20px;
		margin-top:20px;
	}
	h3{
		margin-bottom:20px;
	}
	
</style>
<script>
	$(function(){
		$.ajax({
			url : "${pageContext.request.contextPath }/foodKind.do",
			type : "get",
			dataType: "json",
			success : function(json){
				console.log(json);
			}
		})
	})
</script>

	<div class="s_visu1">
		<img src="${pageContext.request.contextPath}/images/main/f_visu5.jpg">
	</div>
	<div id="deliveryContainer">
		<h1>온라인 배달 주문</h1>
		<div id="deliveryInnerContainer">
			<h3>배달주문하기</h3>
			<select id="foodkind">
			
			</select>
		</div>
	</div>
	


<%@ include file="../include/footer.jsp" %>