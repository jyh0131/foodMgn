<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<style>
@media screen and (min-width:768px){
	body{
		background: #f7f7f7;
	}
	#rsvContainer{
		width:1000px;
		margin: 0 auto;
		
	}
	.s_visu1 {
		width: 100%;
		height: 350px;
	}
	
	.s_visu1 img{
		width: 100%;
		height: 350px;
	}
	h1{
		margin-bottom:20px;
		margin-top:20px;
	}
	#rsvInnerContainer{
		padding:30px;
		background: white;
	}
	#rsvGuide{
		background: #f7f7f7;
		font-size: 17px;
		font-family: "나눔고딕",NanumGothic,ng,"맑은 고딕","Malgun Gothic",sans-serif;
		font-weight: 600;
		padding:15px;
	}
	#rsvGuide p{
		margin:10px 10px;
	}
	.navy{
		color:#120267;
	}
	#rsvTable{
		border-collapse: collapse;
		width:950px;
		height:200px;
		margin-bottom:20px;
		border-top:2px solid #606060;
	}
	#rsvTable tr, #rsvTable td{
		border:1px solid #dedede;
	}
	#rsvTable td{
		height:65px;
	}
	h3{
		margin:20px 0;
	}
	.gray{
		width:130px;
		background:#f7f7f7;
		padding: 5px 30px;
		font-weight: bold;
	}
	input{
		margin:0 10px;
		height:30px;
		background: #f9f9f9;
	}
	select{
		margin:0 10px;
		height:30px;
		width:80px;
	}
	select[name='tableNo']{
		width:150px;
	}
	input[type="submit"],input[type="reset"]{
		width: 100px;
		height:50px;
	}
	#confirm{
		text-align: center;
	}
	#topImg {
		display: none;
	}
}
	
	
@media all and (max-width:767px){
	body {
		background-color: #e8e2dc;
	}
	header {
		background-color: white;
	}
	#rsvContainer{
		width:100%;
		margin: 0 auto;
		
	}
	.s_visu1 {
		width: 100%;
	}
	
	.s_visu1 img{
		width: 100%;
	}
	h1{
		margin-bottom:20px;
		margin-top:20px;
		text-align: center;
		color: #55423b;
	}
	h3 {
		color: #55423b;
	}
	#rsvInnerContainer{
		padding:20px;
		background: #e8e2dc;
	}
	#rsvGuide{
		background: #f7f7f7;
		font-size: 13px;
		font-family: "나눔고딕",NanumGothic,ng,"맑은 고딕","Malgun Gothic",sans-serif;
		font-weight: 600;
		padding:15px;
		margin-bottom:20px;
	}
	#rsvGuide p{
		margin:10px 10px;
		line-height: 20px;
	}
	.navy{
		color:#120267;
	}
	#rsvTable{
		border-collapse: collapse;
		width:100%;
		height:200px;
		margin-bottom:20px;
		border-top:2px solid #606060;
	}
	#rsvTable tr, #rsvTable td{
		border:1px solid #dedede;
	}
	#rsvTable td{
		height:65px;
	}
	h3{
		margin-bottom:20px;
	}
	.gray{
		width:35%;
		background:#f7f7f7;
		font-weight: bold;
		text-align: center;
	}
	td {
		background: #FCFCFC;
	}
	input{
		margin:0 10px;
		padding-left:3px;
		height:30px;
		background: #f9f9f9;
	}
	select{
		margin:0 10px;
		height:30px;
		width:80px;
	}
	select[name='tableNo']{
		width:150px;
	}
	select[name='hour']{
		width:50px;
	}
	select[name='minutes']{
		width:50px;
	}
	input[type="submit"],input[type="reset"]{
		width: 100px;
		height:50px;
		background-color: #3b2c2c;
		border: 1px solid #3b2c2c;
		color: white;
	}
	#confirm{
		text-align: center;
	}
	
	.tel{
		width:40px;
		margin:0 5px !important;
	}
	input[name="first"]{
		margin-left:10px !important;
	}
	input[name="number"]{
		width:150px;
		text-align: right;
	}
	#topImg {
		position: fixed;
		top: 630px;
		right: 15px;
	}
	#topImg img {
		width: 38px;
		height: 38px;
		background-color: rgba(0,0,0,0.4);
		border-radius: 50%;
	}
}
</style>
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<script src="js/jquery-ui.js"></script>

