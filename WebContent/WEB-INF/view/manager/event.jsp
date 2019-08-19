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
		margin-bottom:40px;
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
		padding-bottom:30px;
		border-bottom:2px solid #55423b;
		position: relative;                   
	}
	#write{
		position: absolute;
		width:70px;
		height:30px;
		font-size:15px;
		right:0;
		bottom:5px;
	}
	#pagediv {
		text-align: center;
		padding-top: 20px;
	}
	.current {
		font-weight: bold;
		text-decoration: underline;
	}
	.pn {
		margin: 0 5px;
	}
	table{
		width:100%;
		border-bottom:2px solid #55423b;
		
	}
	td{
		text-align: center;
	}
	.eTitle{
		widtn:350px;
		text-align: left !important;
		padding-left:10px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	
	th, td{
		padding:5px 0;
	}
	th{
		text-align: center  !important;
	}
	tr:first-child{
		background: #f9f9f9;
	}
	.eNo{
		width:150px;
	}
	.eName{
		width:100px;
	}
	.eDate{
		width:300px;
	}
	.eCun{
		width:100px;
	}
	a{
		color:black;
	}
	.ing{
		display: inline-block;
		width:90px;
		height:30px;
		line-height:30px;
		text-align:center;
		background: #c62f24;
		font-size: 15px;
		font-weight: bold;
		margin-bottom:5px;
	}
	.end{
		display: inline-block;
		width:90px;
		height:30px;
		line-height:30px;
		text-align:center;
		background: #a5a5a5;
		font-size:15px;
		font-weight: bold;
		margin-bottom:5px;
		color:white;
	}  
	#MoImg{
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
		padding: 20px 0;
		overflow: hidden;
		clear: both;
		min-height: 390px;
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
		padding-bottom:40px;
		border-bottom:2px solid #55423b;
		position: relative;
		width: 90%;
		margin: 0 auto;        
	}
	#write{
		display: none;
	}
	#pagediv {
		text-align: center;
		padding-top: 20px;
	}
	.current {
		font-weight: bold;
		text-decoration: underline;
	}
	.pn {
		margin: 0 5px;
	}
	table{
		width:90%;
		margin: 0 auto;
		border-bottom:2px solid #55423b;
		
	}
	td{
		text-align: center;
	}
	.eTitle{
		text-align: left !important;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
		padding-left:10px;
		width:80%;
		max-width:240px;
	}
	
	th, td{
		padding:5px 0;
	}
	th{
		text-align: center !important;
	}
	tr:first-child{
		background: #f9f9f9;
	}
	.eNo{
		display: none;
	}
	.eName{
		display: none;
	}
	.eDate{
		display: none;
	}
	.eCun{
		width:20%;
		min-width:70px;
	}
	a{
		color:black;
	}
	.ing{
		display: inline-block;
		width:100%;
		height:30px;
		line-height:30px;
		text-align:center;
		background: #c62f24;
		font-size: 15px;
		font-weight: bold;
		margin-bottom:5px;
	}
	.end{
		display: inline-block;
		width:100%;
		height:30px;
		line-height:30px;
		text-align:center;
		background: #a5a5a5;
		font-size:15px;
		font-weight: bold;
		margin-bottom:5px;
		color:white;
	} 
}
	             
</style>

