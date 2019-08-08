<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	#memberList {
		height: 600px;
		overflow: auto;
		width: 100%;
		border: 1px solid #555;
		margin: 30px 0;
	}
	table {
		border-collapse: collapse;
		width: 100%;
		clear: both;
	}
	th, td {
		border-top: 1px solid #ccc;
		border-right: 1px solid #ccc;
		padding: 5px 5px;
	}
	td:last-child, th:last-child {
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
	#mNo, #mName, #mMileage, #mCount, #mGrade {
		width: 70px;
	}
	#mBirth, #mJoin, #mTel {
		width: 125px;
	}
	#mAddr {
		width: 240px;
	}
	td:nth-child(1), td:nth-child(2), td:nth-child(3), td:nth-child(4), td:nth-child(7), td:nth-child(8), td:nth-child(9) {
		text-align: center;
	}
	td:nth-child(6) {
		text-align: right;
	}
	button, input[type="submit"] {
		padding: 3px 5px;
		background-color: #c7a593;
		border: 1px solid #c7a593;
		color: white;
		border-radius: 3px;
		outline: none;
	}
	.underline {
		text-decoration: line-through;
		color: red;
		font-size: 0.9em;
	}
	form {
		padding: 10px;
	}
	input[type="text"] {
		padding: 3px;
	}
	#f2 {
		float: right;
		padding-right: 5px;
	}
	#btns {
		float: left;
		padding: 10px;
	}
</style>
<script>
	$(function() {
		$("#f2").submit(function() {
			if($("input[name='tel']").val() == "") {
				alert("검색할 전화번호를 입력하세요.");
	            return false;
	        }
			
			$.ajax({
				url:"${pageContext.request.contextPath}/memberMgnsearch.do",
				type:"post",
				data:{"tel":$("input[name='tel']").val()},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					$("table").empty();
					$("table").append("<tr><th>회원번호</th><th>회원명</th><th>생년월일</th><th>전화번호</th><th>주소</th><th>마일리지</th><th>등급</th><th>가입일</th><th>주문횟수</th></tr>");
					
					$(res).each(function(i, obj) {
						var birth = new Date(obj.mbBirth);
						var join = new Date(obj.mbJoin);
						
						var $tr = $("<tr>");
						var $mbno = $("<td>").text(obj.mbNo);
						var $mbname = $("<td>").text(obj.mbName);
						var $mbbirth = $("<td>").text(birth.getFullYear()+"년"+(birth.getMonth()+1)+"월"+birth.getDate()+"일");
						var $mbtel = $("<td>").text(obj.mbTel);
						var $mbaddress = $("<td>").text(obj.mbAddress);
						var $mbmileage = $("<td>").text(obj.mbMileage.toLocaleString()+"원");
						var $mbgrade = $("<td>").text(obj.mbGrade.grade);
						var $mbjoin = $("<td>").text(join.getFullYear()+"년"+(join.getMonth()+1)+"월"+join.getDate()+"일");
						var $mbcount = $("<td>").text(obj.mbCount);
						
						$tr.append($mbno).append($mbname).append($mbbirth).append($mbtel).append($mbaddress).append($mbmileage).append($mbgrade).append($mbjoin).append($mbcount);
						$("table").append($tr);
					})
				}
			})
			return false;
		})
		
		$("#allList").click(function() {
			location.href = "${pageContext.request.contextPath}/memberMgnlist.do";
		})
		
	})
</script>

	<div id="wrap">
		<div id="div"></div>
		<div id="memberList">
			<div id="btns">
				<button id="allList">전체보기</button>
			</div>
			<form action="${pageContext.request.contextPath}/memberMgnsearch.do" method="post" id="f2">
				<input type="text" name="tel" size="30" placeholder="검색할 전화번호">
				<input type="submit" value="검색">
			</form>
			<table>
				<tr>
					<th id="mNo">회원번호</th>
					<th id="mName">회원명</th>
					<th id="mBirth">생년월일</th>
					<th id="mTel">전화번호</th>
					<th id="mAddr">주소</th>
					<th id="mMileage">마일리지</th>
					<th id="mGrade">등급</th>
					<th id="mJoin">가입일</th>
					<th id="mCount">주문횟수</th>
				</tr>
				<c:forEach var="mlist" items="${mList}">
					<c:if test="${mlist.mbWithdrawal == false}">
						<tr class="underline">
							<td>${mlist.mbNo}</td>
							<td>${mlist.mbName}</td>
							<td><fmt:formatDate value="${mlist.mbBirth}" pattern="yyyy년M월dd일"/></td>
							<td>${mlist.mbTel}</td>
							<td>${mlist.mbAddress}</td>
							<td><fmt:formatNumber groupingUsed="true" value="${mlist.mbMileage}"/>원</td>
							<td>${mlist.mbGrade}</td>
							<td><fmt:formatDate value="${mlist.mbJoin}" pattern="yyyy년M월dd일"/></td>
							<td>${mlist.mbCount}</td>
						</tr>
					</c:if>
					<c:if test="${mlist.mbWithdrawal != false}">
						<tr>
							<td>${mlist.mbNo}</td>
							<td>${mlist.mbName}</td>
							<td><fmt:formatDate value="${mlist.mbBirth}" pattern="yyyy년M월d일"/></td>
							<td>${mlist.mbTel}</td>
							<td>${mlist.mbAddress}</td>
							<td><fmt:formatNumber groupingUsed="true" value="${mlist.mbMileage}"/>원</td>
							<td>${mlist.mbGrade}</td>
							<td><fmt:formatDate value="${mlist.mbJoin}" pattern="yyyy년M월d일"/></td>
							<td>${mlist.mbCount}</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>

<%@ include file="../../view/include/footer.jsp" %>