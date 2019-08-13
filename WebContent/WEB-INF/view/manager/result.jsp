<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	if(${eventDelete=="success"}){
		alert("이벤트를 마감하였습니다.");
		location.href="${pageContext.request.contextPath}/event.do";
	}
	if(${eventUpdate=="success"}){
		alert("이벤트를 수정하였습니다.");
		location.href="${pageContext.request.contextPath}/event.do";
	}
</script>