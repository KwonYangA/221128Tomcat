<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id= "f_test" method="post" action = "/day1/hello.kh">
<input type="button" id= "btnSend" value = "전송">
<!-- 전송버튼에 대한 이벤트 처리가 없는 요청이 서버에 전달되는 이유 -->
<script>
	const btnSend = document.querySelector("#btnSend");
	btnSend.addEventListener('click', ()=> {
		alert("전송버튼클릭")
		document.querySelector("#f_test").submit()
	})
</script>
</form>
</body>
</html>