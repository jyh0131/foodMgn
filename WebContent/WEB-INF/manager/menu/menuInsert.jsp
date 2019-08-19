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
	#foodForm {
		min-height: 650px;
		width: 100%;
		margin: 30px 0;
	}
	#foodForm h1 {
		text-align: center;
		margin-bottom: 10px;
	}
	#f1 {
		width: 100%;
		margin-top: 10px;
	}
	#f1 p {
		margin: 10px 0;
	}
	#f1 p:last-child {
		text-align: center;
		margin-top: 10px;
	}
	label {
		font-weight: bold;
		font-size: 1.1em;
	}
	input[type="text"], option {
		padding: 3px 0;
	}
	input[type="submit"] {
		padding: 5px 15px;
		background-color: #c7a593;
		border: 1px solid #c7a593;
		color: white;
		border-radius: 3px;
		outline: none;
		font-size: 1.1em;
	}
</style>

	<div id="wrap">
		<div id="div"></div>
		<div id="foodForm">
			<h1>음식 추가</h1>
			<form id="f1" action="${pageContext.request.contextPath}/mgn/menuMgninsert.do" method="post" enctype="multipart/form-data">
				<p>
					<select name="fk">
						<option>음식종류선택</option>
						<option>파스타</option>
						<option>스테이크&커틀렛</option>
						<option>필라프&리조또</option>
						<option>샐러드</option>
						<option>시그니처 피자</option>
						<option>피자</option>
						<option>사이드 메뉴</option>
						<option>음료</option>
						<option>맥주</option>
					</select>
				</p>
				<p><input type="text" name="name" size="20" placeholder="음식명"></p>
				<p><input type="text" name="price" size="5" placeholder="가격"></p>
				<p><input type="submit" value="추가"></p>
			</form>
		</div>
	</div>

<%@ include file="../../view/include/footer.jsp" %>