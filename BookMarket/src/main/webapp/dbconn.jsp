<%@page import="com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
	<!-- JDBC API로 데이터베이스 접속하기 -->
	<% 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	
	
		try{
			
			String url = "jdbc:mysql://127.0.0.1:3306/bookmarkdb";
			String user = "root";
			String password = "mysql1234";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(url , user, password);
		}catch (SQLException e) {
			out.println("데이터베이스 연결 실패 <br>");
		}
	%>	
</body>
</html>