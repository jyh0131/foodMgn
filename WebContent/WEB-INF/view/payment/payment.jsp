<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("utf-8"); %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pay.css" type="text/css">
<script>
	$(function() {
		var t = ${totalPrice};
		//할인정보 라디오박스 선택시
		$("input[name='sale']").change(function() {
			
			if($(this).val()=="등급할인"){
				$("#sale_detail_1").css("display","block");
				$("#sale_detail_2").css("display","none");
				$("#sale_detail_3").css("display","none");
				$("#grade_info_get").text( "${mem.mbGrade}" + "(" + ${mem.mbGrade.gDiscount} +"%)");
				
				$("#sale_info_get").text("등급할인:"+$("#grade_info_get").text());
				var totalP= ${totalPrice }*(${mem.mbGrade.gDiscount}/100);
				$("#sale_price_get").text( totalP );
				$("#pay_price_get").text(  (t-totalP).toLocaleString()  );
			}else if($(this).val()=="쿠폰"){
				$("#sel").eq(0).prop("selected", true);
				$("#sale_detail_1").css("display","none");
				$("#sale_detail_2").css("display","block");
				$("#sale_detail_3").css("display","none");
				$("#sale_info_get").text("");
				$("#sale_price_get").text("");
				$("#coupon_info_get").text("");
				
				$("#pay_price_get").text(t.toLocaleString());
				
			}else if($(this).val()=="마일리지"){
				$("#pay_price_get").text(t.toLocaleString());
				$("#sale_detail_1").css("display","none");
				$("#sale_detail_2").css("display","none");
				$("#sale_detail_3").css("display","block");
				$("#sale_price_get").text("");
				$("#sale_info_get").text("");
				$("#total_mileage").text(${mem.mbMileage}) //사용가능한 마일리지
				 $("#mileage_info_get").val("");
			}else if($(this).val()=="사용안함"){
				$("#sale_detail_1").css("display","none");
				$("#sale_detail_2").css("display","none");
				$("#sale_detail_3").css("display","none");
				$("#sale_info_get").text("");
				var totalP2= ${totalPrice };
				$("#pay_price_get").text(totalP2.toLocaleString());
				$("#sale_price_get").text("");
			}
		})
		
		//쿠폰선택시
		$("#sel").change(function() {
			var sel_coupon = $(this).val();
			
			if(sel_coupon=="a"){
				$("#sale_info_get").text("");
				$("#coupon_info_get").text("");
				$("#sale_price_get").text("");
				$("#pay_price_get").text(t.toLocaleString());
			}else{
				$("#coupon_info_get").text(sel_coupon);
				$("#sale_info_get").text("쿠폰:"+sel_coupon);
				var a = sel_coupon.indexOf("(");
				var b = sel_coupon.indexOf("%");
				var sel_dis =Number( sel_coupon.substring(a+1, b) );
				var totalP4= ${totalPrice}*(sel_dis/100);
				 
				$("#sale_price_get").text(totalP4.toLocaleString());
				$("#pay_price_get").text( (t-totalP4).toLocaleString() );
			}
			
		})
		
		//마일리지 엔터시
		$("#mileage_info_get").keydown(function(key) {
			if (key.keyCode == 13) {
				var useMileage = $("#mileage_info_get").val();
				if(useMileage > ${mem.mbMileage} ){
					alert("사용가능한 마일리지는 ${mem.mbMileage}원 입니다");
					$("#mileage_info_get").val("");
				}else{
					$("#sale_info_get").text("마일리지:"+useMileage.toLocaleString()+"원");
					$("#sale_price_get").text(useMileage.toLocaleString());
					var totalP3= ${ totalPrice }-useMileage;
					$("#pay_price_get").text( totalP3.toLocaleString()  );
				}
				
			}
		
		});


		
		//결제버튼 클릭시
		
		$("#pay_button").click(function() {
			var sale_info =$("#sale_info_get").text();
			$("#payForm").append("<input type='hidden' value='"+sale_info+"' name='sale_info'>");
			var sale_price =$("#sale_price_get").text();
			$("#payForm").append("<input type='hidden' value='"+sale_price+"'  name='sale_price'>");
			var sale_type = $("input[name='pay']:checked").val();			
			$("#payForm").append("<input type='hidden' value='"+sale_type+"'  name='sale_type'>");
			//location.href="${pageContext.request.contextPath}/paymentResult.do?sale_info="+sale_info+"&sale_price="+sale_price+"&sale_type="+sale_type;
			alert("결제가 완료되었습니다");
			$("#payForm").submit();
			
		})
		
		
		
		
	})
