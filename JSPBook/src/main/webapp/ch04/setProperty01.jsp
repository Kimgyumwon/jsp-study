<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- setProperty 액션 태그에 자바빈 Person으로 아이디와 이름을 설정하여 출력하기 -->
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request" />
	<jsp:setProperty property="id" name="person" value="20251016"/>
	<jsp:setProperty property="name" name="person" value="김겸원"/>
	<p>아이디: <%= person.getId() %></p>
	<p>이름: <%= person.getName() %></p>

	<!-- EL 표현 언어 -->
	<p>아이디: ${person.id} </p>
	<p>이름: ${person.name}</p>
	
		
</body>
</html>