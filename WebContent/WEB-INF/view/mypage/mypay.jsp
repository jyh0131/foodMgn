<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ include file="../include/mypage.jsp" %>
<style>


#wrap {
	min-height: 700px;
	height: 700px;
	width: 1300px;
	margin: 0 auto;
	overflow: auto;
	border: 1px solid #555;
	margin-bottom: 40px;
	float: left;
}

#sub {
	width: 80%;
	height: 40px;
	padding-left: 15px;
	margin-bottom: 10px;
}

#sub #selDate {
	padding-top: 20px;
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
		$("#all").click(function() {
			$("#datepicker").val("");
			$.ajax({
				url:"${pageContext.request.contextPath }/my/mypageSaleList.do",
				type:"post",
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
							
							
						}
						
						
					}
				}
			}) 
		})
		
		
		
		
		
		
		
		
		$("#datepicker").datepicker({
			dateFormat : 'yy-mm-dd',
			  onSelect: function(dateText, inst) {
		          var date = $(this).val();
			$.ajax({
				url:"${pageContext.request.contextPath }/my/mypageSaleList.do",
				type:"post",
				data : {"date":date},
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
							
						
							
						}
						
						
					}
				}
			}) 
			  }
		})
		
		
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
	       		var y =$("#fd_year").val();
	       		var m =$("#fd_month").val();
	       		if(y==100){
	       			alert("년도를 선택해주세요.")
	       		}else if(y!=100 && m==100){ //년도별 검색,월x
	       			$.ajax({
	    				url:"${pageContext.request.contextPath }/my/mypageSaleList.do",
	    				type:"post",
	    				data : {"date":y},
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
	    							
	    							
	    						}
	    						
	    						
	    					}
	    				}
	    			})       			
	       		}else if(y!=100 && m!=100){ //년도,월 같이
	       			var ym = y+"-"+m;
	       			$.ajax({
	    				url:"${pageContext.request.contextPath }/my/mypageSaleList.do",
	    				type:"post",
	    				data : {"date":ym},
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
	    							
	    							
	    						}
	    						
	    						
	    					}
	    				}
	    			})
	       		}
	       })
		
					
		
	})
</script>



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
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<c:if test="${item.payCancel==0 }">
					<tr class="aa">
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
					</tr>
				</c:if>

			</c:forEach>
		</tbody>
	</table>
</div>
</div>
<%@ include file="../include/footer.jsp" %>