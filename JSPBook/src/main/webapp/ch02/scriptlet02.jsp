<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 스크립틀릿 태그에 0부터 10 까지 짝수 출력하기 -->
	<%
		// 지역변수 a , b
		for (int i = 0; i <= 10; i++){
			if(i % 2 == 0){
				out.println(i);
			}
		}
	%>
	
	
</body>
</html>