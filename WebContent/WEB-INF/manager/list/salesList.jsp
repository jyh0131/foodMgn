<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../view/include/header_mgn.jsp" %>
<style>
.s_visu1 {
	width: 100%;
	height: 140px;
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
					$("#fd_year option").eq(0).prop("selected", "true");    
				    $("#fd_month  option").eq(0).prop("selected", "true");   
		          var date = $(this).val();
		          $.ajax({
						url:"${pageContext.request.contextPath }/mgn/salesList.do",
						type:"get",
						data : {"date":date},
						dataType:"json",
						success:function(json){
							console.log(json);
						
							$("tbody").empty();
							if(json.list.length==0){
	    						alert("조회조건에 맞는 내역이 없습니다.");
	    						return false;
	    					}
							var totalCount=0;
							var totalPrice=0;
							for(var i=0; i<json.list.length; i++){
								var list=json.list[i];
								if(i%2==0){
									$("tbody").append("<tr  role='row' class='odd'>");
									$("tbody tr").eq(i).append("<td class='sorting_1'>"+(i+1)+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssName+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssCount+"개</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssTotalPrice.toLocaleString()+"원</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssShare+"%</td>");
									totalCount += list.ssCount;
									totalPrice += list.ssTotalPrice;
								}else{
									$("tbody").append("<tr  role='row' class='even'>");
									$("tbody tr").eq(i).append("<td class='sorting_1'>"+(i+1)+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssName+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssCount+"개</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssTotalPrice.toLocaleString()+"원</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssShare+"%</td>");
									totalCount += list.ssCount;
									totalPrice += list.ssTotalPrice;
								}
								
							}
							
							$("tbody").append("<tr id='total'>");
							$("tbody tr").eq(i).append("<td></td>");
							$("tbody tr").eq(i).append("<td></td>");
							$("tbody tr").eq(i).append("<td>"+totalCount.toLocaleString()+"개</td>");
							$("tbody tr").eq(i).append("<td>"+totalPrice.toLocaleString()+"원</td>");
							$("tbody tr").eq(i).append("<td>100.0%</td>");
						}
						
					})
		     }
			 
		});
		
		$("#all").click(function() {
			$("#fd_year option").eq(0).prop("selected", "true");    
		    $("#fd_month  option").eq(0).prop("selected", "true");   
			$("#datepicker").val("");
			  $.ajax({
					url:"${pageContext.request.contextPath }/mgn/salesListAll.do",
					type:"get",
					dataType:"json",
					success:function(json){
						console.log(json);
					
						$("tbody").empty();
						if(json.list.length==0){
    						alert("조회조건에 맞는 내역이 없습니다.");
    						return false;
    					}
						var totalCount=0;
						var totalPrice=0;
						
						for(var i=0; i<json.list.length; i++){
							var list=json.list[i];
							if(i%2==0){
								$("tbody").append("<tr  role='row' class='odd'>");
								$("tbody tr").eq(i).append("<td class='sorting_1'>"+(i+1)+"</td>");
								$("tbody tr").eq(i).append("<td>"+list.ssName+"</td>");
								$("tbody tr").eq(i).append("<td>"+list.ssCount+"개</td>");
								totalCount += list.ssCount;
								$("tbody tr").eq(i).append("<td>"+list.ssTotalPrice.toLocaleString()+"원</td>");
								totalPrice += list.ssTotalPrice;
								$("tbody tr").eq(i).append("<td>"+list.ssShare+"%</td>");
							}else{
								$("tbody").append("<tr  role='row' class='even'>");
								$("tbody tr").eq(i).append("<td class='sorting_1'>"+(i+1)+"</td>");
								$("tbody tr").eq(i).append("<td>"+list.ssName+"</td>");
								$("tbody tr").eq(i).append("<td>"+list.ssCount+"개</td>")
								totalCount += list.ssCount;;
								$("tbody tr").eq(i).append("<td>"+list.ssTotalPrice.toLocaleString()+"원</td>");
								totalPrice += list.ssTotalPrice;
								$("tbody tr").eq(i).append("<td>"+list.ssShare+"%</td>");
							}
							
						}
						$("tbody").append("<tr id='total'>");
						$("tbody tr").eq(i).append("<td></td>");
						$("tbody tr").eq(i).append("<td></td>");
						$("tbody tr").eq(i).append("<td>"+totalCount.toLocaleString()+"개</td>");
						$("tbody tr").eq(i).append("<td>"+totalPrice.toLocaleString()+"원</td>");
						$("tbody tr").eq(i).append("<td>100.0%</td>");
					}
					
				})
				
			
		})
		
		
		//년도,월별
		 var now = new Date();
	       var nyear = now.getFullYear();
	       var nmon = (now.getMonth()+1) > 9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);            
	       
	       //년도 selectbox만들기               
	       $("#fd_year").append("<option value='100'>년도를 선택해주세요</option>");
	       
	       for(var sy = 2002 ; sy <= nyear ; sy++) {
	           $('#fd_year').append('<option value="'+sy+'">' + sy + '년</option>');    
	       }

	       // 월별 selectbox 만들기            
	        $("#fd_month").append("<option value='100'>월을 선택해주세요</option>");
	       for(var i=1; i <= 12; i++) {
	           var sm = i > 9 ? i : "0"+i ;            
	           $('#fd_month').append('<option value="'+sm+'">' + sm + '월</option>');    
	        }            
	       
	       $("#fd_year  > option[value='100'").attr("selected", "true");    
	       $("#fd_month  > option[value='100'").attr("selected", "true");  
		
	       $("#search").click(function() { //조회 버튼 클릭시
	    	   $("#datepicker").val("");
	       		var y =$("#fd_year").val();
	       		var m =$("#fd_month").val();
	       		if(y==100){
	       			alert("년도를 선택해주세요.")
	       		}else if(y!=100 && m==100){ //년도별 검색,월x
	       		 $.ajax({
						url:"${pageContext.request.contextPath }/mgn/salesList.do",
						type:"get",
						data : {"date":y},
						dataType:"json",
						success:function(json){
							console.log(json);
							
							$("tbody").empty();
							if(json.list.length==0){
	    						alert("조회조건에 맞는 내역이 없습니다.");
	    						return false;
	    					}
							var totalCount=0;
							var totalPrice=0;
							
							for(var i=0; i<json.list.length; i++){
								var list=json.list[i];
								if(i%2==0){
									$("tbody").append("<tr  role='row' class='odd'>");
									$("tbody tr").eq(i).append("<td class='sorting_1'>"+(i+1)+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssName+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssCount+"개</td>");
									totalCount += list.ssCount;
									$("tbody tr").eq(i).append("<td>"+list.ssTotalPrice.toLocaleString()+"원</td>");
									totalPrice += list.ssTotalPrice;
									$("tbody tr").eq(i).append("<td>"+list.ssShare+"%</td>");
								}else{
									$("tbody").append("<tr  role='row' class='even'>");
									$("tbody tr").eq(i).append("<td class='sorting_1'>"+(i+1)+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssName+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssCount+"개</td>")
									totalCount += list.ssCount;;
									$("tbody tr").eq(i).append("<td>"+list.ssTotalPrice.toLocaleString()+"원</td>");
									totalPrice += list.ssTotalPrice;
									$("tbody tr").eq(i).append("<td>"+list.ssShare+"%</td>");
								}
								
							}
							$("tbody").append("<tr id='total'>");
							$("tbody tr").eq(i).append("<td></td>");
							$("tbody tr").eq(i).append("<td></td>");
							$("tbody tr").eq(i).append("<td>"+totalCount.toLocaleString()+"개</td>");
							$("tbody tr").eq(i).append("<td>"+totalPrice.toLocaleString()+"원</td>");
							$("tbody tr").eq(i).append("<td>100.0%</td>");
						}
						
					})      			
	       		}else if(y!=100 && m!=100){ //년도,월 같이
	       			var ym = y+"-"+m;
	       		 $.ajax({
						url:"${pageContext.request.contextPath }/mgn/salesList.do",
						type:"get",
						data : {"date":ym},
						dataType:"json",
						success:function(json){
							console.log(json);
							
							$("tbody").empty();
							if(json.list.length==0){
	    						alert("조회조건에 맞는 내역이 없습니다.");
	    						return false;
	    					}
							var totalCount=0;
							var totalPrice=0;
							
							for(var i=0; i<json.list.length; i++){
								var list=json.list[i];
								if(i%2==0){
									$("tbody").append("<tr  role='row' class='odd'>");
									$("tbody tr").eq(i).append("<td class='sorting_1'>"+(i+1)+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssName+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssCount+"개</td>");
									totalCount += list.ssCount;
									$("tbody tr").eq(i).append("<td>"+list.ssTotalPrice.toLocaleString()+"원</td>");
									totalPrice += list.ssTotalPrice;
									$("tbody tr").eq(i).append("<td>"+list.ssShare+"%</td>");
								}else{
									$("tbody").append("<tr  role='row' class='even'>");
									$("tbody tr").eq(i).append("<td class='sorting_1'>"+(i+1)+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssName+"</td>");
									$("tbody tr").eq(i).append("<td>"+list.ssCount+"개</td>")
									totalCount += list.ssCount;;
									$("tbody tr").eq(i).append("<td>"+list.ssTotalPrice.toLocaleString()+"원</td>");
									totalPrice += list.ssTotalPrice;
									$("tbody tr").eq(i).append("<td>"+list.ssShare+"%</td>");
								}
								
							}
							$("tbody").append("<tr id='total'>");
							$("tbody tr").eq(i).append("<td></td>");
							$("tbody tr").eq(i).append("<td></td>");
							$("tbody tr").eq(i).append("<td>"+totalCount.toLocaleString()+"개</td>");
							$("tbody tr").eq(i).append("<td>"+totalPrice.toLocaleString()+"원</td>");
							$("tbody tr").eq(i).append("<td>100.0%</td>");
						}
						
					})
	       		}
	       })
	})
