<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../view/include/header_mgn.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>

<style>
	#wrap {
		min-height: 700px;
		width: 1000px;
		margin: 0 auto;
	}
	#div {
		height: 140px;
	}
	#noticeForm {
		min-height: 650px;
		width: 100%;
		margin: 30px 0;
	}
	#noticeForm h1 {
		text-align: center;
		margin-bottom: 10px;
	}
	#frm {
		width: 100%;
		margin-top: 10px;
		overflow: hidden;
	}
	#frm p {
		margin: 10px 0;
	}
	#frm p:last-child {
		text-align: center;
		margin-top: 10px;
		overflow: hidden;
		padding-left: 42%;
	}
	label {
		font-weight: bold;
		font-size: 1.1em;
	}
	input[type="text"] {
		padding: 3px 0;
	}
	input[type="button"] {
		padding: 5px 15px;
		background-color: #c7a593;
		border: 1px solid #c7a593;
		color: white;
		border-radius: 3px;
		outline: none;
		float: left;
		font-size: 16px;
	}
	#noticeForm span {
		padding: 5px 15px;
		background-color: #c7a593;
		border: 1px solid #c7a593;
		border-radius: 3px;
		outline: none;
		display: inline-block;
		height: 21px;
		line-height: 21px;
		float: left;
		margin-left: 5px;
	}
	#noticeForm a {
		color: white;
	}
</style>
<script>
	$(function() {
		$("#frm").submit(function() {
			if($("input[name='title']").val() == "") {
				alert("제목을 입력하세요");
				return false;
			}
			if($("textarea[name='content']").val() == "<br>") {
				alert("내용을 입력하세요");
				return false;
			}
		})
	})
</script>
	<div id="wrap">
		<div id="div"></div>
		<div id="noticeForm">
			<h1>공지사항 등록</h1>
			<form id="frm" action="${pageContext.request.contextPath}/mgn/noticeMgninsert.do" method="post" enctype="multipart/form-data">
				<p>
					<label>제목</label><br>
					<input type="text" name="title" size="130">
				</p>
				<p>
					<label>내용</label>
					<textarea rows="30" cols="139" name="content" id="ir1"></textarea>
				</p>
				<p>
					<input type="button" id="save" value="등록">
					<span><a href="${pageContext.request.contextPath}/mgn/noticeMgnlist.do">돌아가기</a></span>
				</p>
			</form>
		</div>
	</div>
	
<script>
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "ir1",    
			sSkinURI: "${pageContext.request.contextPath}/se2/SmartEditor2Skin.html",	 
			 fOnAppLoad : function(){
	          //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	         // oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
	      },
			fCreator: "createSEditor2"
	});
		
	
	// textArea에 이미지 첨부
	 function pasteHTML(filepath){
	     var sHTML = '<img src="${pageContext.request.contextPath}/se2/upload/'+filepath+'">';
	     oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
	 }
	 
	 $("#save").click(function(){
			var a = confirm("등록하시겠습니까?");
			if(a==true){
				 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용.
			     $("#frm").submit();
			}else{
				return false;
			}
		
	 }); 
</script>

<%@ include file="../../view/include/footer.jsp" %>