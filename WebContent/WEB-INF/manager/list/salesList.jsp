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
#wrap {
	width: 1000px;
	margin: 0 auto;
	height:500px;
	overflow: auto;
	border: 1px solid #555;
	margin-bottom: 40px;
	
}

#sub {
	width: 80%;
	height:40px;
	padding-left: 15px;
	margin-bottom: 10px;
	
}

#sub #selDate {
	padding-top: 20px;
}

h2 {
	text-align: center;
	margin-bottom: 40px;
}

table {
		border-collapse: collapse;
		width: 100%;
		overflow: hidden;
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
							$("tbody").empty();
							for(var i=0; i<json.list.length; i++){
								var list=json.list[i];
								if(i%2==0){
									$("tbody").append("<tr  role='row' class='odd'>");
									$("tbody tr").eq(i).append("<td class='sorting_1'>"+(i+1)+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssName+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssCount+"개</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssTotalPrice+"원</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssShare+"%</td>");
								}else{
									$("tbody").append("<tr  role='row' class='even'>");
									$("tbody tr").eq(i).append("<td class='sorting_1'>"+(i+1)+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssName+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssCount+"개</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssTotalPrice+"원</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssShare+"%</td>");
								}
								
							}
						}
						
					})
		     }
			 
		});
	})
</script>
<div class="s_visu1">
			<img
				src="${pageContext.request.contextPath}/images/introduce/sub01_visu.jpg">
		</div>
	<h2>판매 현황</h2>
	<div id="wrap">
	
		<div id="sub">
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
<%@ include file="../../view/include/footer.jsp" %>