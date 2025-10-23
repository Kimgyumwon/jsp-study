<%@page import="java.util.ArrayList"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 장바구니에 등록된 전체 도서 삭제하기 -->
	<%
		// 1. 요청 파라미터 검증
		// 쿼리 스트링으로 보낸 데이터
		String id = request.getParameter("cartId");
		
		// id가 null인지 빈 문자열인지 검증
		if (id == null || id.trim().isEmpty()) {
			response.sendRedirect("cart.jsp");
			return;
		}
		
		// 2. 모든 도서 삭제
		ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
		// session.invalidate(); 주의! 이 코드는 세션에 저장된 모든 데이터를 삭제하고 세션 자체도 무효화하는 것이라 문제 있음
		
		// session.removeAttribute("cartlist"); 장바구니만 비우기: "cartlist"만 삭제
		
		// 장바구니 내용만 비우기: 세션에 저장된 리스트는 유지, 내용만 삭제
		cartList.clear();
		
		
		
		// 5. 장바구니 페이지로 리다이렉트
		response.sendRedirect("cart.jsp");	
	%>
</body>
</html>