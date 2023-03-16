<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	 현재 내가 바라보는 페이지는 testForm4.jsp 이지만
	 3번 문제에 대한 답은 다음 문제 버튼이 눌렸을 때 마음에 결정이 된것이니까
	 3번 문제에 대한 답을 담는 hidden은 남겨야 한다.
	 그 값을 다음 문제인 testFrom4.jsp에서 request.getParameter("")로 읽어서
	 쿠키를 생성하고 그 값을 담는다
	*/
	String dap2 = request.getParameter("h_test2");
	out.print("2번 문제 답안==>> "+dap2);
	
	Cookie c2 = new Cookie("testForm2", dap2);
	c2.setMaxAge(60*60);
	response.addCookie(c2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제3</title>
<script type = "text/javascript">
	const test = (cb) => {
		for(let i=0; i<document.f_test3.cb.length; i++){
			if(cb === i)
				document.f_test3.cb[i].checked = 1
			else	
				document.f_test3.cb[i].checked = 0			
		}
	}
	const next = () =>{
		let dap = 1;
		for(let i=0; i<document.f_test3.cb.length; i++){
			if(document.f_test3.cb[i].checked == 1){
				document.f_test3.h_test3.value = dap;
			}else{
				dap = dap + 1
			}
		}
		document.f_test3.submit();
	}
//------------------이전
	const prev = () => {
		location.href ="testForm2.jsp";
	}
</script>
</head>
<body>

	<form name="f_test3" method="get"  action ="testForm4.jsp">
	<input type = "hidden" name ="h_test3" >
	문제3. 다음 중 DCL구문으로 맞는 것을 고르시오.<br>
		<input type = "hidden" name ="h_test2" >
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