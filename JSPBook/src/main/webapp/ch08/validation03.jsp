<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>
	<!-- 폼 페이지에서 입력한 아이디와 비밀번호 값의 길이 검사하기 -->
	<form name="loginForm" action="validation03_process.jsp" method="post">
		<p>아아디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="passwd"></p>
		<button type="submit" onclick="checkLogin(event)">전송</button>
	</form>
	
	
	<script type="text/javascript">
		function checkLogin(e) {
			const id = document.loginForm.id.value;
			const pw = loginForm.passwd.value;
			
			if(id.length < 4){
				alert("아이디는 4자 이상으로 입력해야 합니다!");
				document.loginForm.id.select();
				// return false; 오래된 방식 (의미가 명확하지가 않음)
				e.preventDefault(); // 기본 동작 막기(여기서는 폼 제출 차단)
				return;
			}
			
			if(pw.length < 4 || pw.length > 12){
				alert("비밀번호는 4~12자 이내로 입력 가능합니다!");
				document.loginForm.passwd.select();
				e.preventDefault();
				return;
			}
			// form.submit(); 일반 button인 경우 필요, submit 버튼에서는 불필요
			alert("아이디: "+ id + "\n" + "비밀번호: " + pw)
		}
		
	</script>	
	
	
	
	
	
	
	
</body>
</html>