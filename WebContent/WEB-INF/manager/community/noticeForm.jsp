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
		height: 600px;
		width: 100%;
		border: 1px solid #555;
		margin: 30px 0;
	}
	input[type="button"] {
		padding: 3px 5px;
		background-color: #c7a593;
		border: 1px solid #c7a593;
		color: white;
		border-radius: 3px;
		outline: none;
	}
</style>

	<div id="wrap">
		<div id="div"></div>
		<div id="noticeForm">
			<form id="frm" action="${pageContext.request.contextPath}/mgn/noticeMgninsert.do" method="post" enctype="multipart/form-data">
				<p>
					<label>제목</label>
					<input type="text" name="title">
				</p>
				<p>
					<label>내용</label>
					<textarea rows="10" cols="100" name="content" id="ir1"></textarea>
				</p>
				<p>
					<input type="button" id="save" value="등록">
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