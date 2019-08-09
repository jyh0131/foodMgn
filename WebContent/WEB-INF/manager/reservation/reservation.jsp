<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ include file="../../view/include/header_mgn.jsp" %>

<style>
	#wrap {
		min-height: 700px;
		width: 1300px;
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
	
	#f2 {
		float: right;
		padding: 10px;
	}
	#btns {
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
</style>

<script>
	$(function() {
		$("#selectList").datepicker({
			minDate: null
		});
		
		$("#btnDate").click(function(){
			if($("input[name='date']").val() == "") {
				alert("검색할 날짜를 입력하세요.");
	            return false;
	        }
			
			$.ajax({
				url:"${pageContext.request.contextPath}/mgn/reservationMgn.do",
				type:"post",
				data:{"date":$("input[name='date']").val(), "kind":"date"},
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
						var $td4 = $("<td>");
						var $td5 = $("<td>");
						var $td6 = $("<td>");
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
						$td5.html(res[i].rsvNumber+"명");
						$td6.html(res[i].rsvTableNo.substring(3)+"번 테이블");
						
						
						$tr.append($td1).append($td2).append($td3).append($td4).append($td5).append($td6);
						$("#rsvTable").append($tr);
					}
				}
				
			})
			$("input[name='date']").val("");
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
						var $td4 = $("<td>");
						var $td5 = $("<td>");
						var $td6 = $("<td>");
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
						$td5.html(res[i].rsvNumber+"명");
						$td6.html(res[i].rsvTableNo.substring(3)+"번 테이블");
						
						$tr.append($td1).append($td2).append($td3).append($td4).append($td5).append($td6);
						$("#rsvTable").append($tr);
					}
				}
				
			})
			$("input[name='tel']").val("");
		})	
		
	})
</script>

	<div id="wrap">
		<div id="div"></div>
		<h1>예약현황 조회</h1>
		<div id="rsvList">
			<div id="btns">
				<input type="text" name="date" id="selectList" autocomplete="off"> <button id="btnDate">날짜로검색</button>
			</div>
			<div id="f2">
				<input type="text" name="tel" size="30" placeholder="검색할 전화번호">
				<button id="btnTel">전화번호로 검색</button>
			</div>
			<table id="rsvTable">
				<tr>
					<th>회원번호</th>
					<th>회원명</th>
					<th>전화번호</th>
					<th>예약시간</th>
					<th>인원</th>
					<th>테이블</th>
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
							<td><fmt:formatDate value="${mlist.rsvTime}" pattern="yyyy년MM월dd일 kk시:mm분"/></td>
							<td>${mlist.rsvNumber}명</td>
							<td>${fn:substringAfter(mlist.rsvTableNo,'.')}번 테이블</td>
						</tr>
				</c:forEach>
			</table>
		</div>
	</div>

<%@ include file="../../view/include/footer.jsp" %>






