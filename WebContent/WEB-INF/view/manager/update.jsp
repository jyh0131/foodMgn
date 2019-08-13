<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.css">
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>                      
<style>
	.s_visu1 {
		width: 100%;
		height: 350px;
	}
	
	.s_visu1 img{
		width: 100%;
		height: 350px;
	}
	#eventContainer{
		width:1000px;
		margin:0 auto;
		overflow: hidden;
	}
	#frm{
		margin:20px auto;
		clear: both;
	}
	table{
		margin: 10px auto;
		padding:20px;
		border:1px solid #ccc;
		width:900px;
	}
	#title{
		width:770px;
		height:25px;
	}
	#ir1{
		width:850px;
		height:700px;
		margin-top:20px;
	}
	input[type='button']{
		margin:20px;
		width:80px;
		height:35px;
		font-size: 18px;
	}
	
	.firstTd{
		padding-right:10px;
		font-weight: bold;
		width: 70px;
	}
	#menu_li2 {
		float: right;
		margin-bottom:30px;
		margin-top:20px;                 
	}
	#menu_li2 li {
		list-style: none;
		float: left;
		padding: 5px; 
	}
	#btnBox{
		text-align: center;
	}
	.selectList{
		height:25px;
	}
</style>

	<div class="s_visu1">
		<img src="${pageContext.request.contextPath}/images/main/event.jpg">
	</div>
	<div id="eventContainer">
			<div id="menu_li2">
				<ul>
					<li>HOME</li>
					<li>></li>
					<li>이벤트</li>
					<li>></li>
					<li><b>이벤트</b></li>
				</ul>
			</div>
		<form id="frm" action="eventUpdate.do" method="post" >
			<table>
		        <tr>
		            <td class="firstTd">제목</td>
		            <td><input type="text" id="title" name="title" value="${event.eTitle }"/><input type="hidden" name="no" value=${event.eNo }></td>
		        </tr>
		        <tr>
		        	<td class="firstTd">기간</td>
		        	<td><input type="text" name="date" class="selectList" autocomplete="off" value="<fmt:formatDate value="${event.eStartDate}" pattern="yyyy-MM-dd"/>"> ~ <input type="text" name="date2" class="selectList" autocomplete="off" value="<fmt:formatDate value="${event.eEndDate}" pattern="yyyy-MM-dd"/>"></td>
		        </tr>
		        <tr>
		            <td colspan="2">
		                <textarea rows="10" cols="30" id="ir1" name="content">${event.eText }</textarea>
		            </td>
		        </tr>      
			</table>
			<div id="btnBox">
				 <input type="button" id="update" value="수정"/>
		         <input type="button" value="취소"/>
			</div>
		</form>
	</div>
<script>

$(".selectList").datepicker();

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "ir1",    
		sSkinURI: "${pageContext.request.contextPath}/se2/SmartEditor2Skin.html",	 
		 fOnAppLoad : function(){
          //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
         oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
      },
		fCreator: "createSEditor2"
});
	

// textArea에 이미지 첨부
 function pasteHTML(filepath){
     var sHTML = '<img src="${pageContext.request.contextPath}/se2/upload/'+filepath+'">';
     oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
 }
 
 $("#update").click(function(){
		var date = new Date($("input[name='date']").val());
		var date2 = new Date($("input[name='date2']").val());
		
		if((date.getTime()-date2.getTime())>0 ){
			alert("끝나는 날짜는 시작날짜보다 작을 수 없습니다.");
			$("input[name='date']").val("");
			$("input[name='date2']").val("");
         return false;
		}
		var a = confirm("수정하시겠습니까?");
		if(a==true){
			 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용.
		     $("#frm").submit();
		}else{
			return false;
		}
	
 }); 
</script>

<%@ include file="../include/footer.jsp" %>
