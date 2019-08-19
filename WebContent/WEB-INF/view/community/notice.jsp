<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/notice.css" type="text/css">

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
						var date2 = new Date(obj.noModdate);
						
						var $tr = $("<tr>");
						var $nno = $("<td>").text(obj.noNo);
						var $a = $("<a>").attr("href", "${pageContext.request.contextPath}/noticeDetail.do?no="+obj.noNo+"&page=${noticePage.currentPage}").text(obj.noTitle);
						var $ntitle = $("<td>").append($a);
						var $nwriter = $("<td>").text(obj.noWriter);
						if(obj.noModdate == null) {
							var $ndate = $("<td class='small'>").text(date.getFullYear()+"-"+("00" + (date.getMonth() + 1)).slice(-2)+"-"+date.getDate());
						}else {
							var $ndate = $("<td class='small'>").text(date2.getFullYear()+"-"+("00" + (date2.getMonth() + 1)).slice(-2)+"-"+date2.getDate());
						}
						var $nread = $("<td class='small'>").text(obj.noReadNt);
						
						$tr.append($nno).append($ntitle).append($nwriter).append($ndate).append($nread);
						$("table").append($tr);
					})
					
					var $lsttr = $("<tr>");
					var $button = $("<button id='listBtn'>").text("목록");
					$lsttr.append($button);
					$("table").append($lsttr);
				}
				
			})
			
			return false;
		})
		
		$("#searchForm2").submit(function() {
			if($("input[name='search2']").val() == "") {
				alert("검색어를 입력하세요.");
				return false;
			}
			
			$("#notice_content > p").css("padding-bottom", "15px");
			
			$.ajax({
				url:"${pageContext.request.contextPath}/noticeSearch.do",
				type:"post",
				data:{"search2":$("input[name='search2']").val()},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					$("#content2").empty();
					
					var $lstdiv = $("<div id='listBtnWrap'>");
					var $span = $("<span id='listBtn2'>").text("[목록]");
					$lstdiv.append($span);
					$("#content2").append($lstdiv);
					
					$(res.content).each(function(i, obj) {
						var date = new Date(obj.noRegdate);
						var date2 = new Date(obj.noModdate);
						
						var $ul = $("<ul>");
						var $a = $("<a>").attr("href", "${pageContext.request.contextPath}/noticeDetail.do?no="+obj.noNo+"&page=${noticePage.currentPage}").text(obj.noTitle);
						var $ntitle = $("<li>").append($a);
						if(obj.noModdate == null) {
							var $ndate = $("<li class='small'>").text("작성일: "+date.getFullYear()+"-"+("00" + (date.getMonth() + 1)).slice(-2)+"-"+date.getDate());
						}else {
							var $ndate = $("<li class='small'>").text("작성일: "+date2.getFullYear()+"-"+("00" + (date2.getMonth() + 1)).slice(-2)+"-"+date2.getDate());
						}
						var $nread = $("<li class='small'>").text("조회수: "+obj.noReadNt);
						
						$ul.append($ntitle).append($ndate).append($nread);
						$("#content2").append($ul);
					})
					
					//$("input[name='search2']").val("");
					//$("#pagediv").hide();
				}
			})
			
			return false;
		})
		
		$(document).on("click", "#listBtn", function() {
			$.ajax({
				url:"${pageContext.request.contextPath}/notice.do",
				type:"post",
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					$("table").empty();
					$("table").append("<tr><th>번호</th><th>제 목</th><th>글쓴이</th><th>날짜</th><th>조회</th></tr>");
					$("input[name='search']").val("");
					
					$(res.content).each(function(i, obj) {
						var date = new Date(obj.noRegdate);
						
						var $tr = $("<tr>");
						var $nno = $("<td>").text(obj.noNo);
						var $a = $("<a>").attr("href", "${pageContext.request.contextPath}/noticeDetail.do?no="+obj.noNo+"&page=${noticePage.currentPage}").text(obj.noTitle);
						var $ntitle = $("<td>").append($a);
						var $nwriter = $("<td>").text(obj.noWriter);
						if(obj.noModdate == null) {
							var $ndate = $("<td class='small'>").text(date.getFullYear()+"-"+("00" + (date.getMonth() + 1)).slice(-2)+"-"+date.getDate());
						}else {
							var $ndate = $("<td class='small'>").text(date2.getFullYear()+"-"+("00" + (date2.getMonth() + 1)).slice(-2)+"-"+date2.getDate());
						}
						var $nread = $("<td class='small'>").text(obj.noReadNt);
						
						$tr.append($nno).append($ntitle).append($nwriter).append($ndate).append($nread);
						$("table").append($tr);
					})
				}
				
			})
		})
		
		$(document).on("click", "#listBtn2", function() {
			$.ajax({
				url:"${pageContext.request.contextPath}/notice.do",
				type:"post",
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					$("#content2").empty();
					$("input[name='search2']").val("");
					$("#notice_content > p").css("padding-bottom", "30px");
					
					$(res.content).each(function(i, obj) {
						var date = new Date(obj.noRegdate);
						var date2 = new Date(obj.noModdate);
						
						var $ul = $("<ul>");
						var $a = $("<a>").attr("href", "${pageContext.request.contextPath}/noticeDetail.do?no="+obj.noNo+"&page=${noticePage.currentPage}").text(obj.noTitle);
						var $ntitle = $("<li>").append($a);
						if(obj.noModdate == null) {
							var $ndate = $("<li class='small'>").text("작성일: "+date.getFullYear()+"-"+("00" + (date.getMonth() + 1)).slice(-2)+"-"+date.getDate());
						}else {
							var $ndate = $("<li class='small'>").text("작성일: "+date2.getFullYear()+"-"+("00" + (date2.getMonth() + 1)).slice(-2)+"-"+date2.getDate());
						}
						var $nread = $("<li class='small'>").text("조회수: "+obj.noReadNt);
						
						$ul.append($ntitle).append($ndate).append($nread);
						$("#content2").append($ul);
					})
				}
				
			})
		})
	})
