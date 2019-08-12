<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ include file="../../view/include/header_mgn.jsp" %>

<style>
	#wrap {
		min-height: 700px;
		width: 1400px;
		margin: 0 auto;
	}
	#div {
		height: 140px;
	}
	#rsvList {
		height: 600px;
		overflow: auto;
		width: 100%;
		border: 1px solid #555;
		margin: 30px 0;
	}
	
	button, input[type="submit"] {
		padding: 3px 5px;
		background-color: #c7a593;
		border: 1px solid #c7a593;
		color: white;
		border-radius: 3px;
		outline: none;
	}
	form {
		padding: 10px;
	}
	input[type="text"] {
		padding: 3px;
	}
	
	#btns, #f2, #f3, #f4 {
		float: left;
		padding: 10px;
	}
	
	 
	
	#rsvTable {
		border-collapse: collapse;
		text-align: center;
		width: 100%;
		clear: both;
	}
	#rsvTable th, #rsvTable td {
		border-top: 1px solid #ccc;
		border-right: 1px solid #ccc;
		padding: 5px 5px;
	}
	#rsvTable td:last-child, #rsvTable th:last-child {
		border-right: none;
	}
	#rsvTable tr:nth-child(2n) {
		background-color: #F7F7F7;
	}
	#rsvTable tr:last-child {
		border-bottom: 1px solid #ccc;
	}
	#rsvTable th {
		padding: 10px 10px;
	}
	h1{
		text-align: center;
		margin-top:30px;
	}
	.cancel{
		text-decoration: line-through;
		color:red;
	}
	#rsvTable tr td:last-child {
		text-decoration: none !important;
	}
	.date input{
		width:30px;	
	}
	.number input{
		width:20px;
	}
	.tableNo input{
		width:20px;
	}
</style>

