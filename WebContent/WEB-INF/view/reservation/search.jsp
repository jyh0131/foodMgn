<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
@media screen and (min-width:768px){
	body{
		background: #f7f7f7;
	}
	#searchContainer{
		width:1000px;
		margin: 40px auto;
		
	}
	.s_visu1 {
		width: 100%;
		height: 350px;
	}
	
	.s_visu1 img{
		width: 100%;
		height: 350px;
	}
	#searchInnerContainer{
		padding:30px;
		background: white;
	}
	h1{
		margin-bottom:20px;
		margin-top:20px;
	}
	h3{
		margin-bottom:20px;
	}
	#rsvTable{
		border-collapse: collapse;
		width:950px;
		height:100px;
		margin-bottom:20px;
		border-top:2px solid #606060;
	}
	#rsvTable tr, #rsvTable td{
		border:1px solid #dedede;
	}
	#rsvTable td{
		height:35px;
	}
	.gray{
		width:100px;
		background:#f7f7f7;
		padding: 5px 30px;
		font-weight: bold;
	}
	.tel, #name{
		width:110px;
		height:25px;
		margin:0 10px;
	}
	#search{
		display: block;
		width:110px;
		height:25px;
		margin:0 auto;
	}
	#result{
		border-collapse: collapse;
		width:950px;
		margin-bottom:20px;
		border-top:2px solid #606060;
	}
	#result tr, #result td{
		border:1px solid #dedede;
	}
	#result td{
	 	height:35px;
	 	line-height: 35px;
	 }
	.rsvTime, .tableNo, .number{
		width:100px;
		font-weight: bold;
		background:#f7f7f7;
		padding: 5px 28px;
	}
	.date{
		width:300px;
		text-align: center;
	}
	.no{
		width:190px;
		text-align: center;
	}
	.rsvNumber{
		width:50px;
		text-align: center;
	}
}

@media all and (max-width:767px){
	body{
		background: #f7f7f7;
	}
	#searchContainer{
		width:100%;
		margin: 0 auto;
		
	}
	.s_visu1 {
		width: 100%;
		height: 250px;
	}
	
	.s_visu1 img{
		width: 100%;
		height: 250px;
	}
	h1{
		margin-bottom:20px;
		margin-top:20px;
		text-align: center;
	}
	#searchInnerContainer{
		padding:20px;
		background: white;
	}
	
	
	table{
		font-size: 12px;
		text-align: center;
	}
	
	
	h3{
		margin-bottom:20px;
	}
	#rsvTable{
		border-collapse: collapse;
		width:100%;
		height:100px;
		margin-bottom:20px;
		border-top:2px solid #606060;
	}
	#rsvTable tr, #rsvTable td{
		border:1px solid #dedede;
	}
	#rsvTable td{
		height:35px;
	}
	.gray{
		width:50px;
		background:#f7f7f7;
		font-weight: bold;
		text-align: center;
	}
	.tel, #name{
		width:80px;
		height:25px;
		margin:5px 10px;
		text-align: center;
	}
	#search{
		display: block;
		width:110px;
		height:25px;
		margin:0 auto;
	}
	#result{
		border-collapse: collapse;
		width:100%;
		margin-bottom:20px;
		border-top:2px solid #606060;
	}
	#result tr, #result td{
		border:1px solid #dedede;
	}
	#result td{
	 	height:35px;
	 	line-height: 35px;
	 }
	.rsvTime, .tableNo, .number{
		width:70px;
		font-weight: bold;
		background:#f7f7f7;
		
	}
	.date{
		width:200px;
		text-align: center;
	}
	.no{
		width:120px;
		text-align: center;
	}
	.rsvNumber{
		width:50px;
		text-align: center;
	}

}
	
	
</style>
<script>
	$(function(){
		$("#search").click(function(){
			var name = $("#name").val();
			var tel = $("input[name='first']").val()+$("input[name='second']").val()+$("input[name='third']").val();
			$.ajax({
				url : "${pageContext.request.contextPath }/search.do",
				type : "post",
				data : {"name":name, "tel":tel},
				dataType: "json",
				success : function(json){
					console.log(json);
					if(json==false){
						$("#result").remove();
						alert("예약된 정보가 없습니다.");
					}else{
						$("#result").remove();
						$("#searchInnerContainer").append("<table id='result'>");
						for(var i=0; i<json.length; i++){
							var date = new Date(json[i].rsvTime);
							var dateFormat = date.getFullYear()+"년 "+(date.getMonth()+1)+"월 "+date.getDate()+"일 <br>"+date.getHours()+"시 "+date.getMinutes()+"분";
							var table = "";
							if(json[i].rsvTableNo=="no.1"){
								table="1번 테이블";
							}
							if(json[i].rsvTableNo=="no.2"){
								table="2번 테이블";
							}
							if(json[i].rsvTableNo=="no.3"){
								table="3번 테이블";
							}
							if(json[i].rsvTableNo=="no.4"){
								table="4번 테이블";
							}
							if(json[i].rsvTableNo=="no.5"){
								table="5번 테이블";
							}
							if(json[i].rsvTableNo=="no.6"){
								table="6번 테이블";
							}
							if(json[i].rsvTableNo=="no.7"){
								table="7번 테이블";
							}
							$("#result").append("<tr><td class='rsvTime'>예약시간</td><td class='date'>"+dateFormat+"</td><td class='tableNo'>테이블 번호</td><td class='no'>"+table+"</td><td class='number'>인원</td><td class='rsvNumber'>"+json[i].rsvNumber+"명</td></tr>");
						}
					}
					
				}
			})
			
		})
	})
</script>

	<div class="s_visu1">
		<img src="${pageContext.request.contextPath}/images/main/f_visu5.jpg">
	</div>
	<div id="searchContainer">
	<h1>예약 조회</h1>
		<div id="searchInnerContainer">
			<h3>예약조회하기</h3>
			<table id="rsvTable">
				<tr>
					<td class="gray">이름</td>
					<td><input type="text" name="name" id="name"></td>
					<td class="gray">연락처</td>
					<td><input type="text" name="first" class="tel"> - <input type="text" name="second" class="tel"> - <input type="text" name="third" class="tel"></td>
				</tr>
				<tr>
					<td colspan="4"><button id="search">조회하기</button></td>
				</tr>
			</table>
			<h3 id="rsvResult">예약조회결과</h3>
			
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>




















