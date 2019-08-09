<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../view/include/header_mgn.jsp" %>

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
</style>
	<div id="wrap">
		<div id="div"></div>
		<div id="noticeForm">
			<form action="${pageContext.request.contextPath}/mgn/noticeMgninsert.do" method="post" enctype="multipart/form-data">
				<p>
					<label>제목</label>
					<input type="text" name="title">
				</p>
				<p>
					<label>내용</label>
					<textarea rows="10" cols="100" name="content"></textarea>
				</p>
				<p>
					<label>파일</label>
					<input type="file" name="file">
				</p>
				<p>
					<input type="submit" value="등록">
				</p>
			</form>
		</div>
	</div>
<%@ include file="../../view/include/footer.jsp" %>