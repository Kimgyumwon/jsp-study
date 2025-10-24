<%@page import="util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.BookRepository"%>
<%@page import="java.util.List"%>
<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoBookId.jsp" %>
<%-- <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"/> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- 장바구니에 등록하기 위한 핸들러 함수 작성 -->
	<script type="text/javascript">
		function addToCart() {
			if (confirm('도서를 장바구니에 추가하시겠습니까?')) {
				document.addForm.submit();
			} else {
				document.addForm.reset();
			}
		}
	</script>
</head>
<body>

	<div class="container py-4">
		<%@ include file="menu.jsp" %>
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
    	<jsp:include page="title.jsp">
    		<jsp:param value="도서정보" name="title"/>
    		<jsp:param value="BookInfo" name="subtitle"/>
    	</jsp:include>
    </div>
	</div>
		<%@ include file="dbconn.jsp" %>
	
		<%
		
			String id = request.getParameter("id");
				
				// BookRepository 공유 객체로 변경
				// BookRepository dao = BookRepository.getInstance();
				// Book book = dao.getBookById(id);
				
				try {
					String sql = "SELECT * FROM book WHERE b_id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					if(rs.next()){
		%>
		
		
		
     <div class="row align-items-md-stretch">
     	<div class="col-md-6">
			<%-- 	<img alt="도서이미지" src="./resources/images/<%= book.getFilename() %>" style="width: 70%;"> --%>
				<img alt="도서이미지" src="<%= request.getContextPath() %>/images/<%=rs.getString("b_fileName")%>" style="width: 70%;">
     	</div>
     	
      <div class="col-md-6">
      	<!-- Quiz: 도서 정보로 채워넣기(데이터 동적 바인딩) -->
				<h3><b><%= rs.getString("b_name") %></b></h3>
				<p><%= rs.getString("b_description")%></p>
				<p>
					<b>도서코드</b>: <span class="badge text-bg-danger"><%=rs.getString("b_id") %></span>
				</p>							
				<p>
					<b>저자</b>: <%= rs.getString("b_author") %>
				</p>	
				<p><b>출판사</b>: <%=rs.getString("b_publisher")%></p>	
				<p><b>출판일</b>: <%=rs.getString("b_releaseDate")%></p>				
				<p><b>분류</b>: <%=rs.getString("b_category")%></p>
				<p><b>재고수</b>: <%=rs.getInt("b_unitsInStock") %></p>
				<h4><%=rs.getInt("b_unitPrice")%> 원</h4>
				<p>
					<form action="./addCart.jsp?id=<%= rs.getString("b_id") %>" method="post" name="addForm">
						<input type="hidden" name="bookId" value="<%= rs.getString("b_id") %>">
						<a href="javascript:void(0)" class="btn btn-info" onclick="addToCart()">도서주문 &raquo;</a> 					
						<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
						<a href="./books.jsp" class="btn btn-secondary">도서목록 &raquo;</a>					
					</form>
				</p>
		
      </div>
 		</div>
 				<%
						}
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						DBUtil.close(pstmt,rs,conn);
					}
				%>
		<%@ include file="footer.jsp" %>
</body>
</html>