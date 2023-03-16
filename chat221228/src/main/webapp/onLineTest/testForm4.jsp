<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String dap3 = request.getParameter("h_test3");
	out.print("3번 문제 답안==>> "+dap3);
	
	Cookie c3 = new Cookie("testForm3", dap3);
	c3.setMaxAge(60*60);
	response.addCookie(c3);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제4</title>
<script type = "text/javascript">
	const test = (cb) => {
		for(let i=0; i<document.f_test4.cb.length; i++){
			if(cb === i)
				document.f_test4.cb[i].checked = 1
			else	
				document.f_test4.cb[i].checked = 0			
		}
	}
	const next = () =>{
		let dap = 1;
		for(let i=0; i<document.f_test4.cb.length; i++){
			if(document.f_test4.cb[i].checked == 1){
				document.f_test4.h_test4.value = dap;
			}else{
				dap = dap + 1
			}
		}
		document.f_test4.submit();
	}
//------------------이전
	const prev = () => {
		location.href ="testForm3.jsp";
	}
</script>
</head>
<body>
	<form name="f_test4" method="get"  action ="testForm5.jsp">
	<input type = "hidden" name ="h_test4">
	문제4. 다음 중 테이블에 대한 설명으로 틀린 것을 고르시오.<br>
		<input type="checkbox" name="cb" onChange="test(0)">
		row와 column으로 구성되어있다.<br>
		<input type="checkbox" name="cb" onChange="test(1)">
		테이블에는 반드시 index가 있어야 한다.<br>
		<input type="checkbox" name="cb" onChange="test(2)">
		컬럼에는 적당한 타입을 선택하고 담을 수 있는 크기도 설정할 수 있다.<br>
		<input type="checkbox" name="cb" onChange="test(3)">
		테이블에는 PK도 올 수 있고 FK도 올 수 있다.
	</form>
<br>
<br>
<input type="button" value="이전문제" onClick="prev()">
<input type="button" value="다음문제" onClick="next()">
</body>
</html>