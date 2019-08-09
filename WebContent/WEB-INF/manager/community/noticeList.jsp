<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../view/include/header_mgn.jsp" %>

<style>
	#wrap {
		min-height: 700px;
		width: 1000px;
		margin: 0 auto;
	}
	#div {
		height: 140px;
	}
	#noticeList {
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
	/* #foodKind {
		width: 180px;
	}
	#foodNo {
		width: 80px;
	}
	#foodName {
		width: 440px;
	}
	#foodPrice {
		width: 85px;
	} */
	#update {
		border-right: none;
	}
	/* #foodtable td:nth-child(1), td:nth-child(2) {
		text-align: center;
	}
	#foodtable td:nth-child(4) {
		text-align: right;
	} */
	button {
		padding: 3px 5px;
		background-color: #c7a593;
		border: 1px solid #c7a593;
		color: white;
		border-radius: 3px;
		outline: none;
		margin: 10px;
	}
	/* .update, .noupdate {
		width: 39px;
	}
	.delete, .nodelete {
		margin-left: 3px;
	} */
	.underline {
		text-decoration: line-through;
		color: red;
		font-size: 0.9em;
	}
</style>
<script>
	
</script>
	<div id="wrap">
		<div id="div"></div>
		<div id="noticeList">
			<a href="${pageContext.request.contextPath}/mgn/noticeMgninsert.do"><button>공지사항 등록</button></a>
			<table>
				<tr>
					<th>번호</th>
					<th>제 목</th>
					<th>글쓴이</th>
					<th>날짜</th>
					<th></th>
				</tr>
				<c:forEach var="nlist" items="${nList}">
					<tr>
						<td>${nlist.noNo}</td>
						<td>${nlist.noTitle}</td>
						<td>${nlist.noWriter}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${nlist.noRegdate}" /></td>
						<td>
							<button class="update" data-no="${nlist.noNo}">수정</button>
							<button class="delete" data-no="${nlist.noNo}">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
<%@ include file="../../view/include/footer.jsp" %>