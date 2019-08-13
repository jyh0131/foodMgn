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
	
	
	
	#menu_content {
		margin: 50px 0;
	}
	#title_img {
		padding: 30px 0;
	}
	#menu_name {
		padding: 20px 0;
		text-align: center;
	}
	#menu_name h1 {
		color: #814b34;
		font-weight: bold;
		font-size: 34px;
		margin-bottom: 10px; 
	}
	#menu_name p {
		color: #766f6c;
		font-size: 15px;
		padding: 10px;
	}
	#menu_name li {
		list-style: none;
		width: 100%;
		
	}
	.bevImg img {
		float: left;
		width: 250px;
		height: 620px;
		border-bottom: 1px dotted #555;
	}
	.bevImg:last-child img {
		margin-bottom: 70px;
	}
	.beerImg img {
		float: left;
		width: 250px;
		height: 415px;
		border-bottom: 1px dotted #555;
	}
	.beerImg:nth-child(1) img, .beerImg:nth-child(2) img {
		width: 500px;
		height: 400px;
	}
	.beerImg:last-child img {
		margin-bottom: 70px;
	}
</style>

<script>
	$(function() {
		$("#menu_li").click(function() {
			$("#menulist").toggle();
		})
		/* $("#menu_li").click(function() {
			$("#menulist").show();
			$("#menulist li").show();
		})
		
		$("#menu_li").mouseleave(function(e) {
			var container = $("#menulist");
			if(container.has(e.target).length === 0)
				container.hide();
		})
		
		$("#menulist").mouseleave(function(e) {
			var container = $("#menulist li");
			if(container.has(e.target).length === 0)
				container.hide();
		}) */
		
		$("#menu_li li").click(function() {
			var $li = $(this);
			var fNo = $(this).attr("data-no");
			var fkName = ["파스타","스테이크&커틀렛","필라프&리조또","샐러드","시그니처 피자","피자","사이드 메뉴","음료","맥주"];
			
			$.ajax({
				url:"${pageContext.request.contextPath}/menu.do",
				type:"post",
				data:{"fNo":fNo},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					$("#menu_name ul").empty();
					$("#title_img").empty();
					$("#fkN").empty();
					$(".li_name").empty();
					$("#menu_name h1").empty();
					
					var $t_img = $("<img>").attr("src", "${pageContext.request.contextPath}/images/menu/"+fkName[fNo-1]+".jpg");
					$("#title_img").append($t_img);		
					
					var $b = $("<b>").text(fkName[fNo-1]);
					$("#fkN").append($b);
					
					$(".li_name").text(fkName[fNo-1]);
					
					var $h1 = $("<h1>").text(fkName[fNo-1]);
					$("#menu_name h1").append($h1);
					
					$(res).each(function(i, obj) {
						if(fNo == 8) {
							var $img = $("<img>").attr("src", "${pageContext.request.contextPath}/food/"+obj.fdImg);						
							var $li = $("<li class='bevImg'>").append($img);
							
							$("#menu_name ul").append($li);
						}else if(fNo == 9) {
							var $img = $("<img>").attr("src", "${pageContext.request.contextPath}/food/"+obj.fdImg);						
							var $li = $("<li class='beerImg'>").append($img);
							
							$("#menu_name ul").append($li);
						}else if(fNo != 8 || fNo != 9) {
							var $img = $("<img>").attr("src", "${pageContext.request.contextPath}/food/"+obj.fdImg);						
							var $li = $("<li>").append($img);
							
							$("#menu_name ul").append($li);
						}
					})
				}
			})
		})
	})
</script>
	<div class="sub">
		<div class="s_visu1">
			<img src="${pageContext.request.contextPath}/images/menu/sub02_visu.jpg">
		</div>
		<div class="content">
			<div id="menu_li">
				<span class="li_name">${fkName}</span>
				<span class="li_img"></span>
				<ul id="menulist">
					<c:forEach var="fklist" items="${fkList}">
						<%-- <a href="${pageContext.request.contextPath}/menu.do?fkno=${fklist.fkNo}"><li>${fklist}</li></a> --%>
						<li data-no="${fklist.fkNo}">${fklist}</li>
					</c:forEach>
				</ul>
			</div>
			<div id="menu_li2">
				<ul>
					<li>HOME</li>
					<li>></li>
					<li>메뉴소개</li>
					<li>></li>
					<li id="fkN"><b>${fkName}</b></li>
				</ul>
			</div>
			<div class="clear"></div>
			<div id="menu_content">
				<div id="title_img">
					<img src="${pageContext.request.contextPath}/images/menu/${fkName}.jpg">
				</div>
				<div id="menu_name">
					<h1>${fkName}</h1>
					<ul>
						<c:forEach var="flist" items="${fList}">
							<c:if test="${flist.fkNo.fkNo == 8}">
								<li class="bevImg"><img src="${pageContext.request.contextPath}/food/${flist.fdImg}"></li>
							</c:if>
							<c:if test="${flist.fkNo.fkNo == 9}">
								<li class="beerImg"><img src="${pageContext.request.contextPath}/food/${flist.fdImg}"></li>
							</c:if>
							<c:if test="${flist.fkNo.fkNo != 8 and flist.fkNo.fkNo != 9}">
								<li><img src="${pageContext.request.contextPath}/food/${flist.fdImg}"></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="../include/footer.jsp" %>