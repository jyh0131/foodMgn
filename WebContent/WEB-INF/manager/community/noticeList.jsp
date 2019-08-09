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
		width: 900px;
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
	#noticeNo {
		width: 70px;
	}
	#noticeName {
		width: 380px;
	}
	#noticeWriter {
		width: 90px;
	}
	#noticeDate {
		width: 120px;
	}
	#update {
		border-right: none;
	}
	td:nth-child(1), td:nth-child(3), td:nth-child(4) {
		text-align: center;
	}
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
	$(function() {
		$(".delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			var $btn = $(this);

			if(result == true) {
				var nNo = $(this).attr("data-no");
				
				$.ajax({
					url:"${pageContext.request.contextPath}/noticeMgnDelete.do",
					type:"get",
					data:{"nNo":nNo},
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
			alert("이미 삭제된 글입니다.");
		})
		$(".noupdate").click(function() {
			alert("수정할 수 없습니다.");
		})
		
		$(".update").click(function() {
			location.href = "${pageContext.request.contextPath}/noticeMgnupdate.do";
		})
		
	})
</script>
	<div id="wrap">
		<div id="div"></div>
		<div id="noticeList">
			<a href="${pageContext.request.contextPath}/noticeMgninsert.do"><button>공지사항 등록</button></a>
			<table>
				<tr>
					<th id="noticeNo">번호</th>
					<th id="noticeName">제 목</th>
					<th id="noticeWriter">글쓴이</th>
					<th id="noticeDate">날짜</th>
					<th id="update"></th>
				</tr>
				<c:forEach var="nlist" items="${nList}">
					<c:if test="${nlist.noDelete != true}">
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
					</c:if>
					<c:if test="${nlist.noDelete == true}">
						<tr class="underline">
							<td>${nlist.noNo}</td>
							<td>${nlist.noTitle}</td>
							<td>${nlist.noWriter}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${nlist.noRegdate}" /></td>
							<td>
								<button class="noupdate" data-no="${nlist.noNo}">수정</button>
								<button class="nodelete" data-no="${nlist.noNo}">삭제</button>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
	
<%@ include file="../../view/include/footer.jsp" %>