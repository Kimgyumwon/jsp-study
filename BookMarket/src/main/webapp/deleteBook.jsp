<%@page import="util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 등록</title>
	
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- 유효성 검사 js 연결 -->
	<script type="text/javascript" src="./resources/js/validation.js"></script>
</head>
<body>
	<!-- 도서 정보 삭제 페이지 -->
	<%@ include file="dbconn.jsp" %>
	<%
		String bookId = request.getParameter("id");
		
		try {
			String sql = "DELETE FROM book WHERE b_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs , pstmt , conn);
		}
		
		response.sendRedirect("./editBook.jsp?edit=delete");
		
		
	%>
</body>
</html>