<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>

	<!-- 폼 페이지에서 입력한 아이디와 비밀번호 출력하기 -->
	<form name="loginForm">
		<p>아아디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="passwd"></p>
		<button type="submit" onclick="checkForm()">전송</button>
	</form>
	
	
	<script type="text/javascript">
		function checkForm() {
			alert("아이디: "+ document.loginForm.id.value + "\n" +
						"비밀번호: " + document.loginForm.passwd.value)
		}
	
	</script>	
	
	
	
	
	
	
	
</body>
</html>