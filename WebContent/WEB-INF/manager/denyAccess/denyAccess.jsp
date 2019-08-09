<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"><% System.out.println("jsp도착"); %>
	$(function(){
		alert("잘못된 접근입니다.");
		location.href = "${pageContext.request.contextPath}";
	})
	
</script>
</head>
<body>

</body>
</html>