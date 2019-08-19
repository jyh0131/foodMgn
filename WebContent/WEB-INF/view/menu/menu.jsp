<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css" type="text/css">

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
			var fkNameE = ["PASTA","STEAK&CUTLET","PILAF&RISOTTO","SALAD","SIGNATURE PIZZA","PIZZA","SIDE MENU","BEVERAGE","BEER"];
			
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
					$("#menu_name h3").empty();
					
					var $t_img = $("<img>").attr("src", "${pageContext.request.contextPath}/images/menu/"+fkName[fNo-1]+".jpg");
					$("#title_img").append($t_img);		
					
					var $b = $("<b>").text(fkNameE[fNo-1]);
					$("#fkN").append($b);
					
					$(".li_name").text(fkNameE[fNo-1]);
					
					var $h1 = $("<span>").text(fkNameE[fNo-1]);
					$("#menu_name h1").append($h1);
					
					var $h3 = $("<span>").text("["+fkName[fNo-1]+"]");
					$("#menu_name h3").append($h3);
					
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
			<img id="s_visu1_1" src="${pageContext.request.contextPath}/images/menu/sub02_visu.jpg">
			<img id="s_visu1_2" src="${pageContext.request.contextPath}/images/menu/s_visu2.jpg">
		</div>
		<div class="content">
			<div id="menu_li">
				<span class="li_name">${fkNameEng}</span>
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
					<li id="fkN"><b>${fkNameEng}</b></li>
				</ul>
			</div>
			<div class="clear"></div>
			<div id="menu_content">
				<div id="title_img">
					<img src="${pageContext.request.contextPath}/images/menu/${fkName}.jpg">
				</div>
				<div id="menu_name">
					<h1>${fkNameEng}</h1>
					<h3>[${fkName}]</h3>
					<div id="title_img2">
						<img src="${pageContext.request.contextPath}/images/menu/${fkName}.jpg">
					</div>
					<ul id="ul1">
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
					<ul id="ul2">
						<c:forEach var="flist" items="${fList}">
							<div class="mobileImg">
								<c:if test="${flist.fkNo.fkNo == 8}">
									<li class="bevImg"><img src="${pageContext.request.contextPath}/images/food/${flist.fdName}.png"></li>
									<li class="foodNameEng">${flist.fdNameEng}</li>
									<li class="foodName">${flist.fdName}</li>
								</c:if>
								<c:if test="${flist.fkNo.fkNo == 9}">
									<li class="beerImg"><img src="${pageContext.request.contextPath}/images/food/${flist.fdName}.png"></li>
									<li class="foodNameEng">${flist.fdNameEng}</li>
									<li class="foodName">${flist.fdName}</li>
								</c:if>
								<c:if test="${flist.fkNo.fkNo != 8 and flist.fkNo.fkNo != 9}">
									<li><img src="${pageContext.request.contextPath}/images/food/${flist.fdName}.png"></li>
									<li class="foodNameEng">${flist.fdNameEng}</li>
									<li class="foodName">${flist.fdName}</li>
									<li class="foodExplain">${flist.fdExplain}</li>
								</c:if>
							</div>
						</c:forEach>
					</ul>
				</div>
				<div id="topImg">
					<a href="#"><img src="${pageContext.request.contextPath}/images/up-arrow-icon.png"></a>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="../include/footer.jsp" %>