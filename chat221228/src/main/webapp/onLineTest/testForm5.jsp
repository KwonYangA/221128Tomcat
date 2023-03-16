<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String dap4 = request.getParameter("h_test4");
	out.print("4번 문제 답안==>> "+dap4);

	Cookie c4 = new Cookie("testForm4", dap4);
	c4.setMaxAge(60*60);
	response.addCookie(c4);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제5</title>
<script type = "text/javascript">
	const test = (cb) => {
		for(let i=0; i<document.f_test5.cb.length; i++){
			if(cb === i)
				document.f_test5.cb[i].checked = 1
			else	
				document.f_test5.cb[i].checked = 0			
		}
	}
	const next = () =>{
		let dap = 1;
		for(let i=0; i<document.f_test5.cb.length; i++){
			if(document.f_test5.cb[i].checked == 1){
				document.f_test5.h_test5.value = dap;
			}else{
				dap = dap + 1
			}
		}
		document.f_test5.submit();
	}
//------------------이전
	const prev = () => {
		location.href ="testForm4.jsp";
	}
</script>
</head>
<body>
	<form name="f_test5" method="get"  action = "testForm6.jsp">
	<input type = "hidden" name ="h_test5" >
	문제5. 다음 중 프로시저에 대한 설명으로 틀린 것을 고르시오.<br>
		<input type="checkbox" name="cb" onChange="test(0)">
		프로시저를 생성할 때 파라미터를 선언할 수 있다.<br>
		<input type="checkbox" name="cb" onChange="test(1)">
		파라미터에 여러 변수를 선언할 수 있다.<br>
		<input type="checkbox" name="cb" onChange="test(2)">
		프로시저안에서 SELECT,INSERT,UPDATE, DELETE 모두 사용 할 수 있다.<br>
		<input type="checkbox" name="cb" onChange="test(3)">
		프로시저 안에서 commit할 수 없다.
	</form>
<br>
<br>
<input type="button" value="이전문제" onClick="prev()">
<input type="button" value="다음문제" onClick="next()">
</body>
</html>