<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../view/include/header_mgn.jsp"%>

<style>
.s_visu1 {
	width: 100%;
	height: 140px;
}

#wrap {
	min-height: 700px;
	height: 700px;
	width: 1300px;
	margin: 0 auto;
	overflow: auto;
	border: 1px solid #555;
	margin-bottom: 40px;
}

#sub {
	width: 1300px;
	margin: 0 auto;
	height: 40px;
	margin-bottom: 10px;
}

#sub #selDate {
	padding-top: 20px;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

 table {
	border-collapse: collapse;
	width: 100%;
	overflow: hidden;
	font-size: 14px;
}

#saleList th, #saleList td {
	border-top: 1px solid #ccc;
	border-right: 1px solid #ccc;
	padding: 5px 10px;
}

#saleList td:last-child {
	border-right: none;
}

 #saleList tr:nth-child(2n) {
	background-color: #F7F7F7;
}

#saleList tr:last-child {
	border-bottom: 1px solid #ccc;
}

#saleList th {
	padding: 10px 10px;
}

#saleList th:nth-child(1) {
	width: 50px;
}

#saleList th:nth-child(2) {
	width: 100px;
}

#saleList th:nth-child(3) {
	width: 300px;
}

#saleList th:nth-child(4) {
	width: 90px;
}

button {
	padding: 3px 5px;
	background-color: #c7a593;
	border: 1px solid #c7a593;
	color: white;
	border-radius: 3px;
	outline: none;
}

.payMemberNo {
	display: none;
}

.bb {
	text-decoration: line-through;
	color: red;
	font-size: 0.9em;
}


</style>



