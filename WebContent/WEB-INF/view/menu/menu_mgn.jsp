<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header_mgn.jsp" %>
<style>
	#wrap {
		min-height: 700px;
		width: 1000px;
		margin: 0 auto;
	}
	#div {
		height: 140px;
	}
	#menuList {
		height: 600px;
		overflow: auto;
		width: 100%;
		border: 1px solid #555;
		margin: 30px 0;
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
	#foodtable td:last-child {
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
		width: 180px;
	}
	#foodNo {
		width: 80px;
	}
	#foodName {
		width: 440px;
	}
	#foodPrice {
		width: 85px;
	}
	#update {
		border-right: none;
	}
	#foodtable td:nth-child(1), td:nth-child(2) {
		text-align: center;
	}
	#foodtable td:nth-child(4) {
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
	}
	#allList {
		float: right;
		margin: 10px 10px 0 0;
	}
	
	#uptable td, #uptable tr {
		border: 1px solid black;
	}
</style>
<script>
	$(function() {
		$(".delete").click(function() {
			var result = confirm("삭제하시겠습니까?");
			var $btn = $(this);

			if(result == true) {
				var fNo = $(this).attr("data-no");
				
				$.ajax({
					url:"${pageContext.request.contextPath}/menuMgndelete.do",
					type:"get",
					data:{"fNo":fNo},
					dataType:"json",
					success: function(json) {
						console.log(json);
						
						if(json.success == true) {
							$btn.closest("tr").addClass("underline");
						}
					}
				})
			}
			return false;
		})
		
		$(".update").click(function() {
			
		})
		
		$(".nodelete").click(function() {
			alert("이미 삭제한 음식입니다.");
		})
		$(".noupdate").click(function() {
			alert("수정할 수 없습니다.");
		})
		
		$("#f1").submit(function() {
			if($("select[name='fk']").val() == "FOOD KIND") {
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
				url:"${pageContext.request.contextPath}/menuMgnsearch.do",
				type:"post",
				data:{"fdname":$("input[name='fdname']").val()},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					$("table").empty();
					$("table").append("<tr><th id='foodKind'>음식종류</th><th id='foodNo'>음식번호</th><th id='foodName'>음식명</th><th id='foodPrice'>가격</th><th id='update'></th></tr>");
					
					$(res).each(function(i, obj) {
						var $tr = $("<tr>");
						var $fkname = $("<td>").text(obj.fkNo.fkName);
						var $fdno = $("<td>").text(obj.fdNo);
						var $fdname = $("<td>").text(obj.fdName);
						var $fdprice = $("<td>").text(obj.fdPrice.toLocaleString()+"원");
						var $lasttd = $("<td>");
						var $button = $("<button class='update' data-no='${obj.fdNo}'>수정</button> <button class='delete' data-no='${obj.fdNo}'>삭제</button>");
						
						$lasttd.append($button);
						$tr.append($fkname).append($fdno).append($fdname).append($fdprice).append($lasttd);
						$("table").append($tr);
					})
				}
			})
			return false;
		})
		
		$("#allList").click(function() {
			location.href = "${pageContext.request.contextPath}/menuMgnlist.do";
		})
	})
</script>

	<div id="wrap">
		<div id="div"></div>
		<div id="menuList">
			<form action="${pageContext.request.contextPath}/menuMgninsert.do" method="post" id="f1">
				<select name="fk">
					<option>FOOD KIND</option>
					<option>PASTA</option>
					<option>STEAK & CUTLET</option>
					<option>PILAF & RISOTTO</option>
					<option>SALAD</option>
					<option>SIGNATURE PIZZA</option>
					<option>PIZZA</option>
					<option>SIDE MENU</option>
					<option>BEVERAGE</option>
					<option>BEER</option>
				</select>
				<input type="text" name="name" size="20" placeholder="음식명">
				<input type="text" name="price" size="5" placeholder="가격">
				<input type="submit" value="추가">
			</form>
			<button id="allList">전체보기</button>
			<form action="${pageContext.request.contextPath}/menuMgnsearch.do" method="post" id="f2">
				<input type="text" name="fdname" size="20" placeholder="검색할 음식명">
				<input type="submit" value="검색">
			</form>
			<table id="foodtable">
				<tr>
					<th id="foodKind">음식종류</th>
					<th id="foodNo">음식번호</th>
					<th id="foodName">음식명</th>
					<th id="foodPrice">가격</th>
					<th id="update"></th>
				</tr>
				<c:forEach var="flist" items="${fList}">
					<c:if test="${flist.fdWithdrawal == true}">
						<tr class="underline">
							<td>${flist.fkNo}</td>
							<td>${flist.fdNo}</td>
							<td>${flist.fdName}</td>
							<td><fmt:formatNumber groupingUsed="true" value="${flist.fdPrice}"/>원</td>
							<td>
								<button class="noupdate" data-no="${flist.fdNo}">수정</button>
								<button class="nodelete" data-no="${flist.fdNo}">삭제</button>
							</td>
						</tr>
					</c:if>
					<c:if test="${flist.fdWithdrawal != true}">
						<tr>
							<td>${flist.fkNo}</td>
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
		</div>
	</div>
	
<%@ include file="../include/footer.jsp" %>