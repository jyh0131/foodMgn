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
#wrap {
	width: 1000px;
	margin: 0 auto;
}

#sub {
	width: 100%;
	position: relative;
}

#sub #selDate {
	position: absolute;
	bottom: -57px;
	left: 0;
	z-index: 10;
}

h2 {
	text-align: center;
}

#saleList_wrapper {
	width: 1000px !important;
	margin: 0 auto !important;
}

table {
	border-collapse: collapse;
}

table, td, th {
	border: 1px solid black;
}

.dataTables_scroll {
	width: 1000px !important;
}

.dataTables_scrollHeadInner {
	
}

.dataTables_scrollBody {
	max-height: 500px !important;
}
}
</style>

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"
	type="text/css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/js/dataTables.jqueryui.min.js"
	type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.js">
	
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
	
</script>
<script type="text/javascript">
	$(function() {
		$('#saleList').DataTable({
			"scrollY" : "200px",
			"scrollCollapse" : true,
			"paging" : false
		});

		$("#datepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	})
</script>

</head>
<body>
	<div id="wrap">
		<div id="sub">
			<h2>판매 현황</h2>
			<p id="selDate">
				<label>날짜 선택: </label><input type="text" id="datepicker">
			</p>
		</div>
		<table id="saleList">
			<thead>
				<tr>
					<th>순위</th>
					<th>음식명</th>
					<th>판매 수량</th>
					<th>판매 금액</th>
					<th>점유율</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="num" value="0"></c:set>
				<c:forEach var="item" items="${list}">
					<c:set var="num" value="${num+1 }"></c:set>
					<tr>
						<td>${num}</td>
						<td>${item.ssName }</td>
						<td>${item.ssCount }개</td>
						<td><fmt:formatNumber value="${item.ssTotalPrice }" />원</td>
						<td>${item.ssShare }%</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>