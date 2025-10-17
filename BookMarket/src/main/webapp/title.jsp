<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	   <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold"><%= request.getParameter("title") %></h1>
        <p class="col-md-8 fs-4"><%= request.getParameter("subtitle") %></p>
      </div>
	
	
</body>
</html>