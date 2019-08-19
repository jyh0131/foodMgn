<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/mypage.jsp" %>

<style>
	#mypage_content {
		float: left;
		margin-top: 80px;
		margin-left: 100px;
		width: 1000px;
	}
	#f1 {
		width: 1000px;
	}
	#mypage_content p {
		border-bottom: 1px solid #c7a593;
		overflow: hidden;
	}
	#mypage_content p:first-child {
	   padding: 10px 0;
	   border-bottom: 1px solid #555;
	}
	#mypage_content p:nth-child(2) {
		border-top: 1px solid #c7a593;
	}
	#mypage_content p:last-child {
		border-bottom: none;
		text-align: center;
		padding-top: 20px;
		border-top: 1px solid #555;
	}
	.span1 {
	   background-color: #F7F7F7;
	   display: inline-block;
	   padding: 10px 15px;
	   width: 145px;
	   margin-right: 10px;
	}
	.span1a {
		background-color: #F7F7F7;
		display: inline-block;
		padding: 0 15px;
		height: 80px;
		width: 145px;
		margin-right: 10px;
		float: left;
		line-height: 80px;
	}
	.addr {
		height: 80px;
		line-height: 80px;
	}
	.daum_addr {
		display: inline-block;
		height: 60px;
		float: left;
		margin: 10px 0 10px 5px;
	}
	input[type="text"], input[type="password"] {
	   padding: 3px;
	}
	input[name="addr"] {
		margin-top: 5px;
	}
	input[type="submit"] {
		background-color: #c7a593;
		border: 1px solid #c7a593;
		color: white;
		padding: 10px 50px;
		border-radius: 5px;
		cursor: pointer;
	}
	.reg {
	   color: red;
	   font-size: 0.8em;
	   display: none;
	}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	function sample4_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample4_postcode').value = data.zonecode;
	            document.getElementById("sample4_roadAddress").value = roadAddr;
	            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	            
	            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	            if(roadAddr !== ''){
	                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	            } else {
	                document.getElementById("sample4_extraAddress").value = '';
	            }
	
	            var guideTextBox = document.getElementById("guide");
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            if(data.autoRoadAddress) {
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                guideTextBox.style.display = 'block';
	
	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                guideTextBox.style.display = 'block';
	            } /* else {
	                guideTextBox.innerHTML = '';
	                guideTextBox.style.display = 'none';
	            }
 */	        }
	    }).open();
	}
	
	$(function() {
		$("#f1").submit(function() {
			var $ninput = $("<input type='text' name='name' value='${member.mbName}'>");
			var $binput = $("<input type='text' name='birth' value='<fmt:formatDate pattern='yyyy-MM-dd' value='${member.mbBirth}'/>'>");
			var $tinput = $("<input type='text' name='tel' value='${member.mbTel}'>");
			var $ainput = $("<span class='daum_addr'>");
			
			var $input1 = $("<input type='text' id='sample4_postcode' placeholder='우편번호'>");
			var $input2 = $("<input type='button' onclick='sample4_execDaumPostcode()' value='우편번호 찾기'><br>");
			var $input3 = $("<input type='text' id='sample4_roadAddress' placeholder='도로명주소' name='addr'>");
			var $input4 = $("<input type='text' id='sample4_jibunAddress' placeholder='지번주소' name='addr2'>");
			var $input5 = $("<input type='text' id='sample4_detailAddress' placeholder='상세주소' name='addr3'>");
			var $input6 = $("<input type='text' id='sample4_extraAddress' placeholder='참고항목' name='addr4'>");
			
			$ainput.append($input1).append($input2).append($input3).append($input4).append($input5).append($input6);
			
			if($("input[type='submit']").val()=="수정") {
				$("input[type='submit']").val("완료");
				
				$(".name").empty();
				$(".name").append($ninput);
				$(".birth").empty();
				$(".birth").append($binput);
				$(".tel").empty();
				$(".tel").append($tinput);
				$(".addr").empty();
				$(".addr").css("line-height", 0);
				$(".addr").append($ainput);
			}else {
				var reg_name = /^[가-힣]{2,5}$/;
		        var reg_phone = /^(010|011|016|017|018)?[0-9]{3,4}?[0-9]{4}$/;
		         
		        if($("input[name='name']").val() == "" || reg_name.test($("input[name='name']").val()) == false) {
		           $("input[name='name']").nextAll(".reg").css("display", "inline");
		           return false;
		        }
		         
		        if($("input[name='tel']").val() == "" || reg_phone.test($("input[name='tel']").val()) == false) {
		           $("input[name='tel']").nextAll(".reg").css("display", "inline");
		           return false;
	            }
		         
	            if($("input[name='addr']").val() == "") {
	               $("input[name='addr']").nextAll(".reg").css("display", "inline");
	               return false;
	            }
		         
				$.ajax({
		            url:"${pageContext.request.contextPath}/my/mypage.do",
		            type:"post",
		            data:{"name":$("input[name='name']").val(), "tel":$("input[name='tel']").val(), "birth":$("input[name='birth']").val(), 
						"addr":$("input[name='addr']").val(), "addr2":$("input[name='addr2']").val(), "addr3":$("input[name='addr3']").val(), "addr4":$("input[name='addr4']").val()},
		            dataType:"json",
		            success: function(res) {
		               console.log(res);
		               
		               if(res.success == true) {
		            	   $(".name").empty();
		            	   $(".birth").empty();
		            	   $(".tel").empty();
		            	   $(".addr").empty();
		            	   
		            	   var birth = new Date(res.birth);
		            	   
		            	   $(".name").text(res.name);
		            	   $(".birth").text(birth.getFullYear()+"년 "+("00" + (birth.getMonth() + 1)).slice(-2)+"월 "+birth.getDate()+"일");
		            	   $(".tel").text(res.tel);
		            	   $(".addr").css("line-height", "80px");
		            	   $(".addr").text(res.addr);
		               }
		            }
		         })
		         
		         $("input[type='submit']").val("수정");
			}
			return false;
		})
		
		$(".date").datepicker({
			dateFormat: 'yy-mm-dd',
			changeYear: true,
			changeMonth: true,
			yearRange: "-100:+0"
		});
	})
</script>
	<div id="mypage_content">
		<form action="${pageContext.request.contextPath}/my/mypage.do" method="post" id="f1">
			<p><b>개인 정보 수정</b></p>
			<p>
				<span class="span1">이름</span>
				<span class="name">${member.mbName}</span>
				<span class="reg">※ 한글만 입력하세요</span>
			</p>
			<p>
				<span class="span1">생년월일</span>
				<span class="birth"><fmt:formatDate pattern='yyyy년 MM월 dd일' value='${member.mbBirth}'/></span>
			</p>
			<p>
				<span class="span1">전화번호</span>
				<span class="tel">${member.mbTel}</span>
				<span class="reg">※ 숫자만 입력하세요</span>
			</p>
			<p>
				<span class="span1a">주소</span>
				<span class="addr">${member.mbAddress}</span>
				<span class="reg">주소를 입력하세요</span>
			</p>
			<p>
				<input type="submit" value="수정">
			</p>
		</form>
	</div>

<%@ include file="../include/footer.jsp" %>