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
	}
	#menulist li:hover {
	   background-color: #887c75;
	}
	#menulist li:hover a {
	   color: white;
	}
	#menulist li a {
	   color: black;
	   padding: 10px;
	}
	#menulist li:last-child {
	   border-bottom: 1px solid #887c75;
	}
		
		
	#joinForm_content > p {
	   padding: 20px 0 30px;
	   text-align: center;
	   font-size: 32px;
	   line-height: 32px;
	   color: #55423b;
	   font-weight: bolder;
	   letter-spacing: -0.1em;
	   font-family: "굴림";
	}
	.jf_div1 {
	   padding: 10px 0;
	   border-bottom: 3px solid #555555;
	   margin-top: 20px;
	}
	.jf_div2 {
	   border-bottom: 2px solid #c7a593;
	   overflow: hidden;
	}
	.jf_div3 {
	   text-align: center;
	   padding: 20px 0 60px;
	   border-top: 2px solid #555555;
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
	.daum_addr {
		display: inline-block;
		height: 60px;
		float: left;
		margin: 10px 0 10px 5px;
	}
	input[type="submit"] {
	   background-color: #3f87dc;
	   border: 1px solid #3f87dc;
	   color: white;
	   padding: 10px 50px;
	   border-radius: 5px;
	   cursor: pointer;
	   font-size: 17px;
	}
	input[type="button"] {
		margin-bottom: 5px;
		padding: 2px 10px;
		background-color: #555555;
		border: 1px solid #555555;
		color: white;
		border-radius: 3px;
	 	margin-top: 3px;
	}
	input[type="text"], input[type="date"], input[type="password"] {
	   padding: 3px;
	}
	input[name="addr"] {
		margin-top: 5px;
	}
	.reg {
	   color: red;
	   font-size: 0.8em;
	   display: none;
	}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
      })
		
   })
</script>
   <div class="sub">
      <div class="s_visu1">
         <img src="${pageContext.request.contextPath}/images/login/sub03_visu.jpg">
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
                     <input type="date" name="birth">
                     <span class="reg">※ 생년월일을 입력하세요</span>
                  </span>
               </div>
               <div class="jf_div2">
               		<span class="span1a">주소</span>
               		<span class="daum_addr">
	                  	<input type="text" id="sample4_postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="addr">
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소">
						<input type="text" id="sample4_extraAddress" placeholder="참고항목">
						<!-- <br>
						<input type="text" name="addr" size="80"> -->
					</span>
               </div>
               <div class="jf_div2">
                  <span class="span1">문자서비스</span>
                  <span><input type="checkbox" checked> 문자서비스를 받겠습니다.</span>
               </div>
               <div class="jf_div2">
                  <span class="span1">정보공개</span>
                  <span><input type="checkbox" checked> 나의 정보를 볼 수 있도록 합니다.</span>
               </div>
               <div class="jf_div3">
                  <input type="submit" value="확 인">
               </div>
            </form>
         </div>
      </div>
   </div>

<%@ include file="../include/footer.jsp" %>