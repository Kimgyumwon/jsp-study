<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String value = request.getQueryString();
		out.println("전송된 요청 파라미터: " + value);
	%>
	<%
		String decodeedValue = URLDecoder.decode(request.getQueryString(), "utf-8");
		out.println("전송된 요청 파라미터: " + decodeedValue);
	%>
	
	
</body>
</html>