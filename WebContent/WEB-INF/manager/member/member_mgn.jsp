<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../view/include/header_mgn.jsp" %>

<style>
	#wrap {
		min-height: 700px;
		width: 1300px;
		margin: 0 auto;
	}
	#div {
		height: 140px;
	}
	#memberList {
		height: 600px;
		overflow: auto;
		width: 100%;
		border: 1px solid #555;
		margin: 30px 0;
	}
	table {
		border-collapse: collapse;
		width: 100%;
		clear: both;
	}
	th, td {
		border-top: 1px solid #ccc;
		border-right: 1px solid #ccc;
		padding: 5px 5px;
	}
	td:last-child, th:last-child {
		border-right: none;
	}
	tr:nth-child(2n) {
		background-color: #F7F7F7;
	}
	tr:last-child {
		border-bottom: 1px solid #ccc;
	}
	th {
		padding: 10px 10px;
	}
	#mNo, #mName, #mMileage, #mCount, #mGrade {
		width: 70px;
	}
	#mBirth, #mJoin, #mTel {
		width: 125px;
	}
	#mAddr {
		width: 240px;
	}
	th:nth-child(10) {
		width: 100px;
	}
	td:nth-child(1), td:nth-child(2), td:nth-child(3), td:nth-child(4), td:nth-child(7), td:nth-child(8), td:nth-child(9) {
		text-align: center;
	}
	td:nth-child(6) {
		text-align: right;
	}
	td:nth-child(10), th:nth-child(10) {
		border-right: none;
	}
	td:last-child {
		padding-left: 10px;
	}
	/* .couponCheck {
		display: none;
		padding-top: 40%;
	}
	.couponCheck2 {
		display: none;
		padding: 5px 5px;
		padding-top: 30%;
	}
	input[type="checkbox"] {
		float: left;
	} */
	button, input[type="submit"] {
		padding: 3px 5px;
		background-color: #c7a593;
		border: 1px solid #c7a593;
		color: white;
		border-radius: 3px;
		outline: none;
	}
	.underline {
		text-decoration: line-through;
		color: red;
		font-size: 0.9em;
	}
	form {
		padding: 10px;
	}
	input[type="text"], select {
		padding: 3px;
	}
	#f2 {
		float: left;
		padding-right: 5px;
	}
	#allList {
		float: left;
		margin-top: 10px;
	}
	select[name="cp"] {
		float: left;
		margin-right: 5px;
	}
	#addCoupon, #deleteCoupon {
		float: right;
		margin: 10px 5px 10px 5px;
	}
	#deleteCoupon {
		margin-right: 10px;
		margin-left: 0;
	}
	#couponForm, #couponForm2 {
		float: right;
		display: none;
		padding-right: 5px;
	}
	#couponForm {
		padding-right: 0;
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
	.hidden {
		display: none;
	}
