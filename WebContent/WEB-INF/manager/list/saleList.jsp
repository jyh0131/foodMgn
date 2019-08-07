<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../view/include/header_mgn.jsp" %>

<style>
.s_visu1 {
	width: 100%;
	height: 350px;
	margin-bottom: 50px;
}

.s_visu1 img {
	width: 100%;
	height: 350px;
}
h2{
	text-align: center;
}
#wrap {
		min-height: 700px;
		height:700px;
		width: 1300px;
		margin: 0 auto;
		overflow: auto;
		border: 1px solid #555;
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
}
</style>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" type="text/css" > 
<script src="https://code.jquery.com/jquery-3.3.1.js">
	
</script>
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
</script>
<script type="text/javascript">

</script>
<div class="s_visu1">
			<img
				src="${pageContext.request.contextPath}/images/introduce/sub01_visu.jpg">
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
		 		<td>${item.payDiscountPrice }원</td>
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
		 		<td>
		 			<button class="delete">결제취소</button>
		 		</td>
		 	</tr>
		 </c:forEach>
		 </tbody>
	</table>   
	</div>
<%@ include file="../../view/include/footer.jsp" %>