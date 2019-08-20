<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ include file="../include/header.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/joinForm.css" type="text/css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

    $(function() {
      $("#menu_li").click(function() {
         $("#menulist").toggle();
      })
      
      $("form").submit(function() {
         $(".reg").css("display", "none");
         
         var reg_name = /^[가-힣]{2,5}$/;
         var reg_phone = /^(010|011|016|017|018)?[0-9]{3,4}?[0-9]{4}$/;
         var reg_birth = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
         
         if($("input[name='name']").val() == "" || reg_name.test($("input[name='name']").val()) == false) {
            $("input[name='name']").nextAll(".reg").css("display", "inline");
            return false;
         }
         
         if($("input[name='tel']").val() == "" || reg_phone.test($("input[name='tel']").val()) == false) {
            $("input[name='tel']").nextAll(".reg").css("display", "inline");
            return false;
         }
         
         if($("input[name='birth']").val() == "" || reg_birth.test($("input[name='birth']").val()) == false) {
            $("input[name='birth']").nextAll(".reg").css("display", "inline");
            return false;
         }
         
         if($("input[name='addr']").val() == "") {
            $("input[name='addr']").nextAll(".reg").css("display", "inline");
            return false;
         }
         
         var birth = new Date($("input[name='birth']").val()).getTime();
      	 var today = new Date().getTime();
      	 
      	 if(birth > today) {
      	 	 $("input[name='birth']").nextAll(".reg2").css("display", "inline");
				 return false;
       	 } 
      	
         $.ajax({
				url:"${pageContext.request.contextPath}/joinForm.do",
				type:"post",
				data:{"name":$("input[name='name']").val(), "tel":$("input[name='tel']").val(), "birth":$("input[name='birth']").val(), 
					"addr":$("input[name='addr']").val(), "addr2":$("input[name='addr2']").val(), "addr3":$("input[name='addr3']").val(), "addr4":$("input[name='addr4']").val()},
				dataType:"json",
				success: function(json) {
					console.log(json);
					
					if(json.joinSuccess == true) {
						alert("회원가입에 성공하였습니다. 로그인하세요.");
						location.href = "${pageContext.request.contextPath}/login.do";
					}else if (json.joinSuccess == false){
						alert("회원가입에 실패하였습니다. 다시 회원가입하세요.");
						location.href = "${pageContext.request.contextPath}/joinForm.do";
					}else if (json.transMem == true) {
						alert("회원전환에 성공하였습니다. 로그인하세요.");
						location.href = "${pageContext.request.contextPath}/login.do";
					}
				}
			})
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
   <div class="sub">
      <div class="s_visu1">
         <img id="s_visu1_1" src="${pageContext.request.contextPath}/images/login/sub03_visu.jpg">
		 <img id="s_visu1_2" src="${pageContext.request.contextPath}/images/login/s_visu3.jpg">
      </div>
      <div class="content">
         <div id="menu_li2">
            <ul>
               <li>HOME</li>
               <li>></li>
               <li>MEMBER</li>
               <li>></li>
               <li><b>회원가입</b></li>
            </ul>
         </div>
         <div class="clear"></div>
         <div id="joinForm_content">
            <p>회원가입</p>
            <form action="${pageContext.request.contextPath}/joinForm.do" method="post">
               <div class="jf_div1"><b>개인 정보</b></div>
               <div class="jf_div2">
                  <span class="span1">이름</span>
                  <span>
                     <input type="text" size="30" name="name" autofocus placeholder="공백없이 한글만 입력하세요">
                     <span class="reg">※ 한글만 입력하세요</span>
                  </span>
               </div>
               <div class="jf_div2">
                  <span class="span1">전화번호</span>
                  <span>
                     <input type="text" size="30" name="tel" placeholder="숫자만 입력하세요(-생략)">
                     <span class="reg">※ 숫자만 입력하세요</span>
                  </span>
               </div>
               <div class="jf_div2">
                  <span class="span1">생년월일</span>
                  <span>
                     <input type="text" name="birth" class="date" autocomplete="off" size="30">
                     <span class="reg">※ 생년월일을 입력하세요</span>
                     <span class="reg2">※ 생년월일을 다시 입력하세요</span>
                  </span>
               </div>
               <div class="jf_div2">
               		<span class="span1a">주소</span>
               		<span class="daum_addr">
	                  	<input type="text" id="sample4_postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="addr">
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="addr2">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="addr3">
						<input type="text" id="sample4_extraAddress" placeholder="참고항목" name="addr4">
						<!-- <br>
						<input type="text" name="addr" size="80"> -->
					</span>
					<span class="reg">주소를 입력하세요</span>
               </div>
               <div class="jf_div2">
                  <span class="span1">문자서비스</span>
                  <span class="joincheck"><input type="checkbox" checked> 문자서비스를 받겠습니다.</span>
               </div>
               <div class="jf_div2">
                  <span class="span1">정보공개</span>
                  <span class="joincheck"><input type="checkbox" checked> 나의 정보를 볼 수 있도록 합니다.</span>
               </div>
               <div class="jf_div3">
                  <input type="submit" value="확 인">
               </div>
            </form>
         </div>
      </div>
   </div>

<%@ include file="../include/footer.jsp" %>