<script>
	$(function() {
		$(".selectList").datepicker({
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
				url:"${pageContext.request.contextPath}/mgn/reservationMgn.do",
				type:"post",
				data:{"date":$("input[name='date']").val(), "date2":$("input[name='date2']").val(), "kind":"date"},
				dataType:"json",
				success: function(res){
					console.log(res);
					$(".rsvTr").remove();
					for(var i=0; i<res.length; i++){
						var date = new Date(res[i].rsvTime);
						var dateFormat = date.getFullYear()+"년"+("00"+(date.getMonth()+1)).slice(-2)+"월"+("00"+date.getDate()).slice(-2)+"일"+("00"+date.getHours()).slice(-2)+"시:"+("00"+date.getMinutes()).slice(-2)+"분";
						
						var $tr = $("<tr class='rsvTr'>");
						var $td1 = $("<td>");
						var $td2 = $("<td>");
						var $td3 = $("<td>");
						var $td4 = $("<td class='date'>");
						var $td5 = $("<td class='number'>");
						var $td6 = $("<td class='tableNo'>");
						if(res[i].rsvCancel==true){
							$tr.addClass("cancel");
						}
						var number = "";
						if(res[i].mbNo.mbBirth==null){
							number = "N"+res[i].mbNo.mbNo;
						}else{
							number = "M"+res[i].mbNo.mbNo;
						}
						$td1.html(number);
						$td2.html(res[i].mbNo.mbName);
						$td3.html(res[i].mbNo.mbTel.substring(0, 3)+"-"+res[i].mbNo.mbTel.substring(3, 7)+"-"+res[i].mbNo.mbTel.substring(7, 11));
						$td4.html(dateFormat);
						$td4.attr("data-rsv",res[i].rsvNo);
						$td5.html(res[i].rsvNumber+"명");
						$td6.html(res[i].rsvTableNo.substring(3)+"번 테이블");
						var $td7 = $("<td>");
						$td7.html('<button class="update">예약수정</button> <button class="rsvCancel">예약취소</button>');
						$tr.append($td1).append($td2).append($td3).append($td4).append($td5).append($td6).append($td7);
						$("#rsvTable").append($tr);
					}
				}
				
			})
			$("input[name='date']").val("");
			$("input[name='date2']").val("");
		})
		
		$("#btnTel").click(function(){
			if($("input[name='tel']").val() == "") {
				alert("검색할 전화번호를 입력하세요.");
	            return false;
	        }
			
			$.ajax({
				url:"${pageContext.request.contextPath}/mgn/reservationMgn.do",
				type:"post",
				data:{"tel":$("input[name='tel']").val(), "kind":"tel"},
				dataType:"json",
				success: function(res){
					console.log(res);
					$(".rsvTr").remove();
					for(var i=0; i<res.length; i++){
						var date = new Date(res[i].rsvTime);
						var dateFormat = date.getFullYear()+"년"+("00"+(date.getMonth()+1)).slice(-2)+"월"+("00"+date.getDate()).slice(-2)+"일"+("00"+date.getHours()).slice(-2)+"시:"+("00"+date.getMinutes()).slice(-2)+"분";
						
						var $tr = $("<tr class='rsvTr'>");
						var $td1 = $("<td>");
						var $td2 = $("<td>");
						var $td3 = $("<td>");
						var $td4 = $("<td class='date'>");
						var $td5 = $("<td class='number'>");
						var $td6 = $("<td class='tableNo'>");
						if(res[i].rsvCancel==true){
							$tr.addClass("cancel");
						}
						var number = "";
						if(res[i].mbNo.mbBirth==null){
							number = "N"+res[i].mbNo.mbNo;
						}else{
							number = "M"+res[i].mbNo.mbNo;
						}
						$td1.html(number);
						$td2.html(res[i].mbNo.mbName);
						$td3.html(res[i].mbNo.mbTel.substring(0, 3)+"-"+res[i].mbNo.mbTel.substring(3, 7)+"-"+res[i].mbNo.mbTel.substring(7, 11));
						$td4.html(dateFormat);
						$td4.attr("data-rsv",res[i].rsvNo);
						$td5.html(res[i].rsvNumber+"명");
						$td6.html(res[i].rsvTableNo.substring(3)+"번 테이블");
						var $td7 = $("<td>");
						$td7.html('<button class="update">예약수정</button> <button class="rsvCancel">예약취소</button>');
						$tr.append($td1).append($td2).append($td3).append($td4).append($td5).append($td6).append($td7);
						$("#rsvTable").append($tr);
					}
				}
				
			})
			$("input[name='tel']").val("");
		})	
		
		$("#btnToday").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/mgn/reservationMgn.do",
				type:"post",
				data:{"kind":"today"},
				dataType:"json",
				success: function(res){
					console.log(res);
					$(".rsvTr").remove();
					for(var i=0; i<res.length; i++){
						var date = new Date(res[i].rsvTime);
						var dateFormat = date.getFullYear()+"년"+("00"+(date.getMonth()+1)).slice(-2)+"월"+("00"+date.getDate()).slice(-2)+"일"+("00"+date.getHours()).slice(-2)+"시:"+("00"+date.getMinutes()).slice(-2)+"분";
						
						var $tr = $("<tr class='rsvTr'>");
						var $td1 = $("<td>");
						var $td2 = $("<td>");
						var $td3 = $("<td>");
						var $td4 = $("<td class='date'>");
						var $td5 = $("<td class='number'>");
						var $td6 = $("<td class='tableNo'>");
						if(res[i].rsvCancel==true){
							$tr.addClass("cancel");
						}
						var number = "";
						if(res[i].mbNo.mbBirth==null){
							number = "N"+res[i].mbNo.mbNo;
						}else{
							number = "M"+res[i].mbNo.mbNo;
						}
						$td1.html(number);
						$td2.html(res[i].mbNo.mbName);
						$td3.html(res[i].mbNo.mbTel.substring(0, 3)+"-"+res[i].mbNo.mbTel.substring(3, 7)+"-"+res[i].mbNo.mbTel.substring(7, 11));
						$td4.html(dateFormat);
						$td4.attr("data-rsv",res[i].rsvNo);
						$td5.html(res[i].rsvNumber+"명");
						$td6.html(res[i].rsvTableNo.substring(3)+"번 테이블");
						var $td7 = $("<td>");
						$td7.html('<button class="update">예약수정</button> <button class="rsvCancel">예약취소</button>');
						$tr.append($td1).append($td2).append($td3).append($td4).append($td5).append($td6).append($td7);
						$("#rsvTable").append($tr);
					}
				}
				
			})
		})
		
		$("#btnAll").click(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/mgn/reservationMgn.do",
				type:"post",
				data:{"kind":"all"},
				dataType:"json",
				success: function(res){
					console.log(res);
					$(".rsvTr").remove();
					for(var i=0; i<res.length; i++){
						var date = new Date(res[i].rsvTime);
						var dateFormat = date.getFullYear()+"년"+("00"+(date.getMonth()+1)).slice(-2)+"월"+("00"+date.getDate()).slice(-2)+"일"+("00"+date.getHours()).slice(-2)+"시:"+("00"+date.getMinutes()).slice(-2)+"분";
						
						var $tr = $("<tr class='rsvTr'>");
						var $td1 = $("<td>");
						var $td2 = $("<td>");
						var $td3 = $("<td>");
						var $td4 = $("<td class='date'>");
						var $td5 = $("<td class='number'>");
						var $td6 = $("<td class='tableNo'>");
						if(res[i].rsvCancel==true){
							$tr.addClass("cancel");
						}
						var number = "";
						if(res[i].mbNo.mbBirth==null){
							number = "N"+res[i].mbNo.mbNo;
						}else{
							number = "M"+res[i].mbNo.mbNo;
						}
						$td1.html(number);
						$td2.html(res[i].mbNo.mbName);
						$td3.html(res[i].mbNo.mbTel.substring(0, 3)+"-"+res[i].mbNo.mbTel.substring(3, 7)+"-"+res[i].mbNo.mbTel.substring(7, 11));
						$td4.html(dateFormat);
						$td4.attr("data-rsv",res[i].rsvNo);
						$td5.html(res[i].rsvNumber+"명");
						$td6.html(res[i].rsvTableNo.substring(3)+"번 테이블");
						var $td7 = $("<td>");
						$td7.html('<button class="update">예약수정</button> <button class="rsvCancel">예약취소</button>');
						$tr.append($td1).append($td2).append($td3).append($td4).append($td5).append($td6).append($td7);
						$("#rsvTable").append($tr);
					}
				}
				
			})
		})
		
		
		$(document).on("click", ".rsvCancel", function(){
		
		var cancel = $(this).parent().parent().hasClass("cancel");
		if(cancel==true){
			alert("이미 취소된 예약입니다.");
			return;
		}
		
		var nDate = new Date();
		var nDate2 = nDate.getFullYear()+"/"+(nDate.getMonth()+1)+"/"+nDate.getDate();
		var nDate3 = new Date(nDate2); //오늘 년월일만 뽑음
		var date = $(this).parent().parent().find(".date").html();
		var cDate = date.substring(0, 4)+"/"+date.substring(5, 7)+"/"+date.substring(8, 10);//예약정보의 년월일 만 뽑음.
		var rsvDate = new Date(cDate); 
		if( (nDate3.getTime()-rsvDate.getTime())>0){
			alert("지난 예약은 취소할 수 없습니다.");
			return;
		}else{
			var a = confirm("예약을 취소하시겠습니까?");
			if(a==true){
				var rsvNo = $(this).parent().parent().find(".date").attr("data-rsv");
				$.ajax({
					url:"${pageContext.request.contextPath}/mgn/reservationMgn.do",
					type:"post",
					data:{"rsvNo":rsvNo,"kind":"cancel"},
					dataType:"json",
					success: function(res){
						console.log(res);
						alert("예약을 취소하였습니다.");
						$(".rsvTr").remove();
						for(var i=0; i<res.length; i++){
							var date = new Date(res[i].rsvTime);
							var dateFormat = date.getFullYear()+"년"+("00"+(date.getMonth()+1)).slice(-2)+"월"+("00"+date.getDate()).slice(-2)+"일"+("00"+date.getHours()).slice(-2)+"시:"+("00"+date.getMinutes()).slice(-2)+"분";
							
							var $tr = $("<tr class='rsvTr'>");
							var $td1 = $("<td>");
							var $td2 = $("<td>");
							var $td3 = $("<td>");
							var $td4 = $("<td class='date'>");
							var $td5 = $("<td class='number'>");
							var $td6 = $("<td class='tableNo'>");
							if(res[i].rsvCancel==true){
								$tr.addClass("cancel");
							}
							var number = "";
							if(res[i].mbNo.mbBirth==null){
								number = "N"+res[i].mbNo.mbNo;
							}else{
								number = "M"+res[i].mbNo.mbNo;
							}
							$td1.html(number);
							$td2.html(res[i].mbNo.mbName);
							$td3.html(res[i].mbNo.mbTel.substring(0, 3)+"-"+res[i].mbNo.mbTel.substring(3, 7)+"-"+res[i].mbNo.mbTel.substring(7, 11));
							$td4.html(dateFormat);
							$td4.attr("data-rsv",res[i].rsvNo);
							$td5.html(res[i].rsvNumber+"명");
							$td6.html(res[i].rsvTableNo.substring(3)+"번 테이블");
							var $td7 = $("<td>");
							$td7.html('<button class="update">예약수정</button> <button class="rsvCancel">예약취소</button>');
							$tr.append($td1).append($td2).append($td3).append($td4).append($td5).append($td6).append($td7);
							$("#rsvTable").append($tr);
					}
					}
					
				})
			}else{
				return;
			}
			
		}
	})
		
		
	$(document).on("click", ".update", function(){
		var nDate = new Date();
		if($(this).html()=="예약수정"){
			var cancel = $(this).parent().parent().hasClass("cancel");
			if(cancel==true){
				alert("취소된 예약은 수정할 수 없습니다.");
				return;
			}
			
			var date = $(this).parent().parent().find(".date").html();
			var cDate = date.substring(0, 4)+"-"+date.substring(5, 7)+"-"+date.substring(8, 10)+" "+date.substring(11, 13)+":"+date.substring(15, 17);
			var preNumber = $(this).parent().parent().find(".number").html().substring(0, 1);
			var preTable = $(this).parent().parent().find(".tableNo").html().substring(0, 1);
			var rsvDate = new Date(cDate); 
			
			if( (nDate.getTime()-rsvDate.getTime())>0){
				alert("지난 예약은 수정할 수 없습니다.");
				return;
			}else{
				var a = confirm("예약을 수정하시겠습니까?");
				if(a==true){
					$(this).parent().parent().find(".date").html("<input type='text' class='year' value='"+ date.substring(0, 4)+"'>년<input type='text' class='month' value='"+ date.substring(5, 7)+"'>월<input type='text' class='day' value='"+ date.substring(8, 10)+"'>일<input type='text' class='hour' value='"+ date.substring(11, 13)+"'>시<input type='text' class='minute' value='"+ date.substring(15, 17)+"'>분");
					$(this).parent().parent().find(".number").html("<input type='text' class='preN' value='"+preNumber+"'>명");
					$(this).parent().parent().find(".tableNo").html("<input type='text' class='preT' value='"+preTable+"'>번 테이블");
					$(this).html("수정하기");
					
				}else{
					return;
				}
				
			}
		}else{
			var rsvNo = $(this).parent().parent().find(".date").attr("data-rsv");
			var year = $(this).parent().parent().find(".date").find(".year").val();
		
			var month = ("00"+$(this).parent().parent().find(".date").find(".month").val()).slice(-2);	
			var day = ("00"+$(this).parent().parent().find(".date").find(".day").val()).slice(-2);
			var hour = ("00"+$(this).parent().parent().find(".date").find(".hour").val()).slice(-2);
			var minute = ("00"+$(this).parent().parent().find(".date").find(".minute").val()).slice(-2);
			
			var fullDate = year+"-"+month+"-"+day+" "+hour+":"+minute;
			var atNumber = $(this).parent().parent().find(".number").find(".preN").val();
			var atTable = $(this).parent().parent().find(".tableNo").find(".preT").val();
			var fDate = new Date(fullDate);
			
			var a = confirm("변경된 정보로 수정하시겠습니까?");
			if(a==true){
				if((nDate.getTime()-fDate.getTime())>0 ){
					alert("이전의 시간으로 예약할 수 없습니다.");
					return;
				}else{
					$.ajax({
						url:"${pageContext.request.contextPath}/mgn/reservationMgn.do",
						type:"post",
						data:{"rsvNo":rsvNo,"kind":"update", "date":fullDate, "atNumber":atNumber, "atTable":atTable },
						dataType:"json",
						success: function(res){
							console.log(res);
							if(res==0){
								alert("해당시간에 예약이 있는 자리입니다.");
								return;
							}else{
								alert("예약을 수정하였습니다.");
								$(this).html("예약수정");
								$(".rsvTr").remove();
								for(var i=0; i<res.length; i++){
									var date = new Date(res[i].rsvTime);
									var dateFormat = date.getFullYear()+"년"+("00"+(date.getMonth()+1)).slice(-2)+"월"+("00"+date.getDate()).slice(-2)+"일"+("00"+date.getHours()).slice(-2)+"시:"+("00"+date.getMinutes()).slice(-2)+"분";
									
									var $tr = $("<tr class='rsvTr'>");
									var $td1 = $("<td>");
									var $td2 = $("<td>");
									var $td3 = $("<td>");
									var $td4 = $("<td class='date'>");
									var $td5 = $("<td class='number'>");
									var $td6 = $("<td class='tableNo'>");
									if(res[i].rsvCancel==true){
										$tr.addClass("cancel");
									}
									var number = "";
									if(res[i].mbNo.mbBirth==null){
										number = "N"+res[i].mbNo.mbNo;
									}else{
										number = "M"+res[i].mbNo.mbNo;
									}
									$td1.html(number);
									$td2.html(res[i].mbNo.mbName);
									$td3.html(res[i].mbNo.mbTel.substring(0, 3)+"-"+res[i].mbNo.mbTel.substring(3, 7)+"-"+res[i].mbNo.mbTel.substring(7, 11));
									$td4.html(dateFormat);
									$td4.attr("data-rsv",res[i].rsvNo);
									$td5.html(res[i].rsvNumber+"명");
									$td6.html(res[i].rsvTableNo.substring(3)+"번 테이블");
									var $td7 = $("<td>");
									$td7.html('<button class="update">예약수정</button> <button class="rsvCancel">예약취소</button>');
									$tr.append($td1).append($td2).append($td3).append($td4).append($td5).append($td6).append($td7);
									$("#rsvTable").append($tr);
							}
							}
							
						}
					})
				}
		
		}else{
			return;
		}	
		
		}			
				
	})
		
	})