</script>
	<div class="sub">
		<div class="s_visu1">
			<img id="s_visu1_1" src="${pageContext.request.contextPath}/images/community/sub05_visu.jpg">
			<img id="s_visu1_2" src="${pageContext.request.contextPath}/images/community/f_visu7.jpg">
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
				<table id="content1">
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
							<c:choose>
								<c:when test="${n.noModdate == null}">
									<td class="small"><fmt:formatDate value="${n.noRegdate}" pattern="yyyy-MM-dd"/></td>
								</c:when>
								<c:when test="${n.noModdate != null}">
									<td class="small"><fmt:formatDate value="${n.noModdate}" pattern="yyyy-MM-dd"/></td>
								</c:when>
							</c:choose>
							<td class="small">${n.noReadNt}</td>
						</tr>
					</c:forEach>
				</table>
				<div id="content2">
					<%-- <c:forEach var="nlist" items="${nList}"> --%>
					<c:forEach var="n" items="${noticePage.content}">
						<ul>
							<li><a href="${pageContext.request.contextPath}/noticeDetail.do?no=${n.noNo}&page=${noticePage.currentPage}">${n.noTitle}</a></li>
							<c:choose>
								<c:when test="${n.noModdate == null}">
									<li class="small">작성일: <fmt:formatDate value="${n.noRegdate}" pattern="yyyy-MM-dd"/></li>
								</c:when>
								<c:when test="${n.noModdate != null}">
									<li class="small">작성일: <fmt:formatDate value="${n.noModdate}" pattern="yyyy-MM-dd"/></li>
								</c:when>
							</c:choose>
							<li class="small">조회수: ${n.noReadNt}</li>
						</ul>
					</c:forEach>
				</div>
				<div id="pagediv">
					<c:if test="${noticePage.startPage > 5}">
						<a href="notice.do?page=${noticePage.startPage - 1}" class="pn">&lt;&lt;</a>
					</c:if>
					<c:forEach var="pNo" begin="${noticePage.startPage}" end="${noticePage.endPage}">
						<c:if test="${noticePage.currentPage == pNo}">
							<a href="notice.do?page=${pNo}" class="current">${pNo}</a>
						</c:if>
						<c:if test="${noticePage.currentPage != pNo}">
							<a href="notice.do?page=${pNo}" class="current2">${pNo}</a>
						</c:if>
					</c:forEach>
					<c:if test="${noticePage.endPage < noticePage.totalPages}">
						<a href="notice.do?page=${noticePage.endPage + 1}" class="pn">&gt;&gt;</a>
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
				<form id="searchForm2">
					<input type="text" name="search2" size="40">
					<input type="submit" value="">
				</form>
			</div>
			<div id="topImg">
				<a href="#"><img src="${pageContext.request.contextPath}/images/up-arrow-icon.png"></a>
			</div>
		</div>
	</div>
	
<%@ include file="../include/footer.jsp" %>