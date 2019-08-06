<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header_mgn.jsp" %>
<style>
	#wrap {
		min-height: 700px;
		width: 1000px;
		margin: 0 auto;
	}
	#div {
		height: 140px;
	}
	#menuList {
		height: 600px;
		overflow: auto;
		width: 100%;
		border: 1px solid #555;
		margin: 30px 0;
	}
	table {
		border-collapse: collapse;
		width: 100%;
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
		background-color: #eee;
	}
	th {
		padding: 10px 10px;
	}
	#foodName {
		width: 450px;
	}
	#update {
		width: 85px;
		border-right: none;
	}
	button, input[type="submit"] {
		padding: 3px 5px;
		background-color: #887c75;
		border: 1px solid #887c75;
		color: white;
		border-radius: 3px;
		outline: none;
	}
	form {
		padding: 10px;
	}
	select, input[type="text"] {
		padding: 3px;
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
				var fNo = $(this).attr("data-no");
				
				$.ajax({
					url:"${pageContext.request.contextPath}/menuMgndelete.do",
					type:"get",
					data:{"fNo":fNo},
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
		<div id="menuList">
			<form action="${pageContext.request.contextPath}/menuMgninsert.do" method="post">
				<select name="fk">
					<option>FOOD KIND</option>
					<option>PASTA</option>
					<option>STEAK & CUTLET</option>
					<option>PILAF & RISOTTO</option>
					<option>SALAD</option>
					<option>SIGNATURE PIZZA</option>
					<option>PIZZA</option>
					<option>SIDE MENU</option>
					<option>BEVERAGE</option>
					<option>BEER</option>
				</select>
				<input type="text" name="name" size="20" placeholder="음식명">
				<input type="text" name="price" size="5" placeholder="가격">
				<input type="submit" value="추가">
			</form>
			<table>
				<tr>
					<th>음식종류</th>
					<th>음식번호</th>
					<th id="foodName">음식명</th>
					<th>가격</th>
					<th id="update"></th>
				</tr>
				<c:forEach var="flist" items="${fList}">
					<c:if test="${flist.fdWithdrawal == true}">
						<tr class="underline">
							<td>${flist.fkNo}</td>
							<td>${flist.fdNo}</td>
							<td>${flist.fdName}</td>
							<td><fmt:formatNumber groupingUsed="true" value="${flist.fdPrice}"/></td>
							<td>
								<button class="noupdate" data-no="${flist.fdNo}">수정</button>
								<button class="nodelete" data-no="${flist.fdNo}">삭제</button>
							</td>
						</tr>
					</c:if>
					<c:if test="${flist.fdWithdrawal != true}">
						<tr>
							<td>${flist.fkNo}</td>
							<td>${flist.fdNo}</td>
							<td>${flist.fdName}</td>
							<td><fmt:formatNumber groupingUsed="true" value="${flist.fdPrice}"/></td>
							<td>
								<button class="update" data-no="${flist.fdNo}">수정</button>
								<button class="delete" data-no="${flist.fdNo}">삭제</button>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>

<%@ include file="../include/footer.jsp" %>