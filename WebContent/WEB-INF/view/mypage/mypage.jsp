<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/mypage.jsp" %>
<style>
	form {
		
	}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	$(function() {
		$("#updateBtn").click(function() {
			/* $.ajax({
				url:"${pageContext.request.contextPath}/my/mypage.do",
				type:"post",
				data:{"fNo":fNo},
				dataType:"json",
				success: function(json) {
					console.log(json);
					
					if(json.success == true) {
						$btn.closest("tr").removeClass("underline");
						$btn.text("삭제");
					}
				}
			}) */
			return false;
		})
		
		$(".date").datepicker({
			dateFormat: 'yy-mm-dd',
			changeYear: true,
			changeMonth: true,
			yearRange: "-100:+0"
		});
		
		/* var b = new Date($("input[name='birth']").val());      
		var birth = b.getFullYear() + "-" + (b.getMonth()+1) + "-" + b.getDate();
		alert(birth);
		$(".date").datepicker('setDate', birth); */
	})
</script>
	<div id="mypage_content">
		<form action="${pageContext.request.contextPath}/my/mypage.do" method="post">
			<p>
				<span>이름</span>
				<input type="text" name="name" value="${member.mbName}">
			</p>
			<p>
				<span>생년월일</span>
				<input type="text" name="birth" value="${member.mbBirth}" class="date">
			</p>
			<p>
				<span>전화번호</span>
				<input type="text" name="name" value="${member.mbTel}">
			</p>
			<p>
				<span>주소</span>
				<span>${member.mbAddress}</span>
			</p>
			<p>
				<button id="updateBtn">수정</button>
			</p>
		</form>
	</div>

<%@ include file="../include/footer.jsp" %>