<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>

	<form name="loginForm" action="validation02_process.jsp" method="post">
		<p>아아디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="passwd"></p>
		<button type="submit" onclick="checkLogin(event)">전송</button>
	</form>
	
	
	<script type="text/javascript">
		function checkLogin(e) {
			const id = document.loginForm.id.value;
			const pw = loginForm.passwd.value;
			
			if(id === ''){
				alert("아이디를 입력해주세요");
				document.loginForm.id.focus();
				// return false; 오래된 방식 (의미가 명확하지가 않음)
				e.preventDefault(); // 기본 동작 막기(여기서는 폼 제출 차단)
				return;
			}
			
			if(pw === ''){
				alert("비밀번호를 입력해주세요");
				document.loginForm.passwd.focus();
				e.preventDefault();
				return;
			}
			// form.submit(); 일반 button인 경우 필요, submit 버튼에서는 불필요
			alert("아이디: "+ id + "\n" + "비밀번호: " + pw)
		}
		
	</script>	
	
	
	
	
	
	
	
</body>
</html>