</style>
<script>
	$(function() {
		$("#f2").submit(function() {
			if($("input[name='tel']").val() == "") {
				alert("검색할 전화번호를 입력하세요.");
	            return false;
	        }
			
			$.ajax({
				url:"${pageContext.request.contextPath}/mgn/memberMgnsearch.do",
				type:"post",
				data:{"tel":$("input[name='tel']").val()},
				dataType:"json",
				success: function(res) {
					for(var j=0; j<res.length; j++) {
						if(res[j] == null) {
							alert("회원이 없습니다");
							$("input[name='tel']").val("");
							return;
						}
					}
					
					console.log(res);
					
					$("table").empty();
					$("table").append("<tr><th id='mNo'>회원번호</th><th id='mName'>회원명</th><th id='mBirth'>생년월일</th><th id='mTel'>전화번호</th><th id='mAddr'>주소</th><th id='mMileage'>마일리지</th><th id='mGrade'>등급</th><th id='mJoin'>가입일</th><th id='mCount'>주문횟수</th><th>쿠폰</th><th><input type='checkbox' id='allcheck' class='hidden'></th></tr>");
					$("input[name='tel']").val("");
					
					$(res).each(function(i, obj) {
						var birth = new Date(obj.mbBirth);
						var join = new Date(obj.mbJoin);
						
						var $tr = $("<tr>");
						var $mbno = $("<td>").text(obj.mbNo);
						var $mbname = $("<td>").text(obj.mbName);
						var $mbbirth = $("<td>").text(birth.getFullYear()+"년"+("00" + (birth.getMonth() + 1)).slice(-2)+"월"+("00" + birth.getDate()).slice(-2)+"일");
						var $mbtel = $("<td>").text(obj.mbTel.substring(0, 3)+"-"+obj.mbTel.substring(3, 7)+"-"+obj.mbTel.substring(7, 11));
						var $mbaddress = $("<td>").text(obj.mbAddress);
						var $mbmileage = $("<td>").text(obj.mbMileage.toLocaleString()+"원");
						var $mbgrade = $("<td>").text(obj.mbGrade.grade);
						var $mbjoin = $("<td>").text(join.getFullYear()+"년"+("00" + (join.getMonth() + 1)).slice(-2)+"월"+("00" + join.getDate()).slice(-2)+"일");
						var $mbcount = $("<td>").text(obj.mbCount);
						var $coupon;
						if(obj.coupon.length == 0) {
							$coupon = $("<td>").text("");
						}else if(obj.coupon.length != 0) {
							$(obj.coupon).each(function(i, obj2) {
								var cpName = obj2.cpName.replace(",","<br>").trim();
								if(cpName.indexOf(",") >= 0) {
									var cpName2 = cpName.replace(",","<br>").trim();
									$coupon = $("<td>").html(cpName2);
								}else if(cpName.indexOf(",") < 0) {
									$coupon = $("<td>").html(cpName);
								}
							})
						}
						var $input = $("<input type='checkbox' class='check hidden'>");
						var $lasttd = $("<td>").append($input);
						
						$tr.append($mbno).append($mbname).append($mbbirth).append($mbtel).append($mbaddress).append($mbmileage).append($mbgrade).append($mbjoin).append($mbcount).append($coupon).append($lasttd);
						$("table").append($tr);
					})
				}
			})
			return false;
		})
		
		$("#allList").click(function() {
			$.ajax({
				url:"${pageContext.request.contextPath}/mgn/memberMgnlist.do",
				type:"post",
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					$("table").empty();
					$("table").append("<tr><th id='mNo'>회원번호</th><th id='mName'>회원명</th><th id='mBirth'>생년월일</th><th id='mTel'>전화번호</th><th id='mAddr'>주소</th><th id='mMileage'>마일리지</th><th id='mGrade'>등급</th><th id='mJoin'>가입일</th><th id='mCount'>주문횟수</th><th>쿠폰</th><th><input type='checkbox' id='allcheck' class='hidden'></th></tr>");
					$("input[name='tel']").val("");
					
					$(res.content).each(function(i, obj) {
						var birth = new Date(obj.mbBirth);
						var join = new Date(obj.mbJoin);
						
						var $tr = $("<tr>");
						var $mbno = $("<td>").text(obj.mbNo);
						var $mbname = $("<td>").text(obj.mbName);
						var $mbbirth = $("<td>").text(birth.getFullYear()+"년"+("00" + (birth.getMonth() + 1)).slice(-2)+"월"+("00" + birth.getDate()).slice(-2)+"일");
						var $mbtel = $("<td>").text(obj.mbTel.substring(0, 3)+"-"+obj.mbTel.substring(3, 7)+"-"+obj.mbTel.substring(7, 11));
						var $mbaddress = $("<td>").text(obj.mbAddress);
						var $mbmileage = $("<td>").text(obj.mbMileage.toLocaleString()+"원");
						var $mbgrade = $("<td>").text(obj.mbGrade.grade);
						var $mbjoin = $("<td>").text(join.getFullYear()+"년"+("00" + (join.getMonth() + 1)).slice(-2)+"월"+("00" + join.getDate()).slice(-2)+"일");
						var $mbcount = $("<td>").text(obj.mbCount);
						var $coupon;
						if(obj.coupon.length == 0) {
							$coupon = $("<td>").text("");
						}else if(obj.coupon.length != 0) {
							$(obj.coupon).each(function(i, obj2) {
								var cpName = obj2.cpName.replace(",","<br>").trim();
								if(cpName.indexOf(",") >= 0) {
									var cpName2 = cpName.replace(",","<br>").trim();
									$coupon = $("<td>").html(cpName2);
								}else if(cpName.indexOf(",") < 0) {
									$coupon = $("<td>").html(cpName);
								}
							})
						}
						var $input = $("<input type='checkbox' class='check hidden'>");
						var $lasttd = $("<td>").append($input);
						
						$tr.append($mbno).append($mbname).append($mbbirth).append($mbtel).append($mbaddress).append($mbmileage).append($mbgrade).append($mbjoin).append($mbcount).append($coupon).append($lasttd);
						$("table").append($tr);
					})
				}
			})
			return false;
		})
		
		$(document).on("click","#addCoupon",function(){
			if($("#addCoupon").text() != "취소") {
				$("#couponForm").css("display", "inline-block");
				$("#deleteCoupon").css("display", "none");
				$("#addCoupon").text("취소");
				$("input[type='checkbox']").removeClass("hidden");
			}else {
				$("#couponForm").css("display", "none");
				$("#deleteCoupon").css("display", "inline-block");
				$("#addCoupon").text("쿠폰추가");
				$("input[type='checkbox']").addClass("hidden");
			}
		})
		
		$(document).on("click","#deleteCoupon",function(){
			if($("#deleteCoupon").text() != "취소") {
				$("#couponForm2").css("display", "inline-block");
				$("#addCoupon").css("display", "none");
				$("#deleteCoupon").text("취소");
				$("input[type='checkbox']").removeClass("hidden");
			}else {
				$("#couponForm2").css("display", "none");
				$("#addCoupon").css("display", "inline-block");
				$("#deleteCoupon").text("쿠폰삭제");
				$("input[type='checkbox']").addClass("hidden");
			}
		})
		
		$(document).on("click","#allcheck",function(){
			if( $("#allcheck").prop("checked") == true){
				$(".check").prop("checked", true);	
			}else{
				$(".check").prop("checked", false);	
			}
		})
		
		$("#couponForm").submit(function() {
			var noArray = new Array();
			for(var i=0; i<$(".check").length; i++) {
				if($(".check").eq(i).prop("checked") == true)	{
					noArray.push($(".check").eq(i).attr("data-no"));
				}
			}
			
			if(noArray.length == 0) {
				alert("쿠폰을 추가할 회원을 선택해주세요.");
				return false;
			}
			
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url:"${pageContext.request.contextPath}/mgn/memberMgnAddCoupon.do",
				type:"post",
				data:{"coupon":$("select[name='cp']").val(), "noArray":noArray},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					$("table").empty();
					$("table").append("<tr><th id='mNo'>회원번호</th><th id='mName'>회원명</th><th id='mBirth'>생년월일</th><th id='mTel'>전화번호</th><th id='mAddr'>주소</th><th id='mMileage'>마일리지</th><th id='mGrade'>등급</th><th id='mJoin'>가입일</th><th id='mCount'>주문횟수</th><th>쿠폰</th><th><input type='checkbox' id='allcheck' class='hidden'></th></tr>");
					
					$(res.content).each(function(i, obj) {
						var birth = new Date(obj.mbBirth);
						var join = new Date(obj.mbJoin);
						
						var $tr = $("<tr>");
						var $mbno = $("<td>").text(obj.mbNo);
						var $mbname = $("<td>").text(obj.mbName);
						var $mbbirth = $("<td>").text(birth.getFullYear()+"년"+("00" + (birth.getMonth() + 1)).slice(-2)+"월"+("00" + birth.getDate()).slice(-2)+"일");
						var $mbtel = $("<td>").text(obj.mbTel.substring(0, 3)+"-"+obj.mbTel.substring(3, 7)+"-"+obj.mbTel.substring(7, 11));
						var $mbaddress = $("<td>").text(obj.mbAddress);
						var $mbmileage = $("<td>").text(obj.mbMileage.toLocaleString()+"원");
						var $mbgrade = $("<td>").text(obj.mbGrade.grade);
						var $mbjoin = $("<td>").text(join.getFullYear()+"년"+("00" + (join.getMonth() + 1)).slice(-2)+"월"+("00" + join.getDate()).slice(-2)+"일");
						var $mbcount = $("<td>").text(obj.mbCount);
						var $coupon;
						if(obj.coupon.length == 0) {
							$coupon = $("<td>").text("");
						}else if(obj.coupon.length != 0) {
							$(obj.coupon).each(function(i, obj2) {
								var cpName = obj2.cpName.replace(",","<br>").trim();
								if(cpName.indexOf(",") >= 0) {
									var cpName2 = cpName.replace(",","<br>").trim();
									$coupon = $("<td>").html(cpName2);
								}else if(cpName.indexOf(",") < 0) {
									$coupon = $("<td>").html(cpName);
								}
							})
						}
						var $input = $("<input type='checkbox' class='check hidden' data-no='"+obj.mbNo+"'>");
						var $lasttd = $("<td>").append($input);

						$tr.append($mbno).append($mbname).append($mbbirth).append($mbtel).append($mbaddress).append($mbmileage).append($mbgrade).append($mbjoin).append($mbcount).append($coupon).append($lasttd);
						$("table").append($tr);
					})
					$("#couponForm").css("display", "none");
					$("#addCoupon").text("쿠폰추가");
					$("#deleteCoupon").css("display", "inline-block");
				}
			})	
			return false;	
		})
		
		$("#couponForm2").submit(function() {
			var noArray = new Array();
			for(var i=0; i<$(".check").length; i++) {
				if($(".check").eq(i).prop("checked") == true)	{
					noArray.push($(".check").eq(i).attr("data-no"));
				}
			}
			
			if(noArray.length == 0) {
				alert("쿠폰을 삭제할  회원을 선택해주세요.");
				return false;
			}
			
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url:"${pageContext.request.contextPath}/mgn/memberMgnDeleteCoupon.do",
				type:"post",
				data:{"coupon":$("select[name='cp2']").val(), "noArray":noArray},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					$("table").empty();
					$("table").append("<tr><th id='mNo'>회원번호</th><th id='mName'>회원명</th><th id='mBirth'>생년월일</th><th id='mTel'>전화번호</th><th id='mAddr'>주소</th><th id='mMileage'>마일리지</th><th id='mGrade'>등급</th><th id='mJoin'>가입일</th><th id='mCount'>주문횟수</th><th>쿠폰</th><th><input type='checkbox' id='allcheck' class='hidden'></th></tr>");
					
					$(res.content).each(function(i, obj) {
						var birth = new Date(obj.mbBirth);
						var join = new Date(obj.mbJoin);
						
						var $tr = $("<tr>");
						var $mbno = $("<td>").text(obj.mbNo);
						var $mbname = $("<td>").text(obj.mbName);
						var $mbbirth = $("<td>").text(birth.getFullYear()+"년"+("00" + (birth.getMonth() + 1)).slice(-2)+"월"+("00" + birth.getDate()).slice(-2)+"일");
						var $mbtel = $("<td>").text(obj.mbTel.substring(0, 3)+"-"+obj.mbTel.substring(3, 7)+"-"+obj.mbTel.substring(7, 11));
						var $mbaddress = $("<td>").text(obj.mbAddress);
						var $mbmileage = $("<td>").text(obj.mbMileage.toLocaleString()+"원");
						var $mbgrade = $("<td>").text(obj.mbGrade.grade);
						var $mbjoin = $("<td>").text(join.getFullYear()+"년"+("00" + (join.getMonth() + 1)).slice(-2)+"월"+("00" + join.getDate()).slice(-2)+"일");
						var $mbcount = $("<td>").text(obj.mbCount);
						var $coupon;
						if(obj.coupon.length == 0) {
							$coupon = $("<td>").text("");
						}else if(obj.coupon.length != 0) {
							$(obj.coupon).each(function(i, obj2) {
								var cpName = obj2.cpName.replace(",","<br>").trim();
								if(cpName.indexOf(",") >= 0) {
									var cpName2 = cpName.replace(",","<br>").trim();
									$coupon = $("<td>").html(cpName2);
								}else if(cpName.indexOf(",") < 0) {
									$coupon = $("<td>").html(cpName);
								}
							})
						}
						var $input = $("<input type='checkbox' class='check hidden' data-no='"+obj.mbNo+"'>");
						var $lasttd = $("<td>").append($input);

						$tr.append($mbno).append($mbname).append($mbbirth).append($mbtel).append($mbaddress).append($mbmileage).append($mbgrade).append($mbjoin).append($mbcount).append($coupon).append($lasttd);
						$("table").append($tr);
					})
					$("#couponForm2").css("display", "none");
					$("#deleteCoupon").text("쿠폰삭제");
					$("#addCoupon").css("display", "inline-block");
				}
			})	
			return false;	
		})
	})