</script>
<div class="s_visu1">
		
		</div>
	<h2>판매 현황</h2>
	<div id="wrap">
	
		<div id="sub">
			<p id="selDate">
				<label>날짜 선택: </label><input type="text" id="datepicker">
				<select id="fd_year" name="fd_year" style="width:130px;"></select>    
          		 <select id="fd_month" name="fd_month" style="width:130px;"></select> 
          		 <button id="search">조회</button>   
				<button id="all">전체보기</button>
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
				<c:set var="sum1"></c:set>
				<c:set var="sum2"></c:set>
				<c:set var="num" value="0"></c:set>
				<c:forEach var="item" items="${list}">
					<c:set var="num" value="${num+1 }"></c:set>
					
					<tr>
						<td>${num}</td>
						<td>${item.ssName }</td>
						<td>${item.ssCount }개</td>
						<td><fmt:formatNumber value="${item.ssTotalPrice }" />원</td>
						<td>${item.ssShare }%</td>
						<c:set var="sum1" value="${sum1+item.ssCount }"></c:set>
						<c:set var="sum2" value="${sum2+item.ssTotalPrice }"></c:set>
					</tr>
				</c:forEach>
				<tr>
					<td></td>
					<td></td>
					<td>${sum1 }개</td>
					<td><fmt:formatNumber value="${sum2 }" />원</td>
					<td>100.0%</td>
				</tr>
			</tbody> 
		</table>
		
	</div>
<%@ include file="../../view/include/footer.jsp" %>