<script>
	$(function(){
		$(".datepicker").datepicker();
		
		
		
		$("form").submit(function(){
			if( Number($("input[name='number']").val())>9 ){
				alert("10인 이상 예약은 전화로 문의 부탁드립니다.");
				return false;
			}
			if($("input[name='name']").val()=="" ||$("input[name='first']").val()=="" ||$("input[name='second']").val()=="" ||$("input[name='third']").val()=="" ||$("input[name='date']").val()=="" || $("input[name='number']").val()==""){
				alert("빈 칸 없이 모두 입력하셔야 합니다.");
				return false;
			}
			
		})
		
	})
</script>

<div class="s_visu1">
			<img src="${pageContext.request.contextPath}/images/main/f_visu7.jpg">
</div>
<div id="rsvContainer">
	<h1>온라인예약</h1>
	<div id="rsvInnerContainer">
		<h3>온라인 예약 안내</h3>
		<div id="rsvGuide">
			<p>1. 매장 영업 시간은 11시30분 - 22시 입니다. <span class="navy">12시 00분부터 예약 가능</span>합니다.</p>
			<p>2. 테이블 선택 시 <span class="navy">1~4번은 2~3인석, 5~6번은 4~5인석, 7번은 9인이하 단체석</span> 입니다.
			<p>3. 10명 이상 <span class="navy">단체예약 혹은 룸 예약은 전화로 문의</span> 부탁드립니다.</p>
			<p>4. 예약 접수 시 <span class="navy">확정문자 메세지 혹은 직원과의 유선전화 후 최종 확정</span>이 됩니다.<br>
				유선전화는 예약에 문제가 있을 시 고객님께 직원이 먼저 전화드립니다.
			</p>
			<p>5. 연말연시 및 주말, 공휴일은 식사시간이 2시간으로 제한됩니다.</p>
			<p>6. 연락처는 11자리 모두 작성해주셔야 확정문자 메세지가 발송됩니다.</p>
			<p>7. 예약변동 사항은 전화로 문의주시기 바랍니다.</p>
		</div>
		<h3>온라인 예약하기</h3>
		<form action="reservation.do" method="post">
			<table id="rsvTable">
				<tr>
					<td class="gray">이름</td>
					<td><input type="text" name="name"value=${member.mbName }></td>
				</tr>
				<tr>
					<td class="gray">테이블 번호</td>
					<td>
						<select name="tableNo">
							<option>1번 (2~3인석)</option>
							<option>2번 (2~3인석)</option>
							<option>3번 (2~3인석)</option>
							<option>4번 (2~3인석)</option>
							<option>5번 (4~5인석)</option>
							<option>6번 (4~5인석)</option>
							<option>7번 (9인이하단체)</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="gray">연락처</td>
					<td colspan="3">
						<input type="text" name="first" class="tel" value=${fn:substring(member.mbTel,0,3) }>-<input type="text" name="second" class="tel" value=${fn:substring(member.mbTel,3,7) }>-<input type="text" name="third" class="tel" value=${fn:substring(member.mbTel,7,11) }>
					</td>
				</tr>
				<tr>
					<td class="gray">날짜</td>
					<td colspan="3"><input type="text" name="date" class="datepicker" autocomplete="off"></td>
				</tr>
				<tr>
					<td class="gray">시간</td>
					<td colspan="3">
						<select name="hour">
							<option>12</option>
							<option>13</option>
							<option>14</option>
							<option>15</option>
							<option>16</option>
							<option>17</option>
							<option>18</option>
							<option>19</option>
							<option>20</option>
							<option>21</option>
						</select>시
						<select name="minutes">
							<option>00</option>
							<option>30</option>
						</select>분
					</td>
				</tr>
				<tr>
					<td class="gray">인원</td>
					<td colspan="3"><input type="text" name="number">명</td>
				</tr>
			</table>
			<div id="confirm">
				<input type="submit" value="확인"> <input type="reset" value="취소">
			</div>
			<input type="hidden" name="isLogin" value=${isLogin }>
		</form>
		<div id="topImg">
			<a href="#"><img src="${pageContext.request.contextPath}/images/up-arrow-icon.png"></a>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>


