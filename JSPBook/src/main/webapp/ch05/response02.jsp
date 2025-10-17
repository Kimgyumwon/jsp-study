<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<!-- response 내장 객체로 5초마다 JSP 페이지 갱신하기 -->
	<p>
		<%
			response.setIntHeader("Refresh",5);
		%>
	</p>
	<%= new Date() %>
</body>
</html>