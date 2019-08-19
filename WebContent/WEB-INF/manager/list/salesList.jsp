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
	width: 1000px;
	margin:0 auto;
	height:40px;
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
					url:"${pageContext.request.contextPath }/mgn/salesList.do",
					type:"get",
					data:{"date":$("input[name='date']").val(), "date2":$("input[name='date2']").val(), "kind":"date"},
					dataType:"json",
					success:function(json){
						console.log(json);
					
						$("tbody").empty();
						if(json.list.length==0){
 						alert("조회조건에 맞는 내역이 없습니다.");
 						$("#total1").text( 0);
					     $("#total2").text( 0);
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
						
						$("#total1").text( totalCount.toLocaleString());
					     $("#total2").text( totalPrice.toLocaleString());
					}
					
				})
			
			
			
		})
		
		$(document).on("click","#btnToday",function(){
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
				url:"${pageContext.request.contextPath }/mgn/salesList.do",
				type:"get",
				data:{"date":today, "date2":today, "kind":"date"},
				dataType:"json",
				success:function(json){
					console.log(json);
				
					$("tbody").empty();
					if(json.list.length==0){
						alert("조회조건에 맞는 내역이 없습니다.");
						$("#total1").text( 0);
					     $("#total2").text( 0);
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
					
					$("#total1").text( totalCount.toLocaleString());
				     $("#total2").text( totalPrice.toLocaleString());
				}
				
			})
		})
		
		
		
		
		
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
	    						$("#total1").text( 0);
	   					     $("#total2").text( 0);
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
							
							$("#total1").text( totalCount.toLocaleString());
						     $("#total2").text( totalPrice.toLocaleString());
						}
						
					})
		     }
			 
		});
		
		$("#all").click(function() {
			$("input[name='date']").val("");
			$("input[name='date2']").val(""); 
			  $.ajax({
					url:"${pageContext.request.contextPath }/mgn/salesListAll.do",
					type:"get",
					dataType:"json",
					success:function(json){
						console.log(json);
					
						$("tbody").empty();
						if(json.list.length==0){
    						alert("조회조건에 맞는 내역이 없습니다.");
    						$("#total1").text( 0);
   					     $("#total2").text( 0);
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
						$("#total1").text( totalCount.toLocaleString());
					     $("#total2").text( totalPrice.toLocaleString());
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
	    						$("#total1").text( 0);
	   					     $("#total2").text( 0);
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
							$("#total1").text( totalCount.toLocaleString());
						     $("#total2").text( totalPrice.toLocaleString());
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
	    						$("#total1").text( 0);
	   					     $("#total2").text( 0);
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
							$("#total1").text( totalCount.toLocaleString());
						     $("#total2").text( totalPrice.toLocaleString());
							
							
						}
						
					})
	       		}
	       })
	       
	     $("#total1").text( $("#totals").val());
	     $("#total2").text( Number($("#totalp").val()).toLocaleString());
	})
</script>
<div class="s_visu1">
	<c:set var="sum1"></c:set>
	<c:set var="sum2"></c:set>
	<c:set var="num" value="0"></c:set>	
		</div>
	<h2>음식 판매 현황</h2>
	<div id="sub">
			<p id="selDate">
				<input type="text" name="date" class="selectList" autocomplete="off"> ~ <input type="text" name="date2" class="selectList" autocomplete="off"> <button id="btnDate">날짜로검색</button>
				<button id="all">전체보기</button>
				<button id="btnToday">오늘날짜 보기</button>
				 판매수량 : <span id="total1"></span>개     판매금액 : <span id="total2"></span>원
			</p>  
			
		</div>
	<div id="wrap">
	
		
		
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
				<input type="hidden" value="${sum1 }" id="totals">
				<input type="hidden" value="${sum2 }" id="totalp">
				
				
			</tbody> 
		</table>
	</div>
<%@ include file="../../view/include/footer.jsp" %>