<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../view/include/header_mgn.jsp" %>

<style>
.s_visu1 {
	width: 100%;
	height:140px;
}



#wrap {
		min-height: 700px;
		height:700px;
		width: 1300px;
		margin: 0 auto;
		overflow: auto;
		border: 1px solid #555;
		margin-bottom: 40px;
	}
	
	h2{
	text-align: center;
	margin-bottom: 20px;
}

	table {
		border-collapse: collapse;
		width: 100%;
		overflow: hidden;
		font-size: 14px;
	}
	th, td {
		border-top: 1px solid #ccc;
		border-right: 1px solid #ccc;
		padding: 5px 10px;
	}
	td:last-child {
		border-right: none;
	}
	tr:nth-child(2n) {
		background-color: #F7F7F7;
	}
	tr:last-child {
		border-bottom: 1px solid #ccc;
	}
	th {
		padding: 10px 10px;
	}
	th:nth-child(1) {
		width: 50px;
	}
	
	th:nth-child(2) {
		width: 100px; 
	}
	th:nth-child(3) {  
		width: 300px;
	}
	th:nth-child(4) {
		width: 90px;
	} 
	
	button{
		padding: 3px 5px;
		background-color: #c7a593;
		border: 1px solid #c7a593;
		color: white;
		border-radius: 3px;
		outline: none;
	}
	
	 .payMemberNo{
		display: none;
	} 
	.bb{
		text-decoration: line-through;
		color: red;
		font-size: 0.9em;
	}
}
</style>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" type="text/css" > 
<script src="https://code.jquery.com/jquery-3.3.1.js">
	
</script>
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
</script>
<script type="text/javascript">
	$(function() {
		$(document).on("click",".cancel",function(){
			var a = confirm("정말 결제취소 하시겠습니까?");
			var Cancel = $(this).parent().parent().find(".payCancel").text();
			if(a==1 && Cancel!="취소"){
				var payNo = $(this).parent().parent().find(".payNo").text();
				var payDiscountInfo = $(this).parent().parent().find(".payDiscountInfo").text();
				var payDiscountPrice = $(this).parent().parent().find(".payDiscountPrice").text();
				var payMember = $(this).parent().parent().find(".payMember").text();
				var payCancel = $(this).parent().parent().find(".payCancel").text();
				var payMemberNo = $(this).parent().parent().find(".payMemberNo").text();
				$.ajax({
					url:"${pageContext.request.contextPath }/saleCancel.do",
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
								$("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice+"</span>원</td>");
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
								$("tbody tr").eq(i).append("<td><span class='payDiscountPrice'>"+list.payDiscountPrice+"</span>원</td>");
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
								
							}
							
							
						}
					}
				})  
			}else{
				alert("취소된 결제사항입니다");
			}
		})
	})
</script>
<div class="s_visu1">
			
		</div>

	<h2>결제 현황</h2>
	<div id="wrap">
	
	<table id="saleList" class="display">
		<thead>
		<tr>
			<th>결제<br>번호</th>
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
		 		<td><span class="payNo">${item.payNo }</span><span class="payMemberNo">${item.payMemberNo }</span></td>
		 		<td>
		 			<span class="payTime"><fmt:formatDate value="${item.payTime}" pattern="yyyy/MM/dd hh:mm:ss" /></span>
		 		</td>
		 		<td><span class="payMenu">${item.payMenu }</span></td>
		 		<td>
		 			<span class="payPrice"><fmt:formatNumber value="${item.payPrice}"/></span>원
		 		</td>
		 		<td><span class="payDiscountInfo">${item.payDiscountInfo}</span></td>
		 		<td><span class="payDiscountPrice">${item.payDiscountPrice}</span>원</td>
		 		<td>
		 			<span class="payType"><c:if test="${item.payType==0 }" >
		 				카드
		 			</c:if>
		 			<c:if test="${item.payType==1 }" >
		 				현금
		 			</c:if></span>
		 		</td>
		 		<td><span class="payMember">${item.payMember }</span></td>
		 		<td>
		 		<span class="payCancel"><c:if test="${item.payCancel==0 }">결제완료</c:if><c:if test="${item.payCancel==1 }">취소</c:if></span>
		 		</td>
		 		<td>
		 			<button class="cancel">결제취소</button>
		 		</td>
		 	</tr>
			</c:if>
			<c:if test="${item.payCancel==1 }">
				<tr class="bb">
		 		<td><span class="payNo">${item.payNo }</span><span class="payMemberNo">${item.payMemberNo }</span></td>
		 		<td>
		 			<span class="payTime"><fmt:formatDate value="${item.payTime}" pattern="yyyy/MM/dd hh:mm:ss" /></span>
		 		</td>
		 		<td><span class="payMenu">${item.payMenu }</span></td>
		 		<td>
		 			<span class="payPrice"><fmt:formatNumber value="${item.payPrice}"/></span>원
		 		</td>
		 		<td><span class="payDiscountInfo">${item.payDiscountInfo}</span></td>
		 		<td><span class="payDiscountPrice">${item.payDiscountPrice}</span>원</td>
		 		<td>
		 			<span class="payType"><c:if test="${item.payType==0 }" >
		 				카드
		 			</c:if>
		 			<c:if test="${item.payType==1 }" >
		 				현금
		 			</c:if></span>
		 		</td>
		 		<td><span class="payMember">${item.payMember }</span></td>
		 		<td>
		 		<span class="payCancel"><c:if test="${item.payCancel==0 }">결제완료</c:if><c:if test="${item.payCancel==1 }">취소</c:if></span>
		 		</td>
		 		<td>
		 			<button class="cancel">결제취소</button>
		 		</td>
		 	</tr>
			</c:if>
		 	
		 </c:forEach>
		 </tbody>
	</table>   
	</div>
<%@ include file="../../view/include/footer.jsp" %>