<script>
	$(function(){
		$("#menu_li").click(function() {
			$("#menulist").toggle();
		})
		$("#write").click(function(){
			if(${Mgn=="1"}){
				location.href = "write.do";
			}else{
				alert("권한이 없습니다.");
				return;
			}
		})
		$(".underLine").mouseover(function(){
			$(this).css("text-decoration", "underline");
		})
		$(".underLine").mouseout(function(){
			$(this).css("text-decoration", "none");
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
		
		$("#ingEvent").click(function(){
			
			$.ajax({
				url : "${pageContext.request.contextPath }/event.do",
				type : "post",
				data : {"current" : "ing"},
				dataType: "json",
				success : function(json){
					console.log(json);
					
					$(".listTr").remove();
					$(json.content).each(function(i, obj){
						var $tr = $("<tr class='listTr'>");
						var $td = $("<td class='eNo'>");
						var $td2 = $("<td class='eTitle'>");
						var $a = $('<a href="#" class="underLine">');
						var $td3 = $('<td class="eName">');
						var $td4 = $('<td class="eDate">');
						var $td5 = $('<td class="eCun">');
						$td.html(obj.eNo);
						$a.attr("href", "eventDetail.do?no="+obj.eNo+"");
						$a.html(obj.eTitle);
						$td2.html($a);
						$td3.html(obj.eName);
						
						var date = new Date(obj.eStartDate);
						var date2 = new Date(obj.eEndDate);
						
						$td4.html(date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" ~ "+date2.getFullYear()+"-"+(date2.getMonth()+1)+"-"+date2.getDate());
						$td5.html("<span class='ing'>진행중</span>");
						
						$tr.append($td).append($td2).append($td3).append($td4).append($td5);
						$("table").append($tr);
						
					})
					
				}
				
			})
		})
		
		$("#endEvent").click(function(){
			
			$.ajax({
				url : "${pageContext.request.contextPath }/event.do",
				type : "post",
				data : {"current" : "end"},
				dataType: "json",
				success : function(json){
					console.log(json);
					
					$(".listTr").remove();
					$(json.content).each(function(i, obj){
						var $tr = $("<tr class='listTr'>");
						var $td = $("<td class='eNo'>");
						var $td2 = $("<td class='eTitle'>");
						var $a = $('<a href="#" class="underLine">');
						var $td3 = $('<td class="eName">');
						var $td4 = $('<td class="eDate">');
						var $td5 = $('<td class="eCun">');
						$td.html(obj.eNo);
						$a.attr("href", "eventDetail.do?no="+obj.eNo+"");
						$a.html(obj.eTitle);
						$td2.html($a);
						$td3.html(obj.eName);
						
						var date = new Date(obj.eStartDate);
						var date2 = new Date(obj.eEndDate);
						
						$td4.html(date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" ~ "+date2.getFullYear()+"-"+(date2.getMonth()+1)+"-"+date2.getDate());
						$td5.html("<span class='end'>마감</span>");
						
						$tr.append($td).append($td2).append($td3).append($td4).append($td5);
						$("table").append($tr);
					})
				}
				
			})
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
					<li id="ingEvent">진행중인 이벤트</li>
					<li id="endEvent">지난 이벤트</li>
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
			<h1>진행중인 이벤트 <button id="write">글쓰기</button></h1>
			<table>
				<tr>
					<th class="eNo">게시물 번호</th>
					<th>제목</th>
					<th class="eName">작성자</th>
					<th class="eDate">이벤트 기간</th>
					<th class="eCun">진행상태</th>
				</tr>
			<c:forEach var="event" items="${eventPage.content }">
				<tr class="listTr">
					<td class="eNo">${event.eNo }</td>
					<td class="eTitle"><a href="eventDetail.do?no=${event.eNo }" class="underLine">${event.eTitle }</a></td>
					<td class="eName">${event.eName }</td>
					<td class="eDate">
					<fmt:formatDate value="${event.eStartDate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.eEndDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td class="eCun">
						<c:if test="${event.eIng==true }">
							<span class="ing">진행중</span>
						</c:if>
						<c:if test="${event.eIng==false }">
							<span class="end">마감</span>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			</table>
				<div id="pagediv">
					<c:if test="${eventPage.startPage > 10}">
						<a href="event.do?page=${eventPage.startPage - 1}" class="pn">&lt;&lt;</a>
					</c:if>
					<c:forEach var="pNo" begin="${eventPage.startPage}" end="${eventPage.endPage}">
						<c:if test="${eventPage.currentPage == pNo}">
							<a href="event.do?page=${pNo}" class="current underLine">${pNo}</a>
						</c:if>
						<c:if test="${eventPage.currentPage != pNo}">
							<a href="event.do?page=${pNo}"  class="underLine">${pNo}</a>
						</c:if>
					</c:forEach>
					<c:if test="${eventPage.endPage < eventPage.totalPages}">
						<a href="event.do?page=${noticePage.endPage + 1}" class="pn">&gt;&gt;</a>
					</c:if>
				</div>
	</div>
<%@ include file="../include/footer.jsp" %>

