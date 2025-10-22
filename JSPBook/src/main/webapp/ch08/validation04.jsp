<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>

	<!-- 폼 페이지에서 입력한 비밀번호 값이 숫자인지 검사하기 -->
	<form name="loginForm" action="validation04_process.jsp" method="post">
		<p>아아디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="passwd"></p>
		<button type="submit" onclick="checkLogin(event)">전송</button>
	</form>
	
	
	<script type="text/javascript">
		function checkLogin(e) {
			const id = document.loginForm.id.value;
			const pw = loginForm.passwd.value;
			
			for (let ch of id) {
				if(ch < 'a' || ch > 'z'){
					alert("아이디는 영문 소문자만 입력 가능합니다.");
					document.loginForm.id.select();
					e.preventDefault();
					return;
				}
			}
			if(isNaN(pw)){
				alert("비밀번호는 숫자만 입력가능합니다!");
				document.loginForm.passwd.select();
				e.preventDefault();
				return;
			}
			alert("아이디: "+ id + "\n" + "비밀번호: " + pw)
		}
	</script>	
	
	
	
	
	
	
	
</body>
</html>