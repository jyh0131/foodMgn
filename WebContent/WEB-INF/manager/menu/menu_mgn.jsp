<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../view/include/header_mgn.jsp" %>
<style>
	#wrap {
		min-height: 700px;
		width: 1200px;
		margin: 0 auto;
	}
	#div {
		height: 140px;
	}
	#menuList {
		height: 750px;
		overflow: auto;
		width: 100%;
		border: 1px solid #555;
		margin: 30px 0;
	}
	fieldset {
		margin-top: 30px;
		overflow: hidden;
		width: 100%;
	}
	legend {
		padding: 0 10px 0 3px;
	}
	fieldset select {
		float: left;
		margin-right: 5px;
		margin-top: 2px;
	}
	#foodtable {
		border-collapse: collapse;
		width: 100%;
		overflow: hidden;
	}
	#foodtable th, #foodtable td {
		border-top: 1px solid #ccc;
		border-right: 1px solid #ccc;
		padding: 5px 10px;
	}
	#foodtable td:last-child, #foodtable th:last-child {
		border-right: none;
	}
	#foodtable tr:nth-child(2n) {
		background-color: #F7F7F7;
	}
	#foodtable tr:last-child {
		border-bottom: 1px solid #ccc;
	}
	#foodtable th {
		padding: 10px 10px;
	}
	#foodKind {
		width: 150px;
	}
	#foodNo {
		width: 80px;
	}
	#foodName {
		width: 430px;
	}
	#foodPrice {
		width: 90px;
	}
	#update {
		border-right: none;
	}
	#foodtable td:nth-child(1), td:nth-child(2), td:nth-child(3) {
		text-align: center;
	}
	#foodtable td:nth-child(2) img {
		width: 170px;
		height: 80px;
	}
	#foodtable td:nth-child(5) {
		text-align: right;
	}
	button, input[type="submit"] {
		padding: 3px 5px;
		background-color: #c7a593;
		border: 1px solid #c7a593;
		color: white;
		border-radius: 3px;
		outline: none;
	}
	.update, .noupdate {
		width: 39px;
	}
	.delete, .nodelete {
		margin-left: 3px;
	}
	form {
		padding: 10px;
	}
	select, input[type="text"] {
		padding: 3px;
	}
	.underline {
		text-decoration: line-through;
		color: red;
		font-size: 0.9em;
	}
	#f1 {
		float: left;
	}
	#f2 {
		float: right;
		padding-right: 5px;
		overflow: hidden;
	}
	#f2 select {
		float: left;
		margin-right: 5px;
		margin-top: 2px;
	}
	#allList {
		float: right;
		margin: 10px 10px 0 0;
	}
	.upSuc {
		background-color: #555;
		font-size: 0.7em;
		border: 1px solid #555;    
	}
	a {
		color: black;
	}
	#pagediv {
		text-align: center;
		padding-top: 20px;
		padding-bottom: 20px;
	}
	.current {
		font-weight: bold;
	}
	.pn {
		margin: 0 5px;
	}
