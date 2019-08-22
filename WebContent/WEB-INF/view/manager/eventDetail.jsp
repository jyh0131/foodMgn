<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
@media screen and (min-width:768px){
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
	#menu_li {
		border: 1px solid #887c75;
		width: 200px;
		height: 25px;
		line-height: 25px;
		padding: 10px 0;
		background-color: #f2efec;
		font-size: 15px;
		text-indent: 16px;
		position: relative;
		cursor: pointer;
		float: left;
	}
	#menu_li2 {
		float: right;                 
	}
	#menu_li2 li {
		list-style: none;
		float: left;
		padding: 5px; 
	}
	.li_img {
		background: url("${pageContext.request.contextPath}/images/menu/s_menu_bg.gif") no-repeat;
		position: absolute;
		top: 20px;
		right: 10px;
		width: 20px;
		height: 10px;
	}
	#menulist {
		display: none;
		width: 200px;
		position: absolute;
		top: 46px;
		left: -1px;
	}
	#menulist li {
		border: 1px solid #887c75;
		border-bottom: 1px dotted #887c75;
		border-top: none;
		width: 200px;
		height: 20px;
		line-height: 20px;
		padding: 10px 0;
		background-color: #f2efec;
		color: black;
	}
	#menulist li:hover {
		background-color: #887c75;
		color: white;
	}
	#menulist li:last-child {
		border-bottom: 1px solid #887c75;
	}
	h1{
		color:#55423b;
		clear: both;
		text-align: center;
		padding-top:20px;
		padding-bottom:40px;
		border-bottom:2px solid #55423b;
		position: relative;                   
	}
	#list{
		position: absolute;
		right:0;
		bottom:5px;
	}
	button{
		width:70px;
		height:30px;
		font-size:15px;
	}
	
	#eventTerm{
		color:pink;
		font-weight: bold;
	}
	
	.ing{
		display: inline-block;
		width:40px;
		height:15px;
		line-height:15px;
		text-align:center;
		background: #c62f24;
		font-size: 10px;
		font-weight: bold;
		margin-bottom:5px;
	}
	.end{
		display: inline-block;
		width:40px;
		height:15px;
		line-height:15px;
		text-align:center;
		background: #a5a5a5;
		font-size: 10px;
		font-weight: bold;
		margin-bottom:5px;
		color:white;
	}
	#title{
		border-bottom: 1px double black;
		padding:10px 20px;
	}
	#event{
		border-bottom: 2px dotted brown;
		padding:10px 20px;
	}
	#text{
		border-bottom: 2px solid #55423b;
		padding:40px 0;
	}
	#btnBox{
		margin-top:20px;
		text-align: right;
	}
	#MoImg{
		display: none;
	}  
	#topImg {
		display: none;
	}
}