<script type="text/javascript">
	$(function() {
		
		var sum1 = 0;
		var sum2 = 0;
		var sum3 = 0;
		var sum4 = 0;
		
		$(".selectList").datepicker({
			dateFormat : 'yy-mm-dd',
			minDate: null
		});
		
		$("#btnDate").click(function(){
			sum1 = 0;
			sum2 = 0;
			sum3 = 0;
			sum4 = 0;
			if($("input[name='date']").val() == "" || $("input[name='date2']").val() == "") {
				alert("검색할 날짜를 입력하세요.");
	            return false;
	        }
			
			var date = new Date($("input[name='date']").val());
			var date2 = new Date($("input[name='date2']").val());
			
			if((date.getTime()-date2.getTime())>0 ){
				alert("끝나는 날짜는 시작날짜보다 작을 수 없습니다.");
				$("input[name='date']").val("");
				$("input[name='date2']").val("");
	            return false;
			}
				
			
			
			$.ajax({
				url:"${pageContext.request.contextPath}/mgn/saleListDate.do",
				type:"post",
				data:{"date":$("input[name='date']").val(), "date2":$("input[name='date2']").val(), "kind":"date"},
				dataType:"json",
				success: function(json){
					console.log(json);
					
					$("tbody").empty();
					if(json.list.length==0){
						alert("조회조건에 맞는 내역이 없습니다.");
						return false;
					}
					for(var i=0; i<json.list.length; i++){
						var list=json.list[i];
						if(list.payCancel==1){
							$("tbody").append("<tr class='bb'>");
							$("tbody tr").eq(i).append("<td><span class='payNo'>"+list.payNo+"</span><span class='payMemberNo'>"+list.payMemberNo+"</span></td>");
							var formattedDate = new Date(list.payTime);
							var d = formattedDate.getDate();
							if( d<10){
								d= "0"+d;
							}
							var m =  formattedDate.getMonth()+1;
							if( m<10){
								m= "0"+m;
							}
							var y = formattedDate.getFullYear();
							
							var h = formattedDate.getHours();
							if( h<10){
								h= "0"+h;
							}
							var mi = formattedDate.getMinutes();
							if( mi<10){
								mi= "0"+mi;
							}
							
							var s = formattedDate.getSeconds();
							if( s<10){
								s= "0"+s;
							}
							var payDate = y+"/"+m+"/"+d+"<br>"+h+":"+mi+":"+s;
							
							$("tbody tr").eq(i).append("<td><span class='payTime'>"+payDate+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payMenu'>"+list.payMenu+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payPrice'>"+list.payPrice.toLocaleString()+"</span>원</td>");
							$("tbody tr").eq(i).append("<td><span class='payDiscountInfo'>"+list.payDiscountInfo+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice.toLocaleString()+"</span>원</td>");
							if(list.payType==1){
								$("tbody tr").eq(i).append("<td><span class='payType'>현금</span></td>");
							}else{
								$("tbody tr").eq(i).append("<td><span class='payType'>카드</span></td>");
							}
							
							$("tbody tr").eq(i).append("<td><span class='payMember'>"+list.payMember+"</span></td>");
							if(list.payCancel==1){
								$("tbody tr").eq(i).append("<td><span class='payCancel'>취소</span></td>");
							}else{
								$("tbody tr").eq(i).append("<td><span class='payCancel'>결제완료</span></td>");
							}
							
							$("tbody tr").eq(i).append("<td><button class='cancel'>결제취소</button></td>");
							
							sum1 += 1;
							sum3 += 1;
						
						}else{
							$("tbody").append("<tr class='aa'>");
							$("tbody tr").eq(i).append("<td><span class='payNo'>"+list.payNo+"</span><span class='payMemberNo'>"+list.payMemberNo+"</span></td>");
							var formattedDate = new Date(list.payTime);
							var d = formattedDate.getDate();
							if( d<10){
								d= "0"+d;
							}
							var m =  formattedDate.getMonth()+1;
							if( m<10){
								m= "0"+m;
							}
							var y = formattedDate.getFullYear();
							
							var h = formattedDate.getHours();
							if( h<10){
								h= "0"+h;
							}
							var mi = formattedDate.getMinutes();
							if( mi<10){
								mi= "0"+mi;
							}
							
							var s = formattedDate.getSeconds();
							if( s<10){
								s= "0"+s;
							}
							var payDate = y+"/"+m+"/"+d+"<br>"+h+":"+mi+":"+s;
							
							$("tbody tr").eq(i).append("<td><span class='payTime'>"+payDate+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payMenu'>"+list.payMenu+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payPrice'>"+list.payPrice.toLocaleString()+"</span>원</td>");
							$("tbody tr").eq(i).append("<td><span class='payDiscountInfo'>"+list.payDiscountInfo+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice.toLocaleString()+"</span>원</td>");
							if(list.payType==1){
								$("tbody tr").eq(i).append("<td><span class='payType'>현금</span></td>");
							}else{
								$("tbody tr").eq(i).append("<td><span class='payType'>카드</span></td>");
							}
							
							$("tbody tr").eq(i).append("<td><span class='payMember'>"+list.payMember+"</span></td>");
							if(list.payCancel==1){
								$("tbody tr").eq(i).append("<td><span class='payCancel'>취소</span></td>");
							}else{
								$("tbody tr").eq(i).append("<td><span class='payCancel'>결제완료</span></td>");
							}
							
							$("tbody tr").eq(i).append("<td><button class='cancel'>결제취소</button></td>");
							
							sum1+=1;
							sum2+=1;
							sum4+=list.payPrice;
						     
							
						}
						
						
					}
					
					 $("#total1").text( sum1.toLocaleString());
					 $("#total2").text( sum2.toLocaleString());
					 $("#total3").text( sum3.toLocaleString());
				     $("#total4").text( sum4.toLocaleString());
				     
				}
				
			})
			
			
			
			
		})
		
		
		//전체보기
		
		$(document).on("click","#all",function(){
			sum1 = 0;
			sum2 = 0;
			sum3 = 0;
			sum4 = 0;
			$("input[name='date']").val("");
			$("input[name='date2']").val(""); 
			$.ajax({
				url:"${pageContext.request.contextPath }/mgn/saleListDate.do",
				type:"get",
				dataType:"json",
				success:function(json){
					console.log(json);
					$("tbody").empty();
					if(json.list.length==0){
						alert("조회조건에 맞는 내역이 없습니다.");
						return false;
					}
					for(var i=0; i<json.list.length; i++){
						var list=json.list[i];
						if(list.payCancel==1){
							$("tbody").append("<tr class='bb'>");
							$("tbody tr").eq(i).append("<td><span class='payNo'>"+list.payNo+"</span><span class='payMemberNo'>"+list.payMemberNo+"</span></td>");
							var formattedDate = new Date(list.payTime);
							var d = formattedDate.getDate();
							if( d<10){
								d= "0"+d;
							}
							var m =  formattedDate.getMonth()+1;
							if( m<10){
								m= "0"+m;
							}
							var y = formattedDate.getFullYear();
							
							var h = formattedDate.getHours();
							if( h<10){
								h= "0"+h;
							}
							var mi = formattedDate.getMinutes();
							if( mi<10){
								mi= "0"+mi;
							}
							
							var s = formattedDate.getSeconds();
							if( s<10){
								s= "0"+s;
							}
							var payDate = y+"/"+m+"/"+d+"<br>"+h+":"+mi+":"+s;
							
							$("tbody tr").eq(i).append("<td><span class='payTime'>"+payDate+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payMenu'>"+list.payMenu+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payPrice'>"+list.payPrice.toLocaleString()+"</span>원</td>");
							$("tbody tr").eq(i).append("<td><span class='payDiscountInfo'>"+list.payDiscountInfo+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice.toLocaleString()+"</span>원</td>");
							if(list.payType==1){
								$("tbody tr").eq(i).append("<td><span class='payType'>현금</span></td>");
							}else{
								$("tbody tr").eq(i).append("<td><span class='payType'>카드</span></td>");
							}
							
							$("tbody tr").eq(i).append("<td><span class='payMember'>"+list.payMember+"</span></td>");
							if(list.payCancel==1){
								$("tbody tr").eq(i).append("<td><span class='payCancel'>취소</span></td>");
							}else{
								$("tbody tr").eq(i).append("<td><span class='payCancel'>결제완료</span></td>");
							}
							
							$("tbody tr").eq(i).append("<td><button class='cancel'>결제취소</button></td>");
							

							sum1 += 1;
							sum3 += 1;
						}else{
							$("tbody").append("<tr class='aa'>");
							$("tbody tr").eq(i).append("<td><span class='payNo'>"+list.payNo+"</span><span class='payMemberNo'>"+list.payMemberNo+"</span></td>");
							var formattedDate = new Date(list.payTime);
							var d = formattedDate.getDate();
							if( d<10){
								d= "0"+d;
							}
							var m =  formattedDate.getMonth()+1;
							if( m<10){
								m= "0"+m;
							}
							var y = formattedDate.getFullYear();
							
							var h = formattedDate.getHours();
							if( h<10){
								h= "0"+h;
							}
							var mi = formattedDate.getMinutes();
							if( mi<10){
								mi= "0"+mi;
							}
							
							var s = formattedDate.getSeconds();
							if( s<10){
								s= "0"+s;
							}
							var payDate = y+"/"+m+"/"+d+"<br>"+h+":"+mi+":"+s;
							
							$("tbody tr").eq(i).append("<td><span class='payTime'>"+payDate+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payMenu'>"+list.payMenu+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payPrice'>"+list.payPrice.toLocaleString()+"</span>원</td>");
							$("tbody tr").eq(i).append("<td><span class='payDiscountInfo'>"+list.payDiscountInfo+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice.toLocaleString()+"</span>원</td>");
							if(list.payType==1){
								$("tbody tr").eq(i).append("<td><span class='payType'>현금</span></td>");
							}else{
								$("tbody tr").eq(i).append("<td><span class='payType'>카드</span></td>");
							}
							
							$("tbody tr").eq(i).append("<td><span class='payMember'>"+list.payMember+"</span></td>");
							if(list.payCancel==1){
								$("tbody tr").eq(i).append("<td><span class='payCancel'>취소</span></td>");
							}else{
								$("tbody tr").eq(i).append("<td><span class='payCancel'>결제완료</span></td>");
							}
							
							$("tbody tr").eq(i).append("<td><button class='cancel'>결제취소</button></td>");
							

							sum1+=1;
							sum2+=1;
							sum4+=list.payPrice;
							
							
						}
						
						
					}
					$("#total1").text( sum1.toLocaleString());
					 $("#total2").text( sum2.toLocaleString());
					 $("#total3").text( sum3.toLocaleString());
				     $("#total4").text( sum4.toLocaleString());
				}
			}) 
			
			 
		})
		
		
		
	//오늘날짜보기
		
		$(document).on("click","#btnToday",function(){
			sum1 = 0;
			sum2 = 0;
			sum3 = 0;
			sum4 = 0;
			$("input[name='date']").val("");
			$("input[name='date2']").val(""); 
			var dt = new Date();
			var recentYear = dt.getFullYear();
		    var recentMonth = dt.getMonth() + 1;
		    var recentDay = dt.getDate();
		 
		    if(recentMonth < 10) recentMonth = "0" + recentMonth;
		    if(recentDay < 10) recentDay = "0" + recentDay;
		    
		    var today = recentYear + "-" + recentMonth + "-" + recentDay;
			
			$.ajax({
				url:"${pageContext.request.contextPath}/mgn/saleListDate.do",
				type:"post",
				data:{"date":today, "date2":today, "kind":"date"},
				dataType:"json",
				success: function(json){
					console.log(json);
					
					$("tbody").empty();
					if(json.list.length==0){
						alert("조회조건에 맞는 내역이 없습니다.");
						return false;
					}
					for(var i=0; i<json.list.length; i++){
						var list=json.list[i];
						if(list.payCancel==1){
							$("tbody").append("<tr class='bb'>");
							$("tbody tr").eq(i).append("<td><span class='payNo'>"+list.payNo+"</span><span class='payMemberNo'>"+list.payMemberNo+"</span></td>");
							var formattedDate = new Date(list.payTime);
							var d = formattedDate.getDate();
							if( d<10){
								d= "0"+d;
							}
							var m =  formattedDate.getMonth()+1;
							if( m<10){
								m= "0"+m;
							}
							var y = formattedDate.getFullYear();
							
							var h = formattedDate.getHours();
							if( h<10){
								h= "0"+h;
							}
							var mi = formattedDate.getMinutes();
							if( mi<10){
								mi= "0"+mi;
							}
							
							var s = formattedDate.getSeconds();
							if( s<10){
								s= "0"+s;
							}
							var payDate = y+"/"+m+"/"+d+"<br>"+h+":"+mi+":"+s;
							
							$("tbody tr").eq(i).append("<td><span class='payTime'>"+payDate+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payMenu'>"+list.payMenu+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payPrice'>"+list.payPrice.toLocaleString()+"</span>원</td>");
							$("tbody tr").eq(i).append("<td><span class='payDiscountInfo'>"+list.payDiscountInfo+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice.toLocaleString()+"</span>원</td>");
							if(list.payType==1){
								$("tbody tr").eq(i).append("<td><span class='payType'>현금</span></td>");
							}else{
								$("tbody tr").eq(i).append("<td><span class='payType'>카드</span></td>");
							}
							
							$("tbody tr").eq(i).append("<td><span class='payMember'>"+list.payMember+"</span></td>");
							if(list.payCancel==1){
								$("tbody tr").eq(i).append("<td><span class='payCancel'>취소</span></td>");
							}else{
								$("tbody tr").eq(i).append("<td><span class='payCancel'>결제완료</span></td>");
							}
							
							$("tbody tr").eq(i).append("<td><button class='cancel'>결제취소</button></td>");
								sum1 += 1;
								sum3 += 1;
							
						}else{
							$("tbody").append("<tr class='aa'>");
							$("tbody tr").eq(i).append("<td><span class='payNo'>"+list.payNo+"</span><span class='payMemberNo'>"+list.payMemberNo+"</span></td>");
							var formattedDate = new Date(list.payTime);
							var d = formattedDate.getDate();
							if( d<10){
								d= "0"+d;
							}
							var m =  formattedDate.getMonth()+1;
							if( m<10){
								m= "0"+m;
							}
							var y = formattedDate.getFullYear();
							
							var h = formattedDate.getHours();
							if( h<10){
								h= "0"+h;
							}
							var mi = formattedDate.getMinutes();
							if( mi<10){
								mi= "0"+mi;
							}
							
							var s = formattedDate.getSeconds();
							if( s<10){
								s= "0"+s;
							}
							var payDate = y+"/"+m+"/"+d+"<br>"+h+":"+mi+":"+s;
							
							$("tbody tr").eq(i).append("<td><span class='payTime'>"+payDate+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payMenu'>"+list.payMenu+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payPrice'>"+list.payPrice.toLocaleString()+"</span>원</td>");
							$("tbody tr").eq(i).append("<td><span class='payDiscountInfo'>"+list.payDiscountInfo+"</span></td>");
							$("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice.toLocaleString()+"</span>원</td>");
							if(list.payType==1){
								$("tbody tr").eq(i).append("<td><span class='payType'>현금</span></td>");
							}else{
								$("tbody tr").eq(i).append("<td><span class='payType'>카드</span></td>");
							}
							
							$("tbody tr").eq(i).append("<td><span class='payMember'>"+list.payMember+"</span></td>");
							if(list.payCancel==1){
								$("tbody tr").eq(i).append("<td><span class='payCancel'>취소</span></td>");
							}else{
								$("tbody tr").eq(i).append("<td><span class='payCancel'>결제완료</span></td>");
							}
							
							$("tbody tr").eq(i).append("<td><button class='cancel'>결제취소</button></td>");
							sum1+=1;
							sum2+=1;
							sum4+=list.payPrice;
							
						}
						
						
					}
					
					$("#total1").text( sum1.toLocaleString());
					 $("#total2").text( sum2.toLocaleString());
					 $("#total3").text( sum3.toLocaleString());
				     $("#total4").text( sum4.toLocaleString());
				}
				
			})
		})
		
		
		
		
		
		
		$(document).on("click",".cancel",function(){
			var a = confirm("정말 결제취소 하시겠습니까?");
			var Cancel = $(this).parent().parent().find(".payCancel").text();
			
			if(a==1 && Cancel!="취소"){
				sum1 = 0;
				sum2 = 0;
				sum3 = 0;
				sum4 = 0;
				var payNo = $(this).parent().parent().find(".payNo").text();
				var payDiscountInfo = $(this).parent().parent().find(".payDiscountInfo").text();
				var payDiscountPrice2 = $(this).parent().parent().find(".payDiscountPrice").text();
				var payDiscountPrice = payDiscountPrice2.replace(",","");
				var payMember = $(this).parent().parent().find(".payMember").text();
				var payCancel = $(this).parent().parent().find(".payCancel").text();
				var payMemberNo = $(this).parent().parent().find(".payMemberNo").text();
				$.ajax({
					url:"${pageContext.request.contextPath }/mgn/saleCancel.do",
					type:"get",
					data : {"payNo":payNo,"payDiscountInfo":payDiscountInfo,"payDiscountPrice":payDiscountPrice,"payMember":payMember,"payCancel":payCancel,"payMemberNo":payMemberNo},
					dataType:"json",
					success:function(json){
						console.log(json);
						$("tbody").empty();
						
						for(var i=0; i<json.list.length; i++){
							var list=json.list[i];
							if(list.payCancel==1){
								$("tbody").append("<tr class='bb'>");
								$("tbody tr").eq(i).append("<td><span class='payNo'>"+list.payNo+"</span><span class='payMemberNo'>"+list.payMemberNo+"</span></td>");
								var formattedDate = new Date(list.payTime);
								var d = formattedDate.getDate();
								if( d<10){
									d= "0"+d;
								}
								var m =  formattedDate.getMonth()+1;
								if( m<10){
									m= "0"+m;
								}
								var y = formattedDate.getFullYear();
								
								var h = formattedDate.getHours();
								if( h<10){
									h= "0"+h;
								}
								var mi = formattedDate.getMinutes();
								if( mi<10){
									mi= "0"+mi;
								}
								
								var s = formattedDate.getSeconds();
								if( s<10){
									s= "0"+s;
								}
								var payDate = y+"/"+m+"/"+d+"<br>"+h+":"+mi+":"+s;
								
								$("tbody tr").eq(i).append("<td><span class='payTime'>"+payDate+"</span></td>");
								$("tbody tr").eq(i).append("<td><span class='payMenu'>"+list.payMenu+"</span></td>");
								$("tbody tr").eq(i).append("<td><span class='payPrice'>"+list.payPrice.toLocaleString()+"</span>원</td>");
								$("tbody tr").eq(i).append("<td><span class='payDiscountInfo'>"+list.payDiscountInfo+"</span></td>");
								$("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice.toLocaleString()+"</span>원</td>");
								if(list.payType==1){
									$("tbody tr").eq(i).append("<td><span class='payType'>현금</span></td>");
								}else{
									$("tbody tr").eq(i).append("<td><span class='payType'>카드</span></td>");
								}
								
								$("tbody tr").eq(i).append("<td><span class='payMember'>"+list.payMember+"</span></td>");
								if(list.payCancel==1){
									$("tbody tr").eq(i).append("<td><span class='payCancel'>취소</span></td>");
								}else{
									$("tbody tr").eq(i).append("<td><span class='payCancel'>결제완료</span></td>");
								}
								
								$("tbody tr").eq(i).append("<td><button class='cancel'>결제취소</button></td>");
								sum1 += 1;
								sum3 += 1;
							
							}else{
								$("tbody").append("<tr class='aa'>");
								$("tbody tr").eq(i).append("<td><span class='payNo'>"+list.payNo+"</span><span class='payMemberNo'>"+list.payMemberNo+"</span></td>");
								var formattedDate = new Date(list.payTime);
								var d = formattedDate.getDate();
								if( d<10){
									d= "0"+d;
								}
								var m =  formattedDate.getMonth()+1;
								if( m<10){
									m= "0"+m;
								}
								var y = formattedDate.getFullYear();
								
								var h = formattedDate.getHours();
								if( h<10){
									h= "0"+h;
								}
								var mi = formattedDate.getMinutes();
								if( mi<10){
									mi= "0"+mi;
								}
								
								var s = formattedDate.getSeconds();
								if( s<10){
									s= "0"+s;
								}
								var payDate = y+"/"+m+"/"+d+"<br>"+h+":"+mi+":"+s;
								
								$("tbody tr").eq(i).append("<td><span class='payTime'>"+payDate+"</span></td>");
								$("tbody tr").eq(i).append("<td><span class='payMenu'>"+list.payMenu+"</span></td>");
								$("tbody tr").eq(i).append("<td><span class='payPrice'>"+list.payPrice.toLocaleString()+"</span>원</td>");
								$("tbody tr").eq(i).append("<td><span class='payDiscountInfo'>"+list.payDiscountInfo+"</span></td>");
								$("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice.toLocaleString()+"</span>원</td>");
								if(list.payType==1){
									$("tbody tr").eq(i).append("<td><span class='payType'>현금</span></td>");
								}else{
									$("tbody tr").eq(i).append("<td><span class='payType'>카드</span></td>");
								}
								
								$("tbody tr").eq(i).append("<td><span class='payMember'>"+list.payMember+"</span></td>");
								if(list.payCancel==1){
									$("tbody tr").eq(i).append("<td><span class='payCancel'>취소</span></td>");
								}else{
									$("tbody tr").eq(i).append("<td><span class='payCancel'>결제완료</span></td>");
								}
								
								$("tbody tr").eq(i).append("<td><button class='cancel'>결제취소</button></td>");
								sum1+=1;
								sum2+=1;
								sum4+=list.payPrice;
							}
							
							$("#total1").text( sum1.toLocaleString());
							 $("#total2").text( sum2.toLocaleString());
							 $("#total3").text( sum3.toLocaleString());
						     $("#total4").text( sum4.toLocaleString());
							
							
						}
					}
				})  
			}else if(a==1 && Cancel=="취소"){
				alert("취소된 결제사항입니다");
			}
		})
		
		
		
		$(document).on("click","#btnOk",function(){
			$("tr").each(function(i, obj) {
				
				var a = $(obj).find("td").eq(8).text();
				
				if(a=="취소"){
					$(obj).remove();
				}
				
			})
			
		})
		
		 $("#total1").text( Number($("#totals").val()).toLocaleString());
	     $("#total2").text( Number($("#totals2").val()).toLocaleString());
	     $("#total3").text( Number($("#totals3").val()).toLocaleString());
	     $("#total4").text( Number($("#totalp").val()).toLocaleString());
	
		
	})
</script>
<div class="s_visu1"></div>

<h2>결제 현황</h2>
<div id="sub">
		<p id="selDate">
		<input type="text" name="date" class="selectList" autocomplete="off"> ~ <input type="text" name="date2" class="selectList" autocomplete="off"> <button id="btnDate">날짜로검색</button>
			<button id="btnToday">오늘날짜 보기</button>
			<button id="btnOk">결제완료만 보기</button>
			<button id="all">전체보기</button>
			 총 판매: <span id="total1"></span>건 결제완료: <span id="total2"></span>건 결제취소  : <span id="total3"></span>건   결제금액  : <span id="total4"></span>원
		</p>  

	</div>
<div id="wrap">

	
<c:set var="sum1"></c:set>
	<c:set var="sum2"></c:set>
	<c:set var="sum3"></c:set>
	<c:set var="sum4"></c:set>
	<table id="saleList" class="display">
		<thead>
			<tr>
				<th>결제<br>번호
				</th>
				<th>결제 시간</th>
				<th>결제 메뉴</th>
				<th>결제 금액</th>
				<th>할인 정보</th>
				<th>할인 금액</th>
				<th>결제 방식</th>
				<th>회원</th>
				<th>결제 상태</th>
				<th>결제 취소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<c:if test="${item.payCancel==0 }">
					<tr class="aa">
						<td><span class="payNo">${item.payNo }</span><span
							class="payMemberNo">${item.payMemberNo }</span></td>
						<td><span class="payTime"><fmt:formatDate
									value="${item.payTime}" pattern="yyyy/MM/dd kk:mm:ss" /></span></td>
						<td><span class="payMenu">${item.payMenu }</span></td>
						<td><span class="payPrice"><fmt:formatNumber
									value="${item.payPrice}" /></span>원</td>
						<td><span class="payDiscountInfo">${item.payDiscountInfo}</span></td>
						<td><span class="payDiscountPrice"><fmt:formatNumber
									value="${item.payDiscountPrice}"/></span>원</td>
						<td><span class="payType"><c:if
									test="${item.payType==0 }">
		 				카드
		 			</c:if> <c:if test="${item.payType==1 }">
		 				현금
		 			</c:if></span></td>
						<td><span class="payMember">${item.payMember }</span></td>
						<td><span class="payCancel"><c:if test="${item.payCancel==0}">결제완료</c:if><c:if test="${item.payCancel==1}">취소</c:if></span></td>
						<td>
							<button class="cancel">결제취소</button>
						</td>
					</tr>
					<c:set var="sum2" value="${sum2+1 }"></c:set>
					<c:set var="sum4" value="${sum4 + item.payPrice}"></c:set>
				</c:if>
				<c:if test="${item.payCancel==1 }">
					<tr class="bb">
						<td><span class="payNo">${item.payNo }</span><span
							class="payMemberNo">${item.payMemberNo }</span></td>
						<td><span class="payTime"><fmt:formatDate
									value="${item.payTime}" pattern="yyyy/MM/dd hh:mm:ss" /></span></td>
						<td><span class="payMenu">${item.payMenu }</span></td>
						<td><span class="payPrice"><fmt:formatNumber
									value="${item.payPrice}" /></span>원</td>
						<td><span class="payDiscountInfo">${item.payDiscountInfo}</span></td>
						<td><span class="payDiscountPrice"><fmt:formatNumber
									value="${item.payDiscountPrice}"/></span>원</td>
						<td><span class="payType"><c:if
									test="${item.payType==0 }">
		 				카드
		 			</c:if> <c:if test="${item.payType==1 }">
		 				현금
		 			</c:if></span></td>
						<td><span class="payMember">${item.payMember }</span></td>
						<td><span class="payCancel"><c:if test="${item.payCancel==0}">결제완료</c:if><c:if test="${item.payCancel==1}">취소</c:if></span></td>
						<td>
							<button class="cancel">결제취소</button>
						</td>
					</tr>
					<c:set var="sum3" value="${sum3+1 }"></c:set>
				</c:if>
					<c:set var="sum1" value="${sum1+1 }"></c:set>
						
						
						

			</c:forEach>
			<input type="hidden" value="${sum1 }" id="totals">
			<input type="hidden" value="${sum2 }" id="totals2">
			<input type="hidden" value="${sum3 }" id="totals3">
			<input type="hidden" value="${sum4 }" id="totalp">
		</tbody>
	</table>
</div>
<%@ include file="../../view/include/footer.jsp"%>