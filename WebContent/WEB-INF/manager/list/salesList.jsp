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

<script src="https://code.jquery.com/jquery-3.3.1.js">
	
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
</script>
<script type="text/javascript">
	$(function() {
		$('#saleTable').DataTable({
			"scrollY" : "200px",
			"scrollCollapse" : true,
			"paging" : false
		});

		$("#datepicker").datepicker({
			dateFormat : 'yy-mm-dd',
			 onSelect: function(dateText, inst) {
		          var date = $(this).val();
		          $.ajax({
						url:"${pageContext.request.contextPath }/salesList.do",
						type:"get",
						data : {"date":date},
						dataType:"json",
						success:function(json){
							console.log(json);
							$("#tbody").empty();
							for(var i=0; i<json.list.length; i++){
								var list=json.list[i];
								if(i%2==0){
									$("#tbody").append("<tr  role='row' class='odd'>");
									$("#tbody tr").eq(i).append("<td class='sorting_1'>"+(i+1)+"</td>");
									$("#tbody tr").eq(i).append("<td>"+list.ssName+"</td>");
									$("#tbody tr").eq(i).append("<td>"+list.ssCount+"개</td>");
									$("#tbody tr").eq(i).append("<td>"+list.ssTotalPrice+"원</td>");
									$("#tbody tr").eq(i).append("<td>"+list.ssShare+"%</td>");
								}else{
									$("#tbody").append("<tr  role='row' class='even'>");
									$("#tbody tr").eq(i).append("<td class='sorting_1'>"+(i+1)+"</td>");
									$("#tbody tr").eq(i).append("<td>"+list.ssName+"</td>");
									$("#tbody tr").eq(i).append("<td>"+list.ssCount+"개</td>");
									$("#tbody tr").eq(i).append("<td>"+list.ssTotalPrice+"원</td>");
									$("#tbody tr").eq(i).append("<td>"+list.ssShare+"%</td>");
								}
								
							}
						}
						
					})
		     }
			
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
		<table id="saleTable" class="display">
			<thead>
				<tr>
					<th>순위</th>
					<th>음식명</th>
					<th>판매 수량</th>
					<th>판매 금액</th>
					<th>점유율</th>
				</tr>
			</thead>
			<tbody id="tbody">
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