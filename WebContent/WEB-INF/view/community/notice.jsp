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
</style>
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
					<c:forEach var="nlist" items="${nList}">
						<tr>
							<td>${nlist.noNo}</td>
							<td><a href="${pageContext.request.contextPath}/noticeDetail.do?no=${nlist.noNo}">${nlist.noTitle}</a></td>
							<td>${nlist.noWriter}</td>
							<td class="small"><fmt:formatDate value="${nlist.noRegdate}" pattern="yyyy-MM-dd"/></td>
							<td class="small">${nlist.noReadNt}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="searchdiv">
				<form>
					<select>
						<option>제목</option>
						<option>내용</option>
						<option>제목+내용</option>
						<option>글쓴이</option>
					</select>
					<input type="text" name="search">
					<input type="submit" value="검색">
				</form>
			</div>
		</div>
	</div>
	
<%@ include file="../include/footer.jsp" %>