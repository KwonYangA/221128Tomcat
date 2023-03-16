<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String dap1 = request.getParameter("h_test1");
	out.print("1번 문제 답안==>> "+dap1);
	//쿠키에는 문자열만 담을 수 있으므로 그냥 2를 쓰면 컴파일 오류
	Cookie c1 = new Cookie("testForm1", dap1);
	c1.setPath("/onLineTest");
	c1.setMaxAge(60*60);
	response.addCookie(c1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제2</title>
<script type = "text/javascript">
	const test = (cb) => {
		for(let i=0; i<document.f_test2.cb.length; i++){
			if(cb === i)
				document.f_test2.cb[i].checked = 1
			else	
				document.f_test2.cb[i].checked = 0			
		}
	}
	
	const next = () =>{
		let dap = 1;
		for(let i=0; i<document.f_test2.cb.length; i++){
			if(document.f_test2.cb[i].checked == 1){
				document.f_test2.h_test2.value = dap;
			}else{
				dap = dap + 1
			}
		}
		document.f_test2.submit();
	}
//------------------이전
	const prev = () => {
	//location.href 속성으로 페이지를 전환하는 건 SPA에는 맞지 않다.
		location.href ="testForm1.jsp";
	}
</script>
</head>
<body>
	
	<form name="f_test2" method="get"  action="testForm3.jsp">
	<input type = "hidden" name ="h_test2" >
	문제2. 다음 중 DDL구문이 아닌 것을 고르시오.<br >
		<input type="checkbox" name="cb" onChange="test(0)">create<br>
		<input type="checkbox" name="cb" onChange="test(1)">drop<br>
		<input type="checkbox" name="cb" onChange="test(2)">alter<br>
		<input type="checkbox" name="cb" onChange="test(3)">delete<br>
		<br>
		<input type="button" value="이전문제" onClick="prev()">
		<input type="button" value="다음문제" onClick="next()">
	</form>
</body>
</html>