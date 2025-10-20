<%@page import="dao.BookRepository"%>
<%@page import="java.util.List"%>
<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
 -->
 <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>

	<div class="container py-4">
		<%@ include file="menu.jsp" %>
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
    	<jsp:include page="title.jsp">
    		<jsp:param value="도서목록" name="title"/>
    		<jsp:param value="BookList" name="subtitle"/>
    	</jsp:include>
    </div>
		
		<%
			// BookRepository 공유 객체로 변경
			BookRepository dao = BookRepository.getInstance();
			List<Book> listOfBooks = dao.getAllBooks();
		%>
		
		
		
    <div class="row align-items-md-stretch text-center">
    	<%
    		for (int i = 0; i < listOfBooks.size(); i++) {
    			Book book = listOfBooks.get(i);
    			%>
    			<div class="col-md-4">
    				<div class="h-100 p-2">
    					<!-- 웹 앱 내부 접근 시 -->
    					<img alt="도서이미지" src="<%= request.getContextPath() %>/images/<%= book.getFilename() %>" style="width: 250px; height: 350px">
    					<h5><b><%= book.getName()%></b></h5>
    					<p>
    						<%= book.getAuthor()%>
    						<br>
    						<%= book.getPublisher()%> | <%= book.getReleaseDate()%>    						
    					</p>
    					<p><%= book.getDescription().substring(0,60)%>...</p>
    					<p><%= book.getUnitPrice()%>원</p>
    					<p>
    					<!-- 보조 기기(스크린 리더)에게 "이거 버튼처럼 동작하는 요소야"라고 알려줌 -->
    						<a href="./book.jsp?id=<%= book.getBookId()%>" class="btn btn-secondary" role="button">
    							상제 정보 &raquo;
    						</a>
    					</p>
    					
    				</div>
    			</div>
    	<%
    		}
    	%>
 		</div>
		<%@ include file="footer.jsp" %>
  </div>
	
</body>
</html>