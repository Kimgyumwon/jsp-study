<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>

	<!-- 회원 가입 폼 페이지에 입력한 데이터 형식 유효성 검사하기 -->
	<form name="member" action="validation05_process.jsp" method="post">
		<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="passwd"></p>
		<p>이름: <input type="text" name="name"></p>
		<p>
			연락처: 
			<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> - 
			<input type="text" maxlength="4" size="4" name="phone2"> - 
			<input type="text" maxlength="4" size="4" name="phone3">
		</p>
		<p>이메일: <input type="text" name="email"></p>
		<button type="button" onclick="checkMember()">가입하기</button> 
	</form>
	
	
	<script type="text/javascript">
		function checkMember(e) {
			
			// id 영문 대소문자 , 한글 , 한글의 자음과 모음으로 시작하는지 검사
			const regExpId = /^[a-zA-zㄱ-ㅎㅏ-ㅣ가-힣]/;
			
			// 이름에 대해 한글만 검사
			// const regExpName = /^[가-힣]+$/; 최소 1글자 이상
			const regExpName = /^[가-힣]{2,4}$/; // 2~4글자
			
			// Password숫자만 검사
			const regExpPasswd = /^[0-9]{4,}$/; // 최소 자릿수 요구(숫자만 최소 4자리)
			
			// 전화번호 형태인지 검사
			const regExpPhone = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
			
			// 이메일 형태인지 검사
			const regExpEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/i;
			// ^[0-9a-zA-z]([-_.]?[0-9a-zA-z])*@[0-9a-zA-z]([-_.]?[0-9a-zA-z])*\.
			
			
			
			
			
			const form = document.member;
			
			const id = form.id.value;
			const name = form.name.value;
			const passwd = form.passwd.value;
			const phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value
			const email = form.email.value;
			
			if(!regExpId.test(id)){
				alert("아이디는 문자로 시작해 주세요!")
				return;
			}
			
			if(!regExpName.test(name)){
				alert("이름은 한글(2~4) 입력해 주세요!")
				return;
			}
			
			if(!regExpPasswd.test(passwd)){
				alert("비밀번호는 숫자4자리 이상 입력해 주세요!")
				return;
			}
			
			if(!regExpPhone.test(phone)){
				alert("연락처 입력을 확인해 주세요!")
				return;
			}
			
			if(!regExpEmail.test(email)){
				alert("이메을 입력을 확인해 주세요!")
				return;
			}
			form.submit();
			
			
		}
	</script>	
	
	
	
	
	
	
	
</body>
</html>