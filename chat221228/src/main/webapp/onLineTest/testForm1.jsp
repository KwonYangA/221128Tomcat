<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- react -> nextjs -> typescript추가 -> ECMAScript(번들러, 트랜스 파일러) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제1</title>
<script type = "text/javascript">
	const test = (cb) => {
		for(let i=0; i<document.f_test1.cb.length; i++){
			if(cb === i)
				document.f_test1.cb[i].checked = 1
			else	
				document.f_test1.cb[i].checked = 0			
		}
	}//end of test
	//document는 이 문서(testFrom1.jsp ->SSR -> html-> 다운로드 -> text파일 덩어리)를 가르킨다
	//document의 최상위 객체는 window
	//document.f_test1.cb 가 같은 이름으로 4개 -> 배열로 변경
	//document에서 같은 이름이 두개 이상이면 브라우저가 자동으로 배열로 전환
	//checked는 checkbox에서 선택된 상태일 때 처리하는 속성 - 1이면 선택
	//0은 false 나머지는 모두 true
	const next = () =>{
		let dap = 1 // <%-- <%="1"%> 정적 --%>
		for(let i=0; i<document.f_test1.cb.length; i++){
			if(document.f_test1.cb[i].checked == 1){
				document.f_test1.h_test1.value = dap;
			}else{
				dap = dap + 1
			}
		}
		document.f_test1.submit();
	}
</script>
</head>
<body>
	<form name="f_test1" method="get"  action = "testForm2.jsp">
	<input type = "hidden" name ="h_test1" value="">
	문제1. 다음 중 DML구문이 아닌 것을 고르시오.<br>
		<input type="checkbox" name="cb" onChange="test(0)">select<br>
		<input type="checkbox" name="cb" onChange="test(1)">insert<br>
		<input type="checkbox" name="cb" onChange="test(2)">create<br>
		<input type="checkbox" name="cb" onChange="test(3)">delete<br>
		<br>
		<input type="button" value="다음문제" onClick="next()">
	</form>
</body>
</html>