<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/noticeDetail.css" type="text/css">

<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>

<%@ include file="../include/header.jsp" %>

<script>
	$(function() {
		$("#pre_btn").click(function() {
			var no = $("#pre_btn").attr("data-no");
			
			$.ajax({
	            url:"${pageContext.request.contextPath}/noticeDetail.do",
	            type:"post",
	            data:{"nNo":no},
	            dataType:"json",
	            success: function(res) {
	               console.log(res);
	               
	               $("#div1").empty();
	               $("#div2").empty();
	               $("#div3 .right").empty();
	               $("#div4").empty();
	               
	               
	               var rDate = new Date(res.noRegdate);
	               var $span = $("<span>").text("작성일 : " + res.noRegdate);

	               $("#div1").append($span);
	               $("#div2").text(res.noTitle);
	               $("#div3 .right").text(res.noReadNt);
	               $("#div4").text(res.noContent);
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
				<div id="noticeWrap">
					<div id="div1">
						<c:choose>
							<c:when test="${notice.noModdate == null}">
								<span>작성일 : <fmt:formatDate pattern="yy-MM-dd kk:mm" value="${notice.noRegdate}"/></span>
							</c:when>
							<c:when test="${notice.noModdate != null}">
								<span>작성일 : <fmt:formatDate pattern="yy-MM-dd kk:mm" value="${notice.noModdate}"/></span>
							</c:when>
						</c:choose>
					</div>
					<div id="div2">
						${notice.noTitle}
					</div>
					<div id="div3">
						<span class="left">글쓴이 : ${notice.noWriter}</span>
						<span class="right">조회 : ${notice.noReadNt}</span>
					</div>
					<div id="div4">
						${fn:replace(notice.noContent,cn,br)}
					</div>
					<div id="div5">
						<div class="left">
							<button id="pre_btn" data-no="${(notice.noNo-1)}">이전글</button>
							<button id="next_btn" data-no="${(notice.noNo+1)}">다음글</button>
						</div>
						<div class="right">
							<a href="${pageContext.request.contextPath}/notice.do?page=${page}"><button>목록</button></a>
						</div>
					</div>
				</div>
				<div id="noticeWrap2">
					<div id="div1">
						<p>${notice.noTitle}</p>
						<span class="div1_span">${notice.noWriter}</span>
						<c:choose>
							<c:when test="${notice.noModdate == null}">
								<span>작성일 : <fmt:formatDate pattern="yy-MM-dd kk:mm" value="${notice.noRegdate}"/></span>
							</c:when>
							<c:when test="${notice.noModdate != null}">
								<span>작성일 : <fmt:formatDate pattern="yy-MM-dd kk:mm" value="${notice.noModdate}"/></span>
							</c:when>
						</c:choose>
						<span>조회: ${notice.noReadNt}</span>
					</div>
					<div class="right">
						<a href="${pageContext.request.contextPath}/notice.do?page=${page}">[목록]</a>
					</div>
					<div id="div2">
						${fn:replace(notice.noContent,cn,br)}
					</div>
				</div>
				<div id="topImg">
					<a href="#"><img src="${pageContext.request.contextPath}/images/up-arrow-icon.png"></a>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="../include/footer.jsp" %>