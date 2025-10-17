<%@page import="java.security.Identity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<%
		/* 폼(입력양식)에서 입력한 한글을 처리하도록 request 내장 객체의 메소드에 문자 인코딩 설정 */
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("passwd"); 
	%>

	<p>아이디: <%= userId %></p>
	<p>비밀번호: <%= userPwd %></p>
	
	<!-- EL 사용 시 -->
	<p>${param.id}</p>
	<p>${param.passwd}</p>
</body>
</html>