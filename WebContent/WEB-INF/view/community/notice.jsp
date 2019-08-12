<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<style>
	.s_visu1 {
		width: 100%;
		height: 350px;
	}
	
	.s_visu1 img{
		width: 100%;
		height: 350px;
	}
	.content {
		position: relative;
		width: 1000px;
		margin: 0 auto;
		padding: 20px 0;
		overflow: hidden;
		clear: both;
	}
	#menu_li2 {
		float: right;                 
	}
	#menu_li2 li {
		list-style: none;
		float: left;
		padding: 5px; 
	}
	
	#notice_content > p {
		padding-top: 20px;
		text-align: center;
		font-size: 32px;
		color: #55423b;
		line-height: 32px;
		font-weight: bolder;
		letter-spacing: -0.1em;
	}
	table {
		width: 100%;
		margin-top: 50px;
		border-collapse: collapse;
	}
	th {
		border-top: 2px solid #55423B;
		border-bottom: 2px solid #DDDDDD;
		background-color: #F7F7F7;
		padding: 10px;
		font-size: 12px;
	}
	td {
		padding: 6px 0;
		border-bottom: 1px solid #eaeaea;
	}
	a {
		color: black;
	}
	th:nth-child(1), th:nth-child(5)  {
		width: 50px;
	}
	th:nth-child(2) {
		width: 680px;
	}
	th:nth-child(3) {
		width: 110px;
	}
	th:nth-child(4) {
		width: 80px;	
	}
	.small {
		font-size: 12px;
		color: #999999;
	}
	td:nth-child(1), td:nth-child(3), td:nth-child(4), td:nth-child(5) {
		text-align: center;
	}
	td:nth-child(1), td:nth-child(3) {
		color: #333333;
		font-size: 15px;
	}
	#searchdiv {
		border-bottom: 1px solid #c7a593;
		margin-bottom: 70px;
		margin-top: 30px;
		padding: 5px;
	}
	form {
		overflow: hidden;
		margin-left: 330px;
	}
	input[type="submit"] {
		padding: 2px 7px;
		background-color: #777;
		color: white;
		border: 1px solid #777;
		border-radius: 3px;
		float: left;
	}
	input[type="text"], select {
		padding: 3px;
		float: left;
		margin-right: 5px;
	}
	#pagediv {
		text-align: center;
		padding-top: 20px;
	}
	.current {
		font-weight: bold;
		text-decoration: underline;
	}
</style>
<script>
	$(function() {
		$("#searchForm").submit(function() {
			var opt = $("select[name='searchoption']").val();
			var search = $("input[name='search']").val();

			if(search == "") {
				alert("검색어를 입력하세요.");
				return false;
			}
			
			$.ajax({
				url:"${pageContext.request.contextPath}/noticeSearch.do",
				type:"post",
				data:{"opt":opt, "search":search},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					$("table").empty();
					$("table").append("<tr><th>번호</th><th>제 목</th><th>글쓴이</th><th>날짜</th><th>조회</th></tr>");
					
					$(res.content).each(function(i, obj) {
						var date = new Date(obj.noRegdate);
						
						var $tr = $("<tr>");
						var $nno = $("<td>").text(obj.noNo);
						var $a = $("<a>").attr("href", "${pageContext.request.contextPath}/noticeDetail.do?no="+obj.noNo+"&page=${noticePage.currentPage}").text(obj.noTitle);
						var $ntitle = $("<td>").append($a);
						var $nwriter = $("<td>").text(obj.noWriter);
						var $ndate = $("<td class='small'>").text(date.getFullYear()+"-"+("00" + (date.getMonth() + 1)).slice(-2)+"-"+date.getDate());
						var $nread = $("<td class='small'>").text(obj.noReadNt);
						
						$tr.append($nno).append($ntitle).append($nwriter).append($ndate).append($nread);
						$("table").append($tr);
					})
					
				}
				
			})
			
			return false;
		})
	})
</script>
	<div class="sub">
		<div class="s_visu1">
			<img src="${pageContext.request.contextPath}/images/community/sub05_visu.jpg">
		</div>
		<div class="content">
			<div id="menu_li2">
				<ul>
					<li>HOME</li>
					<li>></li>
					<li>커뮤니티</li>
					<li>></li>
					<li><b>공지사항</b></li>
				</ul>
			</div>
			<div class="clear"></div>
			<div id="notice_content">
				<p>공지사항</p>
				<table>
					<tr>
						<th>번호</th>
						<th>제 목</th>
						<th>글쓴이</th>
						<th>날짜</th>
						<th>조회</th>
					</tr>
					<%-- <c:forEach var="nlist" items="${nList}"> --%>
					<c:forEach var="n" items="${noticePage.content}">
						<tr>
							<td>${n.noNo}</td>
							<td><a href="${pageContext.request.contextPath}/noticeDetail.do?no=${n.noNo}&page=${noticePage.currentPage}">${n.noTitle}</a></td>
							<td>${n.noWriter}</td>
							<td class="small"><fmt:formatDate value="${n.noRegdate}" pattern="yyyy-MM-dd"/></td>
							<td class="small">${n.noReadNt}</td>
						</tr>
					</c:forEach>
				</table>
				<div id="pagediv">
					<c:if test="${noticePage.startPage > 5}">
						<a href="notice.do?page=${noticePage.startPage - 1}" class="pn">[이전]</a>
					</c:if>
					<c:forEach var="pNo" begin="${noticePage.startPage}" end="${noticePage.endPage}">
						<c:if test="${noticePage.currentPage == pNo}">
							<a href="notice.do?page=${pNo}" class="current">${pNo}</a>
						</c:if>
						<c:if test="${noticePage.currentPage != pNo}">
							<a href="notice.do?page=${pNo}">${pNo}</a>
						</c:if>
					</c:forEach>
					<c:if test="${noticePage.endPage < noticePage.totalPages}">
						<a href="notice.do?page=${noticePage.endPage + 1}" class="pn">[다음]</a>
					</c:if>
				</div>
			</div>
			<div id="searchdiv">
				<form id="searchForm">
					<select name="searchoption">
						<option>제목</option>
						<option>내용</option>
						<option>제목+내용</option>
					</select>
					<input type="text" name="search">
					<input type="submit" value="검색">
				</form>
			</div>
		</div>
	</div>
	
<%@ include file="../include/footer.jsp" %>