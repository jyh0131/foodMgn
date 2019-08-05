<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2{
	text-align: center;
}
#saleList_wrapper{
		width: 1000px !important;
		margin: 0 auto !important ;
	}
	table{
		border-collapse: collapse;
	}
	
	table,td,th{
		border: 1px solid black;
	}
	.dataTables_scroll{
		width: 1000px !important;
	}
	
	
	
	.dataTables_scrollHeadInner{
	}
	.dataTables_scrollBody{
		max-height: 500px !important;
	}
	
	table th:nth-child(3) {
	width: 350px !important;
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
		 $('#saleList').DataTable( {
		        "scrollY":        "200px",
		        "scrollCollapse": true,
		        "paging":         false
		    } );
		 
		
	})
</script>

</head>
<body>
		<h2>결제 현황</h2>
	
	<table id="saleList">
		<thead>
		<tr>
			<th>결제 번호</th>
			<th>결제 시간</th>
			<th>결제 메뉴</th>
			<th>결제 금액</th>
			<th>할인 정보</th>
			<th>할인 금액</th>
			<th>결제 방식</th>
			<th>회원</th>
			<th>결제 상태</th>
		</tr>
		</thead>
		<tbody>
		 <c:forEach var="item" items="${list}">
		 	<tr>
		 		<td>${item.payNo }</td>
		 		<td>
		 			<fmt:formatDate value="${item.payTime }" pattern="yyyy/MM/dd hh:mm:ss" />
		 		</td>
		 		<td>${item.payMenu }</td>
		 		<td>
		 			<fmt:formatNumber value="${item.payPrice }"/>원
		 		</td>
		 		<td>${item.payDiscountInfo }</td>
		 		<td>${item.payDiscountPrice }</td>
		 		<td>
		 			<c:if test="${item.payType==0 }" >
		 				카드
		 			</c:if>
		 			<c:if test="${item.payType==1 }" >
		 				카드
		 			</c:if>
		 		</td>
		 		<td>${item.payMember }</td>
		 		<td>
		 			<c:if test="${item.payCancel==0 }">
		 				결제완료
		 			</c:if>
		 			<c:if test="${item.payCancel==1 }">
		 				취소
		 			</c:if>
		 		</td>
		 	</tr>
		 </c:forEach>
		 </tbody>
	</table>   
	
</body>
</html>