</script>

	<div id="wrap">
		<div id="div"></div>
		<h1>예약현황 조회</h1>
		<div id="rsvList">
			<div id="btns">
				<input type="text" name="date" class="selectList" autocomplete="off"> ~ <input type="text" name="date2" class="selectList" autocomplete="off"> <button id="btnDate">날짜로검색</button>
			</div>
			<div id="f2">
				<input type="text" name="tel" size="30" placeholder="검색할 전화번호">
				<button id="btnTel">전화번호로 검색</button>
			</div>
			<div id="f4">
				<button id="btnToday">오늘남은예약</button>
			</div>
			<div id="f3">
				<button id="btnAll">전체검색</button>
			</div>
			<table id="rsvTable">
				<tr>
					<th width="159px">회원번호</th>
					<th width="130px">회원명</th>
					<th width="208px">전화번호</th>
					<th width="349px">예약시간</th>
					<th width="100px">인원</th>
					<th width="160px">테이블</th>
					<th width="273px"></th>
				</tr>
				<c:forEach var="mlist" items="${list}">
					<c:if test="${mlist.rsvCancel==true }">
						<tr class="rsvTr cancel">
					</c:if>
					<c:if test="${mlist.rsvCancel==false }">
						<tr class="rsvTr">
					</c:if>
						<c:if test="${mlist.mbNo.mbBirth==null }">
							<td>N${mlist.mbNo.mbNo}</td>
						</c:if>
						<c:if test="${mlist.mbNo.mbBirth!=null }">
							<td>M${mlist.mbNo.mbNo}</td>
						</c:if>
							<td>${mlist.mbNo.mbName}</td>
							<td>${fn:substring(mlist.mbNo.mbTel,0,3)}-${fn:substring(mlist.mbNo.mbTel,3,7)}-${fn:substring(mlist.mbNo.mbTel,7,11)}</td>
							<td class="date" data-rsv=${mlist.rsvNo }><fmt:formatDate value="${mlist.rsvTime}" pattern="yyyy년MM월dd일 kk시:mm분"/></td>
							<td class="number">${mlist.rsvNumber}명</td>
							<td class="tableNo">${fn:substringAfter(mlist.rsvTableNo,'.')}번 테이블</td>
							<td><button class="update">예약수정</button> <button class="rsvCancel">예약취소</button></td>
						</tr>
				</c:forEach>
			</table>
		</div>
	</div>

<%@ include file="../../view/include/footer.jsp" %>