</script>
<div class="s_visu1">
	<img src="${pageContext.request.contextPath}/images/introduce/sub01_visu.jpg">
</div>
<div id="wrap">
	<div id="pay_title">
		<h2 class="brown_1">주문/결제</h2>
	</div>
	<div id="pay_1">
		<div id="order_info">	
		<h3 class="brown_1">주문정보</h3>
			<table>
				<tr>
					<th>제품사진</th>
					<th>제품명</th>
					<th>수량</th>
					<th>가격</th>
				</tr>
	
		<c:forEach var="list" items="${list }">
			<tr>
				<td><img class="foodImg" src="${pageContext.request.contextPath}/images/food/${list.fdNo.fdName }.png"></td>
				<td>${list.fdNo.fdName }</td>
				<td>${list.saleOrderCnt }</td>
				<td><fmt:formatNumber value="${list.fdNo.fdPrice*list.saleOrderCnt }"/>  원</td>
			</tr>
		</c:forEach>
			</table>
		</div>
		
		<div id="sale_info">
			<h3 class="brown_1">할인 및 마일리지</h3>
			<input type="radio" name="sale" value="등급할인">등급할인 
			<input type="radio" name="sale" value="쿠폰">쿠폰
			<input type="radio" name="sale" value="마일리지">마일리지 
			<input type="radio" name="sale" value="사용안함" checked="checked">사용안함 
			<br><br>
			<div id="sale_detail_1">
				<p class="font_1">등급정보 : <span class="font_2" id="grade_info_get"><!-- VIP(15%) --></span></p>
			</div>
			<div id="sale_detail_2">
				<p id="coupon_p" class="font_1">쿠폰 : 
				<select id="sel" name="coupon">
					<option value="a">쿠폰을 선택하세요</option>
					<c:if test="${couponList!=null }">
						<c:forEach var="coupon" items="${couponList }">
							<option value="${coupon.cpName }(${coupon.cpDiscount}%)" data-r="${coupon.cpDiscount}">${coupon.cpName}(<span class="cpdiscount">${coupon.cpDiscount }</span>%)</option>
							
						</c:forEach>
					</c:if>
				</select>
				
				</p>
				<p class="font_1">적용한 쿠폰 : <span class="font_2" id="coupon_info_get"></span></p>
			</div>
			<div id="sale_detail_3">
				<p class="font_1">사용가능한 마일리지 : <span class="font_3" id="total_mileage"></span>원</p>
				<br><br>
				<p class="font_1">사용할 마일리지 : <input type="text" id="mileage_info_get">원 </p>
			</div>
		</div>
		
		<div id="pay_info">
			<h3 class="brown_1">결제 수단</h3>
			<input type="radio" name="pay" value="1" checked="checked">현금 
			<input type="radio" name="pay" value="0">카드
			
		</div>
	</div>
	
	<div id="pay_2">
		<div id="buyer_info">
			<h3 class="brown_1">주문자 정보</h3>
			<p class="font_1">이름 : <span class="font_5">${mem.mbName }</span></p><br>
			<p class="font_1">전화번호 : <span class="font_5">${mem.mbTel }</span></p><br>
			<p class="font_1">주소 : <span class="font_5">${mem.mbAddress }</span></p><br>
		</div>
		
		<div id="pay_price">
			<h3 class="brown_1">결제 정보</h3>
			<p class="font_1">총 상품 금액 : <span class="font_5"><span><fmt:formatNumber>${totalPrice }</fmt:formatNumber></span>원</span></p><br>
			<p class="font_1">할인 금액 : <span class="font_5"><span id="sale_price_get"></span>원</span></p><br>  
			<p class="font_1">할인 정보 : <span class="font_5"><span id="sale_info_get"></span></span></p><br>
			<p class="font_4">결제 금액  : <span class="font_5"><span id="pay_price_get"><fmt:formatNumber>${totalPrice }</fmt:formatNumber></span>원</span></p><br>
			
			
		</div>
		<div id="pay_button_wrap">
			<button id="pay_button">결제 하기</button>
		</div>
	</div>
	
	<div id="pay">
	
	</div>
	<form id="payForm" action="paymentResult.do" method="post">
	</form>
</div>

<%@ include file="../include/footer.jsp"%>
