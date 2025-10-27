<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://127.0.0.1:3306/jspbookdb"
		driver="com.mysql.cj.jdbc.Driver" user="root" password="mysql1234"/>
		
	<sql:update var="result" dataSource="${dataSource }">
	DELETE FROM member WHERE id = ? AND passwd =?	
		<sql:param value="${param.id }"/>
		<sql:param value="${param.passwd }"/>
	</sql:update>
	
	결과: <c:out value="${result }" />
		
	<!-- JSTL 버전의 동적 include: 해당 JSP의 실행 결과 (HTML)를 가져와 붙임 -->
	<c:import url="sql01.jsp"/>	
	
	
		
</body>
</html>