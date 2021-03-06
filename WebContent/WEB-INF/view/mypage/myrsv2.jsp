<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ include file="../include/mypage.jsp" %>
<style>
	#searchRsv2{
		
	}
	#searchRsv2 a{
		color: yellow !important;
	}
	#rsvContainer{
		width:1100px;
		float:left;
	}
	#rsvList {
		width:1100px;
		height:600px;
		overflow: auto;
		width: 100%;
		border: 1px solid #555;
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
			url:"${pageContext.request.contextPath}/my/searchMyRsv.do",
			type:"post",
			data:{"date":$("input[name='date']").val()},
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
					$td4.attr("data-rsv",res[i].rsvNo);
					$td5.html(res[i].rsvNumber+"명");
					$td6.html(res[i].rsvTableNo.substring(3)+"번 테이블");
					$tr.append($td1).append($td2).append($td3).append($td4).append($td5).append($td6).append("<td><button class='deleteRsv'>예약취소</button></td>");
					$("#rsvTable").append($tr);
			}
				
		 		}
			})
		$("input[name='date']").val("");
	})
	
	$(document).on("click", ".deleteRsv", function(){
		
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
		}else if((nDate3.getTime()-rsvDate.getTime())==0){
			alert("당일 예약은 취소할 수 없습니다. 전화로 문의해주세요.");
			return;
		}else{
			var a = confirm("예약을 취소하시겠습니까?");
			if(a==true){
				var rsvNo = $(this).parent().parent().find(".date").attr("data-rsv");
				$.ajax({
					url:"${pageContext.request.contextPath}/my/deleteRsv.do",
					type:"get",
					data:{"rsvNo":rsvNo},
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
							$td4.attr("data-rsv",res[i].rsvNo);
							$td5.html(res[i].rsvNumber+"명");
							$td6.html(res[i].rsvTableNo.substring(3)+"번 테이블");
							$tr.append($td1).append($td2).append($td3).append($td4).append($td5).append($td6).append("<td><button class='delteRsv'>예약취소</button></td>");
							$("#rsvTable").append($tr);
					}
					}
					
				})
			}else{
				return;
			}
			
		}
	})
	
	
})  
</script>
<div id="rsvContainer">
	<div id="rsvList">
			<div id="btns">
				<input type="text" name="date" id="selectList" autocomplete="off"> <button id="btnDate">날짜로검색</button>
			</div>
			<table id="rsvTable">
				<tr>
					<th>회원번호</th>
					<th>회원명</th>
					<th>전화번호</th>
					<th>예약시간</th>
					<th>인원</th>
					<th>테이블</th>
					<th></th>
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
							<td>${mlist.rsvNumber}명</td>
							<td>${fn:substringAfter(mlist.rsvTableNo,'.')}번 테이블</td>
							<td><button class="deleteRsv">예약취소</button></td>
						</tr>
				</c:forEach>
			</table>
		</div>
</div>
</div>
<%@ include file="../include/footer.jsp" %>