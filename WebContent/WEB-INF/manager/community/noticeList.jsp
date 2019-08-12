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
		margin: 30px auto;
	}
	table {
		border-collapse: collapse;
		width: 100%;
		overflow: hidden;
	}
	th, td {
		border-top: 1px solid #ccc;
		border-right: 1px solid #ccc;
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
		padding: 10px;
	}
	td {
		padding: 5px 10px;
	}
	#noticeNo {
		width: 50px;
	}
	#noticeName {
		width: 320px;
	}
	#noticeWriter {
		width: 70px;
	}
	#noticeDate, #noticeUpdate {
		width: 160px;
	}
	#update {
		border-right: none;
	}
	td:nth-child(1), td:nth-child(3), td:nth-child(4), td:nth-child(5) {
		text-align: center;
	}
	button {
		padding: 3px 5px;
		background-color: #c7a593;
		border: 1px solid #c7a593;
		color: white;
		border-radius: 3px;
		outline: none;
	}
	#btn1 {
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
	a {
		color: black;
	}
	.underline a {
		color: red;
	}
</style>
<script>
	$(function() {
		$(".delete").click(function() {
			var nNo = $(this).attr("data-no");
			var $btn = $(this);
			
			if($btn.text() == "삭제") {
				var result = confirm("삭제하시겠습니까?");
				
				if(result == true) {
					$.ajax({
						url:"${pageContext.request.contextPath}/mgn/noticeMgnDelete.do?cancel=1",
						type:"get",
						data:{"nNo":nNo},
						dataType:"json",
						success: function(json) {
							console.log(json);
							
							if(json.success == true) {
								$btn.closest("tr").addClass("underline");
								$btn.text("취소");
							}
						}
					})
				}
			} else {
				var result = confirm("삭제를 취소하시겠습니까?");
				
				if(result == true) {
					$.ajax({
						url:"${pageContext.request.contextPath}/mgn/noticeMgnDelete.do?cancel=0",
						type:"get",
						data:{"nNo":nNo},
						dataType:"json",
						success: function(json) {
							console.log(json);
							
							if(json.success == true) {
								$btn.closest("tr").removeClass("underline");
								$btn.text("삭제");
							}
						}
					})
				}
				
			}
			
			return false;
		})
		
		$(".nodelete").click(function() {
			alert("이미 삭제된 글입니다.");
		})
		$(".noupdate").click(function() {
			alert("수정할 수 없습니다.");
		})
		
		$(".update").click(function() {
			var nNo = $(this).attr("data-no");
			location.href = "${pageContext.request.contextPath}/mgn/noticeMgnupdate.do?no="+nNo;
		})
		
	})
</script>
	<div id="wrap">
		<div id="div"></div>
		<div id="noticeList">
			<a href="${pageContext.request.contextPath}/mgn/noticeMgninsert.do"><button id="btn1">공지사항 등록</button></a>
			<table>
				<tr>
					<th id="noticeNo">번호</th>
					<th id="noticeName">제 목</th>
					<th id="noticeWriter">글쓴이</th>
					<th id="noticeDate">등록일</th>
					<th id="noticeUpdate">수정일</th>
					<th id="update"></th>
				</tr>
				<c:forEach var="nlist" items="${nList}">
					<c:if test="${nlist.noDelete != true}">
						<tr>
							<td>${nlist.noNo}</td>
							<td><a href="${pageContext.request.contextPath}/mgn/noticeMgnupdate.do?no=${nlist.noNo}">${nlist.noTitle}</a></td>
							<td>${nlist.noWriter}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd kk:mm" value="${nlist.noRegdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd kk:mm" value="${nlist.noModdate}" /></td>
							<td>
								<button class="update" data-no="${nlist.noNo}">수정</button>
								<button class="delete" data-no="${nlist.noNo}">삭제</button>
							</td>
						</tr>
					</c:if>
					<c:if test="${nlist.noDelete == true}">
						<tr class="underline">
							<td>${nlist.noNo}</td>
							<td>${nlist.noTitle}</td>
							<td>${nlist.noWriter}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd kk:mm" value="${nlist.noRegdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd kk:mm" value="${nlist.noModdate}" /></td>
							<td>
								<button class="noupdate" data-no="${nlist.noNo}">수정</button>
								<button class="delete" data-no="${nlist.noNo}">취소</button>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
	
<%@ include file="../../view/include/footer.jsp" %>