</style>
<script>
	$(function() {
		$(".delete").click(function() {
			var $btn = $(this);
			var fNo = $(this).attr("data-no");
			
			if($btn.text() == "삭제") {
				var result = confirm("삭제하시겠습니까?");
				
				if(result == true) { 
					$.ajax({
						url:"${pageContext.request.contextPath}/mgn/menuMgnDelete.do?cancel=1",
						type:"get",
						data:{"fNo":fNo},
						dataType:"json",
						success: function(json) {
							console.log(json);
							
							if(json.success == true) {
								$btn.closest("tr").addClass("underline");
								$btn.text("취소");
							}
						}
					})
				}
			}else {
				var result = confirm("삭제를 취소하시겠습니까?");
				
				if(result == true) {
					$.ajax({
						url:"${pageContext.request.contextPath}/mgn/menuMgnDelete.do?cancel=0",
						type:"get",
						data:{"fNo":fNo},
						dataType:"json",
						success: function(json) {
							console.log(json);
							
							if(json.success == true) {
								$btn.closest("tr").removeClass("underline");
								$btn.text("삭제");
							}
						}
					})
				}
			}
				
			return false;
		})
		
		
		$(".noupdate").click(function() {
			alert("수정할 수 없습니다.");
		})
		
		$("#f1").submit(function() {
			if($("select[name='fk']").val() == "음식종류선택") {
				alert("음식 종류를 선택하세요.");       
				return false;
			}
			if($("input[name='name']").val() == "") {
				alert("음식명을 입력하세요.");
	            return false;
	        }
	         
	        if($("input[name='price']").val() == "") {
	        	alert("음식가격을 입력하세요.");
	        	return false;
	        }
	        
	        if(Number($("input[name='price']").val()) < 0) {
	        	alert("가격을 잘못 입력하셨습니다.");
	        	return false;
	        }
	        
	        if(Number($("input[name='price']").val()) != $("input[name='price']").val()) {
	        	alert("가격을 잘못 입력하셨습니다.");
	        	return false;
	        }
		})
		
		$("#f2").submit(function() {
			if($("input[name='fdname']").val() == "") {
				alert("검색할 음식명을 입력하세요.");
	            return false;
	        }
			
			$.ajax({
				url:"${pageContext.request.contextPath}/mgn/menuMgnsearch.do",
				type:"post",
				data:{"fdname":$("input[name='fdname']").val()},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					$("table").empty();
					$("table").append("<tr><th id='foodKind'>음식종류</th><th>사진</th><th id='foodNo'>음식번호</th><th id='foodName'>음식명</th><th id='foodPrice'>가격</th><th id='update'></th></tr>");
					
					$(res.content).each(function(i, obj) {
						var $tr = $("<tr>");
						var $img = $("<img>").attr("src", "${pageContext.request.contextPath}/images/food/"+obj.fdName+".png");
						var $fdImg = $("<td>").append($img);
						var $fkname = $("<td>").text(obj.fkNo.fkName);
						var $fdno = $("<td>").text(obj.fdNo);
						var $fdname = $("<td>").text(obj.fdName);
						var $fdprice = $("<td>").text(obj.fdPrice.toLocaleString()+"원");
						var $lasttd = $("<td>");
						var $button = $("<button class='update' data-no='"+obj.fdNo+"'>수정</button> <button class='delete' data-no='"+obj.fdNo+"'>삭제</button>");
						
						$lasttd.append($button);
						$tr.append($fkname).append($fdImg).append($fdno).append($fdname).append($fdprice).append($lasttd);
						$("table").append($tr);
					})
				}
			})
			
			return false;
		})
		
		$(document).on("click", ".delete", function() {
			var $btn = $(this);
			var fNo = $(this).attr("data-no");
			
			if($btn.text() == "삭제") {
				var result = confirm("삭제하시겠습니까?");
				
				if(result == true) { 
					$.ajax({
						url:"${pageContext.request.contextPath}/mgn/menuMgnDelete.do?cancel=1",
						type:"get",
						data:{"fNo":fNo},
						dataType:"json",
						success: function(json) {
							console.log(json);
							
							if(json.success == true) {
								$btn.closest("tr").addClass("underline");
								$btn.text("취소");
							}
						}
					})
				}
			}else {
				var result = confirm("삭제를 취소하시겠습니까?");
				
				if(result == true) {
					$.ajax({
						url:"${pageContext.request.contextPath}/mgn/menuMgnDelete.do?cancel=0",
						type:"get",
						data:{"fNo":fNo},
						dataType:"json",
						success: function(json) {
							console.log(json);
							
							if(json.success == true) {
								$btn.closest("tr").removeClass("underline");
								$btn.text("삭제");
							}
						}
					})
				}
			}
				
			return false;
		});
		
		$(document).on("click", ".update", function() {
			var fNo = $(this).attr("data-no");
	         var $btn = $(this);
	         var $input = $("<input type='text' name='uprice' size=5>");
	         
	         if($btn.text()=="수정") {
	        	 $btn.text("수정완료");
		         $btn.addClass("upSuc");
		        	
		         $btn.parent().prev().empty();
		         $btn.parent().prev().append($input);
	         } else {
	        	 $btn.text("수정");
	        	 $btn.removeClass("upSuc");
	        	 
		         $.ajax({
		            url:"${pageContext.request.contextPath}/mgn/menuMgnupdate.do",
		            type:"get",
		            data:{"fNo":fNo, "uprice":$("input[name='uprice']").val()},
		            dataType:"json",
		            success: function(res) {
		               console.log(res);
		               
		               if(res.success == true) {
		            	   $btn.parent().prev().empty();
		            	   $btn.parent().prev().text(res.price.toLocaleString()+"원");
		               }
		            }
		         })
	         }
		});
		
		$("#allList").click(function() {
			$.ajax({
	            url:"${pageContext.request.contextPath}/mgn/menuMgnlist.do",
	            type:"post",
	            dataType:"json",
	            success: function(res) {
	               console.log(res);
	               
	               $("table").empty();
				   $("table").append("<tr><th id='foodKind'>음식종류</th><th>사진</th><th id='foodNo'>음식번호</th><th id='foodName'>음식명</th><th id='foodPrice'>가격</th><th id='update'></th></tr>");
				   $("input[name='fdname']").val("");
				   
	               $(res.content).each(function(i, obj) {
	            	   var $tr = $("<tr>");
						var $img = $("<img>").attr("src", "${pageContext.request.contextPath}/images/food/"+obj.fdName+".png");
						var $fdImg = $("<td>").append($img);
						var $fkname = $("<td>").text(obj.fkNo.fkName);
						var $fdno = $("<td>").text(obj.fdNo);
						var $fdname = $("<td>").text(obj.fdName);
						var $fdprice = $("<td>").text(obj.fdPrice.toLocaleString()+"원");
						var $lasttd = $("<td>");
						var $button = $("<button class='update' data-no='"+obj.fdNo+"'>수정</button> <button class='delete' data-no='"+obj.fdNo+"'>삭제</button>");
						
						$lasttd.append($button);
						$tr.append($fkname).append($fdImg).append($fdno).append($fdname).append($fdprice).append($lasttd);
						$("table").append($tr);
	               })
	            }
	         })
		})
	})
