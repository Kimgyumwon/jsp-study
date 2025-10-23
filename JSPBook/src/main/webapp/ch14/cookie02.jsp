<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<!-- 쿠키 객체 저장된 모든 쿠키 값 가져와서 출력하기 -->
	<%
		Cookie[] cookies = request.getCookies();
		out.println("현재 설정된 쿠키의 개수=> " + cookies.length + "<br>");
		out.println("==================================<br>");
		
		for (Cookie cookie : cookies){
			out.println("설정된 쿠키의 이름: " + cookie.getName() + "<br>");
			out.println("설정된 쿠키의 값: " + cookie.getValue()+ "<br>");
			out.println("=============================<br>");
		}
		
		
		
		
		
		
		
	%>





</body>
</html>