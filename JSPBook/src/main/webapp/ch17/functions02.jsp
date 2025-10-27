<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<!-- 문자열 분리하고 연결하기-->
	<c:set var="texts" value="${fn:split('Hello, Java Server Pages!' , ' ') }" />
	
	<c:forEach begin="0" end="${fn:length(texts)-1}" varStatus="loop">
		<p>text[${loop.index}] = ${texts[loop.index]} </p> 
	</c:forEach>	
	
	<p>
		<c:out value="${fn:join(texts , '::') }"/>
	</p>
	



</body>
</html>