</script>

	<div id="wrap">
		<div id="div"></div>
		<%-- <fieldset>
			<legend> 음식추가 </legend>
			<form action="${pageContext.request.contextPath}/mgn/menuMgninsert.do" method="post" id="f1">
			<select name="fk">
				<option>음식종류선택</option>
				<option>파스타</option>
				<option>스테이크&커틀렛</option>
				<option>필라프&리조또</option>
				<option>샐러드</option>
				<option>시그니처 피자</option>
				<option>피자</option>
				<option>사이드 메뉴</option>
				<option>음료</option>
				<option>맥주</option>
			</select>
			<input type="text" name="name" size="20" placeholder="음식명">
			<input type="text" name="price" size="5" placeholder="가격">
			<input type="submit" value="추가">
		</form>
		</fieldset> --%>
		<div id="menuList">
			<button id="allList">전체보기</button>
			<form action="${pageContext.request.contextPath}/mgn/menuMgnsearch.do" method="post" id="f2">
				<input type="text" name="fdname" size="20" placeholder="검색할 음식명">
				<input type="submit" value="검색">
			</form>
			<table id="foodtable">
				<tr>
					<th id="foodKind">음식종류</th>
					<th id="foodImg">사진</th>
					<th id="foodNo">음식번호</th>
					<th id="foodName">음식명</th>
					<th id="foodPrice">가격</th>
					<th id="update"></th>
				</tr>
				<c:forEach var="flist" items="${foodPage.content}">
					<c:if test="${flist.fdWithdrawal == true}">
						<tr class="underline">
							<td>${flist.fkNo}</td>
							<td><img src="${pageContext.request.contextPath}/images/food/${flist.fdName}.png"></td>
							<td>${flist.fdNo}</td>
							<td>${flist.fdName}</td>
							<td><fmt:formatNumber groupingUsed="true" value="${flist.fdPrice}"/>원</td>
							<td>
								<button class="noupdate" data-no="${flist.fdNo}">수정</button>
								<button class="delete" data-no="${flist.fdNo}">취소</button>
							</td>
						</tr>
					</c:if>
					<c:if test="${flist.fdWithdrawal != true}">
						<tr>
							<td>${flist.fkNo}</td>
							<td><img src="${pageContext.request.contextPath}/images/food/${flist.fdName}.png"></td>
							<td>${flist.fdNo}</td>
							<td>${flist.fdName}</td>
							<td><fmt:formatNumber groupingUsed="true" value="${flist.fdPrice}"/>원</td>
							<td>
								<button class="update" data-no="${flist.fdNo}">수정</button>
								<button class="delete" data-no="${flist.fdNo}">삭제</button>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<div id="pagediv">
				<c:if test="${foodPage.startPage > 5}">
					<a href="${pageContext.request.contextPath}/mgn/menuMgnlist.do?page=${foodPage.startPage - 1}" class="pn">&lt;&lt;</a>
				</c:if>
				<c:forEach var="pNo" begin="${foodPage.startPage}" end="${foodPage.endPage}">
					<c:if test="${foodPage.currentPage == pNo}">
						<a href="${pageContext.request.contextPath}/mgn/menuMgnlist.do?page=${pNo}" class="current">${pNo}</a>
					</c:if>
					<c:if test="${foodPage.currentPage != pNo}">
						<a href="${pageContext.request.contextPath}/mgn/menuMgnlist.do?page=${pNo}">${pNo}</a>
					</c:if>
				</c:forEach>
				<c:if test="${foodPage.endPage < foodPage.totalPages}">
					<a href="${pageContext.request.contextPath}/mgn/menuMgnlist.do?page=${foodPage.endPage + 1}" class="pn">&gt;&gt;</a>
				</c:if>
			</div>
		</div>
	</div>
	
<%@ include file="../../view/include/footer.jsp" %>