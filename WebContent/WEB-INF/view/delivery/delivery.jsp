<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	body{
		background: #f7f7f7;
	}
	#deliveryContainer{
		width:1400px;
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
		margin:10px 20px;
	}

	#select{
		width:350px;
	}
	 #result{
		 width:910px;
	 }
	 #selectFK, #selectF{
		margin:20px 0;
	}
	#foodkind, #food{
		width: 300px;
		height:50px;
		text-align: center;
	}
	 #saleList{
	 	width:900px;
	 	border-collapse: collapse;
	 	font-size: 20px;
	 	font-family: Arial;
	 	margin-bottom:20px;
	 }
	 #saleList tr{
	 	background: #f5f5f5;
	 	border:1px solid #bbb;
	 	height:70px;
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
	 .foodName{
	 	width:400px;
	 	text-align: center;
	 }
	 .count{
	 	width:150px;
	 	text-align: center;
	 }
	 .foodPrice{
	 	width:130px;
	 	text-align: center;
	 }
	 .delete{
	 	width:100px;
	 	text-align: center;
	 }
	 .delete button{
	 	width:60px;
	 	height:30px;
	 	font-size: 18px;
	 	
	 }
	  .fImg{
	 	overflow: hidden;
	 	width:115px;
	  }
	  .foodImg{ /*이미지*/
	 	display: block;
	 	float: left;
	 	width:90px;
	 	height:70px;
	 	margin-left:25px;
	 }
	
	 #btn{
	 	width:200px;
	 	height:80px;
	 	font-size: 25px;
	 	line-height: 80px;
	 	font-weight: bold;
	 	color:white;
	 	background: #c10a28;
	 	margin-left:350px;
	 }
	 #totalPrice{
	 	font-weight: bold;
	 	margin:10px;
	 	font-size: 20px;
	 }
	 .plus, .minus{
	 	width:25px;
	 	height:25px;
	 }
	 .plus{
	 	margin-left:10px;
	 }
	 .minus{
	 	margin-right:10px;
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
			var foodPrice = Number($("#selectF :selected").attr("data-price")); //음식가격
			var foodNo = $("#selectF :selected").attr("value"); // 음식번호
			var totalPrice = 0;
			
			for(var i=0; i<$(".foodName").length; i++){
				if(foodName==$(".foodName").eq(i).html()){
					var count = Number($(".count").eq(i).find("span").html());
					var price =  Number($(".foodPrice").eq(i).html());
					var countP = count+1;
					$(".count").eq(i).find("span").html(countP);
					$(".foodPrice").eq(i).find("span").html(comma(foodPrice*countP));
					
					for(var j=0; j<$(".foodName").length; j++){
						var price2 =  $(".foodPrice").eq(j).find("span").html();
						var price = uncomma(price2);
						totalPrice += Number(price);
					}
					$("#red").html(comma(totalPrice));
					return;
				}
			}
			
			
			var $tr = $("<tr>");
			var $foodImg = $("<td class='fImg'><img src='images/food/"+foodName+".png' class='foodImg'></td>");
			var $foodName = $("<td class='foodName'>"+foodName+"</td>");
			var $foodPrice = $("<td class='foodPrice' data-price='"+foodPrice+"'><span>"+comma(foodPrice)+"</span>원</td>");
			var $count = $("<td class='count'><button class='minus'>－</button><span>"+1+"</span><button class='plus'>+</button></td>");
			var $foodNo = $("<td class='foodNo'>"+foodNo+"</td>");
			var $delete = $("<td class='delete'><button class='btnDel'>삭제</button></td>")
			$($tr).append($foodImg);
			$($tr).append($foodName);
			$($tr).append($count);
			$($tr).append($foodPrice);
			$($tr).append($foodNo);
			$($tr).append($delete);
			$("#saleList").append($tr);
			
			for(var i=0; i<$(".foodName").length; i++){
				var price2 = $(".foodPrice").eq(i).find("span").html();
				var price = uncomma(price2);
				totalPrice += Number(price);
			}
			
			$("#red").html(comma(totalPrice));
		})
		
		$(document).on("click","#btn",function(){
			if( $(".foodName").length==0 ){
				alert("상품을 선택하세요");
				return;
			}
			
			
			if(${Auth==null}){
				var a = confirm("배달주문은 회원만 가능합니다. 로그인하시겠습니까?");
				if(a==1){
					location.href = "${pageContext.request.contextPath}/login.do";
				}else{
					return;
				}
			}else{
				var foodNo = "";
				var foodCount = "";
				var totalPrice = uncomma($("#red").html());
				for(var j=0; j<$(".foodName").length; j++){
					
					foodNo += $(".foodNo").eq(j).html()+"-";
					foodCount += $(".count").eq(j).find("span").html()+"-";
				}
				location.href= "${pageContext.request.contextPath}/payment.do?foodNo="+foodNo+"&foodCount="+foodCount+"&total="+totalPrice;
			}
		})
		
		function comma(str) {
   			 str = String(str);
    		 return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			}
		function uncomma(str) {
		    str = String(str);
		    return str.replace(/[^\d]+/g, '');
		}
		
		$(document).on("click",".minus",function(){
			var count = Number($(this).next("span").html())-1;
			if(count==0){
				var a = confirm("삭제하시겠습니까?");
				if(a==1){
					$(this).closest("tr").remove();
				}else{
					return;
				}
			}
			
			$(this).next($("span")).html(count);
			var price = Number(uncomma($(this).closest("td").next().find("span").html()));
			var orinPrice = Number($(this).closest("td").next().attr("data-price"));
			var newPrice = price - orinPrice;
			$(this).closest("td").next().find("span").html(comma(newPrice));
			var newTotal = Number(uncomma($("#red").html()))- orinPrice;
			$("#red").html(comma(newTotal));
		})
		
		$(document).on("click",".plus",function(){
			var count = Number($(this).prev("span").html())+1;
				
			$(this).prev($("span")).html(count);
			var price = Number(uncomma($(this).closest("td").next().find("span").html()));
			var orinPrice = Number($(this).closest("td").next().attr("data-price"));
			var newPrice = price + orinPrice;
			$(this).closest("td").next().find("span").html(comma(newPrice));
			var newTotal = Number(uncomma($("#red").html()))+orinPrice;
			$("#red").html(comma(newTotal));
		})
		
		$(document).on("click",".btnDel",function(){
			var a = confirm("삭제하시겠습니까?");
			if(a==1){
				var deletePrice = Number(uncomma($(this).parent().prev().prev().find("span").html()));
				var newTotal = Number(uncomma($("#red").html())) - deletePrice;
				$("#red").html(comma(newTotal));
				$(this).closest("tr").remove();
			}else{
				return;
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
						<th width="115px">&nbsp;</th>
						<th width="400px">음식명</th>
						<th width="150px">수량</th>
						<th width="130px">가격</th>
						<th width="100px">&nbsp;</th>
					</tr>
				</table>
			<p id="totalPrice">총가격 : <span id="red">0</span>원</p>	
			<button id="btn">결제</button>
			</div>
		</div>
	</div>
	


<%@ include file="../include/footer.jsp" %>