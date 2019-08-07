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
		overflow: hidden;
	}
	h1{
		margin-bottom:20px;
		margin-top:20px;
	}
	h3{
		margin-bottom:20px;
	}
	#select, #result{
		float:left;
		border:1px solid black;
		margin:10px 20px;
	}

	#select{
		width:350px;
	}
	 #result{
		 width:500px;
	 }
	 #selectFK, #selectF{
		margin:20px 0;
	}
	#foodkind, #food{
		width: 300px;
		height:50px;
	}
	 #saleList{
	 	width:500px;
	 	border-collapse: collapse;
	 }
	 #saleList tr, #saleList td{
	 	border:1px solid #dedede;
	 }
	 #totalPrice{
	 	text-align: right;
	 }
	 #red{
	 	color:red;
	 }
	 .foodNo{
	 	display: none;
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
				$("#foodkind").append("<option>===주메뉴선택===</option>")
				for(var i=0; i<json.length; i++){
					var $option = $("<option>");
					$($option).html(json[i].fkName);
					$($option).attr("value",json[i].fkNo);
					$("#foodkind").append($option);
				}
			}
		})
		$("#foodkind").change(function(){
			var foodkind = $("#selectFK :selected").val();
			if(foodkind=="===주메뉴선택==="){
				$("#selectF").empty();
				alert("주메뉴를 선택하세요.");
				return;
			}
			$.ajax({
				url : "${pageContext.request.contextPath }/foodKind.do",
				type : "post",
				data : {"foodkind":foodkind},
				dataType: "json",
				success : function(json){
					console.log(json);
					$("#selectF").empty();
					var $select = $("<select id='food'>");
					for(var i=0; i<json.length; i++){
						var $option = $("<option>");
						$($option).html(json[i].fdName);
						$($option).attr("value",json[i].fdNo);
						$($option).attr("data-price",json[i].fdPrice)
						$($select).append($option);
						$("#selectF").append($select);
					}
				}
			})
		})
		
		$(document).on("change","#food",function(){
			var foodName = $("#selectF :selected").html(); //음식이름
			var foodPrice = $("#selectF :selected").attr("data-price"); //음식가격
			var foodNo = $("#selectF :selected").attr("value"); // 음식번호
			var totalPrice = 0;
			
			for(var i=0; i<$(".foodName").length; i++){
				if(foodName==$(".foodName").eq(i).html()){
					var count = Number($(".count").eq(i).html());
					var price =  Number($(".foodPrice").eq(i).html());
					var countP = count+1;
					$(".count").eq(i).html(countP);
					$(".foodPrice").eq(i).html(foodPrice*countP);
					
					for(var j=0; j<$(".foodName").length; j++){
						var price =  Number($(".foodPrice").eq(j).html());
						totalPrice += price;
					}
					$("#red").html(totalPrice);
					return;
				}
			}
			
			
			var $tr = $("<tr>");
			var $foodName = $("<td class='foodName'>"+foodName+"</td>");
			var $foodPrice = $("<td class='foodPrice'>"+foodPrice+"</td>");
			var $count = $("<td class='count'>"+1+"</td>");
			var $foodNo = $("<td class='foodNo'>"+foodNo+"</td>");
			$($tr).append($foodName);
			$($tr).append($count);
			$($tr).append($foodPrice);
			$($tr).append( $foodNo);
			$("#saleList").append($tr);
			
			for(var i=0; i<$(".foodName").length; i++){
				var price =  Number($(".foodPrice").eq(i).html());
				totalPrice += price;
			}
			
			$("#red").html(totalPrice);
		})
		
		$(document).on("click","#btn",function(){
			if( $(".foodName").length==0 ){
				alert("상품을 선택하세요");
				return;
			}
			
			
			if(${Auth==null}){
				var a = confirm("배달주문은 회원만 가능합니다. 로그인하시겠습니까?");
				if(a==0){
					location.href = "${pageContext.request.contextPath}/login.do";
				}else{
					return;
				}
			}else{
				var foodNo = "";
				var foodCount = "";
				var totalPrice = $("#red").html();
				for(var j=0; j<$(".foodName").length; j++){
					
					foodNo += $(".foodNo").eq(j).html()+"-";
					foodCount += $(".count").eq(j).html()+"-";
				}
				location.href= "${pageContext.request.contextPath}/payment.do?foodNo="+foodNo+"&foodCount="+foodCount+"&total="+totalPrice;
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
			<div id="select">
				<p id="selectFK">
					<select id="foodkind">
			
					</select>
				</p>
				<p id="selectF">
			
				</p>
			</div>
			<div id="result">
				<table id="saleList">
					<tr>
						<td>음식 이름</td>
						<td>수량</td>
						<td>가격</td>
					</tr>
				</table>
			<p id="totalPrice">총가격 : <span id="red"></span></p>	
			<button id="btn">결제</button>
			</div>
		</div>
	</div>
	


<%@ include file="../include/footer.jsp" %>