</script>

	<div id="wrap">
		<div id="div"></div>
		<div id="memberList">
			<form action="${pageContext.request.contextPath}/mgn/memberMgnsearch.do" method="post" id="f2">
				<input type="text" name="tel" size="30" placeholder="검색할 전화번호">
				<input type="submit" value="검색">
			</form>
			<button id="allList">전체보기</button>
			<button id="deleteCoupon">쿠폰삭제</button>
			<button id="addCoupon">쿠폰추가</button>
			<form id="couponForm">
				<select name="cp">
					<option>생일쿠폰</option>
					<option>회원가입쿠폰</option>
					<option>서비스쿠폰</option>
				</select>
				<input type="submit" value="추가하기">
			</form>
			<form id="couponForm2">
				<select name="cp2">
					<option>생일쿠폰</option>
					<option>회원가입쿠폰</option>
					<option>서비스쿠폰</option>
				</select>
				<input type="submit" value="삭제하기">
			</form>
			<table>
				<tr>
					<th id="mNo">회원번호</th>
					<th id="mName">회원명</th>
					<th id="mBirth">생년월일</th>
					<th id="mTel">전화번호</th>
					<th id="mAddr">주소</th>
					<th id="mMileage">마일리지</th>
					<th id="mGrade">등급</th>
					<th id="mJoin">가입일</th>
					<th id="mCount">주문횟수</th>
					<th>쿠폰</th>
					<th><input type="checkbox" id="allcheck" class="hidden"></th>
				</tr>
				<c:forEach var="mlist" items="${memberPage.content}">
					<c:if test="${mlist.mbWithdrawal == false}">
						<tr class="underline">
							<td>${mlist.mbNo}</td>
							<td>${mlist.mbName}</td>
							<td><fmt:formatDate value="${mlist.mbBirth}" pattern="yyyy년MM월dd일"/></td>
							<td>${fn:substring(mlist.mbTel,0,3)}-${fn:substring(mlist.mbTel,3,7)}-${fn:substring(mlist.mbTel,7,11)}</td>
							<td>${mlist.mbAddress}</td>
							<td><fmt:formatNumber groupingUsed="true" value="${mlist.mbMileage}"/>원</td>
							<td>${mlist.mbGrade}</td>
							<td><fmt:formatDate value="${mlist.mbJoin}" pattern="yyyy년MM월dd일"/></td>
							<td>${mlist.mbCount}</td>
							<c:choose>
								<c:when test="${empty mlist.coupon}">
									<td></td>
								</c:when>
								<c:when test="${mlist.coupon != null}">
									<c:forEach var="cp" items="${mlist.coupon}">
										<td>${cp.cpName.replace(",","<br>").trim()}</td>
									</c:forEach>
								</c:when>
							</c:choose>
							<td><input type="checkbox" class="check hidden" data-no="${mlist.mbNo}"></td>
						</tr>
					</c:if>
					<c:if test="${mlist.mbWithdrawal != false}">
						<tr>
							<td>${mlist.mbNo}</td>
							<td>${mlist.mbName}</td>
							<td><fmt:formatDate value="${mlist.mbBirth}" pattern="yyyy년MM월dd일"/></td>
							<td>${fn:substring(mlist.mbTel,0,3)}-${fn:substring(mlist.mbTel,3,7)}-${fn:substring(mlist.mbTel,7,11)}</td>
							<td>${mlist.mbAddress}</td>
							<td><fmt:formatNumber groupingUsed="true" value="${mlist.mbMileage}"/>원</td>
							<td>${mlist.mbGrade}</td>
							<td><fmt:formatDate value="${mlist.mbJoin}" pattern="yyyy년MM월dd일"/></td>
							<td>${mlist.mbCount}</td>
							<c:choose>
								<c:when test="${empty mlist.coupon}">
									<td></td>
								</c:when>
								<c:when test="${mlist.coupon != null}">
									<c:forEach var="cp" items="${mlist.coupon}">
										<td>${cp.cpName.replace(",","<br>").trim()}</td>
									</c:forEach>
								</c:when>
							</c:choose>
							<td><input type="checkbox" class="check hidden" data-no="${mlist.mbNo}"></td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<div id="pagediv">
				<c:if test="${memberPage.startPage > 5}">
					<a href="${pageContext.request.contextPath}/mgn/menuMgnlist.do?page=${memberPage.startPage - 1}" class="pn">&lt;&lt;</a>
				</c:if>
				<c:forEach var="pNo" begin="${memberPage.startPage}" end="${memberPage.endPage}">
					<c:if test="${memberPage.currentPage == pNo}">
						<a href="${pageContext.request.contextPath}/mgn/menuMgnlist.do?page=${pNo}" class="current">${pNo}</a>
					</c:if>
					<c:if test="${memberPage.currentPage != pNo}">
						<a href="${pageContext.request.contextPath}/mgn/menuMgnlist.do?page=${pNo}">${pNo}</a>
					</c:if>
				</c:forEach>
				<c:if test="${memberPage.endPage < memberPage.totalPages}">
					<a href="${pageContext.request.contextPath}/mgn/menuMgnlist.do?page=${memberPage.endPage + 1}" class="pn">&gt;&gt;</a>
				</c:if>
			</div>
		</div>
	</div>

<%@ include file="../../view/include/footer.jsp" %>