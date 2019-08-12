<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>

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
	
	#div1 {
		overflow: hidden;
		border-bottom: 2px solid #555;
		padding: 5px;
		margin-top: 80px;
	}
	#div1 span {
		color: #929292;
		font-weight: bold;
		float: left;
		line-height: 25px;
	}
	button {
		padding: 2px 7px;
		font-size: 11px;
	}
	#div2 {
		background-color: #F7F7F7;
		border-bottom: 1px solid #c7a593;
		padding: 5px;
	}
	#div3 {
		color: #929292;
		border-bottom: 1px solid #ccc;
		overflow: hidden;
		padding: 5px;
	}
	.left {
		float: left;
	}
	.right {
		float: right;
		margin-right: 5px;
	}
	#div4 {
		padding: 50px 10px;
		border-bottom: 1px solid #c7a593;
	}
	#div5 {
		padding: 10px 5px;
		border-top: 1px solid #ccc;
		border-bottom: 1px solid #c7a593;
		margin: 30px 0 60px 0;
		overflow: hidden;
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
				<div id="div1">
					<span>작성일 : <fmt:formatDate pattern="yy-MM-dd kk:mm" value="${notice.noRegdate}"/></span>
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
						<a href=""><button>이전글</button></a>
						<a href=""><button>다음글</button></a>
					</div>
					<div class="right">
						<a href="${pageContext.request.contextPath}/notice.do"><button>목록</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="../include/footer.jsp" %>