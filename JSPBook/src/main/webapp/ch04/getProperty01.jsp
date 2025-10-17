<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action tag</title>
</head>
<body>
	<!-- getProperty 액션 태크에 자바빈 Person으로 아이디와 이름을 가져와 출력하기 -->
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request" />
	<jsp:getProperty property="name" name="person"/>
	<jsp:getProperty property="id" name="person"/>
	
</body>
</html>