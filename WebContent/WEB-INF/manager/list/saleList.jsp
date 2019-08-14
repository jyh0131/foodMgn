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
}
</style>



<script type="text/javascript">
	$(function() {
		
		$(".selectList").datepicker({
			dateFormat : 'yy-mm-dd',
			minDate: null
		});
		
		$("#btnDate").click(function(){
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
			
			
			
			
		})
		
		
		//전체보기
		
		$(document).on("click","#all",function(){
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
			
			 
		})
		
		
		
		
		
		
		
		
		
		
		
		
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
			}else if(a==1 && Cancel=="취소"){
				alert("취소된 결제사항입니다");
			}
		})
		
		
	
		
	})
</script>
<div class="s_visu1"></div>

<h2>결제 현황</h2>
<div id="sub">
		<p id="selDate">
		<input type="text" name="date" class="selectList" autocomplete="off"> ~ <input type="text" name="date2" class="selectList" autocomplete="off"> <button id="btnDate">날짜로검색</button>
			<button id="all">전체보기</button>
		</p>  

	</div>
<div id="wrap">

	

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
						<td><span class="payDiscountPrice">${item.payDiscountPrice}</span>원</td>
						<td><span class="payType"><c:if
									test="${item.payType==0 }">
		 				카드
		 			</c:if> <c:if test="${item.payType==1 }">
		 				현금
		 			</c:if></span></td>
						<td><span class="payMember">${item.payMember }</span></td>
						<td><span class="payCancel"><c:if test="${item.payCancel==0}">결제완료</c:if><c:if test="${item.payCancel==1 }">취소</c:if></span></td>
						<td>
							<button class="cancel">결제취소</button>
						</td>
					</tr>
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
						<td><span class="payDiscountPrice">${item.payDiscountPrice}</span>원</td>
						<td><span class="payType"><c:if
									test="${item.payType==0 }">
		 				카드
		 			</c:if> <c:if test="${item.payType==1 }">
		 				현금
		 			</c:if></span></td>
						<td><span class="payMember">${item.payMember }</span></td>
						<td><span class="payCancel"><c:if
									test="${item.payCancel==0 }">결제완료</c:if> <c:if
									test="${item.payCancel==1 }">취소</c:if></span></td>
						<td>
							<button class="cancel">결제취소</button>
						</td>
					</tr>
				</c:if>

			</c:forEach>
		</tbody>
	</table>
</div>
<%@ include file="../../view/include/footer.jsp"%>