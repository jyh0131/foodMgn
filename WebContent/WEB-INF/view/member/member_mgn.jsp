<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header_mgn.jsp" %>

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
	#update {
		width: 85px;
		border-right: none;
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
</style>
<script>
	$(function() {
		$(".delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			var $btn = $(this);

			if(result == true) {
				var mNo = $(this).attr("data-no");
				
				$.ajax({
					url:"${pageContext.request.contextPath}/memberMgndelete.do",
					type:"get",
					data:{"mNo":mNo},
					dataType:"json",
					success: function(json) {
						console.log(json);
						
						if(json.success == true) {
							$btn.closest("tr").addClass("underline");
						}
					}
				})
			}
			return false;
		})
		$(".nodelete").click(function() {
			alert("이미 삭제한 음식입니다.");
		})
		$(".noupdate").click(function() {
			alert("수정할 수 없습니다.");
		})
	})
</script>

	<div id="wrap">
		<div id="div"></div>
		<div id="memberList">
			<table>
				<tr>
					<th>회원번호</th>
					<th>회원명</th>
					<th>생년월일</th>
					<th>주소</th>
					<th>마일리지</th>
					<th>등급</th>
					<th>가입일</th>
					<th>주문횟수</th>
					<th id="update"></th>
				</tr>
				<c:forEach var="mlist" items="${mList}">
					<c:if test="${mlist.mbWithdrawal == false}">
						<tr class="underline">
							<td>${mlist.mbNo}</td>
							<td>${mlist.mbName}</td>
							<td><fmt:formatDate value="${mlist.mbBirth}" pattern="yyyy년MM월dd일"/></td>
							<td>${mlist.mbAddress}</td>
							<td><fmt:formatNumber groupingUsed="true" value="${mlist.mbMileage}"/></td>
							<td>${mlist.mbGrade}</td>
							<td><fmt:formatDate value="${mlist.mbJoin}" pattern="yyyy년MM월dd일"/></td>
							<td>${mlist.mbCount}</td>
							<td>
								<button class="noupdate" data-no="${mlist.mbNo}">수정</button>
								<button class="nodelete" data-no="${mlist.mbNo}">삭제</button>
							</td>
						</tr>
					</c:if>
					<c:if test="${mlist.mbWithdrawal != false}">
						<tr>
							<td>${mlist.mbNo}</td>
							<td>${mlist.mbName}</td>
							<td><fmt:formatDate value="${mlist.mbBirth}" pattern="yyyy년MM월dd일"/></td>
							<td>${mlist.mbAddress}</td>
							<td><fmt:formatNumber groupingUsed="true" value="${mlist.mbMileage}"/></td>
							<td>${mlist.mbGrade}</td>
							<td><fmt:formatDate value="${mlist.mbJoin}" pattern="yyyy년MM월dd일"/></td>
							<td>${mlist.mbCount}</td>
							<td>
								<button class="update" data-no="${mlist.mbNo}">수정</button>
								<button class="delete" data-no="${mlist.mbNo}">삭제</button>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>

<%@ include file="../include/footer.jsp" %>