@media all and (max-width:767px){
	body {
		background-color: #e8e2dc;
	}
	header {
		background-color: white;
	}
	#PcImg{
		display: none;
	}   
	.s_visu1 {
		width: 100%;
	}
	
	.s_visu1 img{
		width: 100%;
	}
	
	.content {
		position: relative;
		width: 100%;
		margin: 0 auto;
		padding: 20px 0 40px 0;
		overflow: hidden;
		clear: both;
	}
	#menu_li {
		border: 1px solid #887c75;
		width: 200px;
		height: 25px;
		line-height: 25px;
		padding: 10px 0;
		background-color: #f2efec;
		font-size: 15px;
		text-indent: 16px;
		position: relative;
		cursor: pointer;
		float: left;
		margin-bottom: 20px;
		margin-left: 20px;
	}
	#menu_li2 {
		display: none;                
	}
	
	.li_img {
		background: url("${pageContext.request.contextPath}/images/menu/s_menu_bg.gif") no-repeat;
		position: absolute;
		top: 20px;
		right: 10px;
		width: 20px;
		height: 10px;
	}
	#menulist {
		display: none;
		width: 200px;
		position: absolute;
		top: 46px;
		left: -1px;
		z-index: 3;
	}
	#menulist li {
		border: 1px solid #887c75;
		border-bottom: 1px dotted #887c75;
		border-top: none;
		width: 200px;
		height: 20px;
		line-height: 20px;
		padding: 10px 0;
		background-color: #f2efec;
		color: black;
	}
	#menulist li:hover {
		background-color: #887c75;
		color: white;
	}
	#menulist li:last-child {
		border-bottom: 1px solid #887c75;
	}
	h1{
		color:#55423b;
		clear: both;
		text-align: center;
		padding-top:20px;
		padding-bottom:40px;
		border-bottom:2px solid #55423b;
		position: relative;
		width: 90%;
		margin: 0 auto;                
	}
	#list{
		position: absolute;
		right:0;
		bottom:5px;
	}
	
	
	
	
	
	button{
		font-size:15px;
		background-color: #e8e2dc;
		border: none;
		color: #814b34;
		font-weight: bold;
	}
	
	#eventTerm{
		color: #666600 !important;
		font-weight: bold;
		font-size: 0.9em;
		padding-left: 5px;
	}
	
	.ing{
		display: inline-block;
		width:40px;
		height:15px;
		line-height:15px;
		text-align:center;
		background: #c62f24;
		font-size: 10px;
		font-weight: bold;
		margin-bottom:5px;
	}
	.end{
		display: inline-block;
		width:40px;
		height:15px;
		line-height:15px;
		text-align:center;
		background: #a5a5a5;
		font-size: 10px;
		font-weight: bold;
		margin-bottom:5px;
		color:white;
	}
	#title{
		width: 90%;
		margin: 0 auto;
		padding: 10px 0;
		font-weight: bold;
		padding-left: 5px;
	}
	#event{
		border-top: 1px solid #aaa;
		border-bottom: 2px dotted brown;
		width: 90%;
		margin: 0 auto;
		padding: 5px 0 0 0;
		color: #8C8C8C;
		font-size: 0.9em;
	}
	#text{
		border-bottom: 2px solid #55423b;
		padding:40px 0;
		width: 90%;
		margin: 0 auto;
	}
	#btnBox{
		display: none;
	}
	#text img{
		width:100%;
	}
	#topImg {
		position: fixed;
		top: 550px;
		right: 15px;
	}
	#topImg img {
		width: 38px;
		height: 38px;
		background-color: rgba(0,0,0,0.4);
		border-radius: 50%;
	}
}
	
</style>

<script>
	$(function(){
		$(".list").click(function(){
			location.href = "${pageContext.request.contextPath}/event.do";
		})
		var i = 0;
		var a = setInterval(function() {
			i++;
			if(i%2==0){
				$(".ing").css("color","black");
			}else{
				$(".ing").css("color","white");
			}
			
		}, 500)
		
		$("#delete").click(function(){
			var a = confirm("이벤트를 마감하시겠습니까?");
			if(a==true){
				location.href="${pageContext.request.contextPath}/eventDelete.do?no=${event.eNo }"
			}else{
				return false;
			}
		})
		
		$("#update").click(function(){
			var a = confirm("이벤트를 수정하시겠습니까?");
			if(a==true){
				location.href="${pageContext.request.contextPath}/eventUpdate.do?no=${event.eNo }"
			}else{
				return false;
			}
		})
	})
</script> 
	<div class="s_visu1" id="PcImg">
		<img src="${pageContext.request.contextPath}/images/main/event.jpg">
	</div>
	<div class="s_visu1"  id="MoImg">
		<img src="${pageContext.request.contextPath}/images/event/s_visu5.jpg">
	</div>
	<div class="content">
			<div id="menu_li">
				<span class="li_name">진행중인 이벤트</span>
				<span class="li_img"></span>
				<ul id="menulist">
					<li>진행중인 이벤트</li>
					<li>지난 이벤트</li>
				</ul>
			</div>
			<div id="menu_li2">
				<ul>
					<li>HOME</li>
					<li>></li>
					<li>이벤트</li>
					<li>></li>
					<li><b>이벤트</b></li>
				</ul>
			</div>
			<h1>진행중인 이벤트 <button class="list" id="list">목록</button></h1>
			<div id="title">${event.eTitle }</div>
			<div id="event">
			<span id="eventTerm">이벤트기간</span> : <fmt:formatDate value="${event.eStartDate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.eEndDate}" pattern="yyyy-MM-dd"/>
			<c:if test="${event.eIng==true }">
				<span class="ing">진행중</span>
			</c:if>
			<c:if test="${event.eIng==false }">
				<span class="end">마감</span>
			</c:if>
			</div>
			<div id="text">
			${event.eText }
			</div>
			<div id="btnBox">
				<c:if test="${Mgn=='1'}">
					<button id="update">수정</button> <button id="delete">마감</button>
				</c:if>
				 <button class="list">목록</button>
			</div>
			
			<div id="topImg">
				<a href="#"><img src="${pageContext.request.contextPath}/images/up-arrow-icon.png"></a>
			</div>
	</div>
<%@ include file="../include/footer.jsp" %>