<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<p>오늘의 날짜 및 시간</p>
<%-- 	<p><%= new Date().toLocaleString() %></p> --%>
	<%
		String numStr = request.getParameter("num");
		out.println(numStr);
		int num = Integer.parseInt(numStr);
		for(int i = 1; i <= 9; i++){
			out.println(num + " * "+ i +" = "+ num*i);
		} 
	%>
</body>
</html>