<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String dap5 = request.getParameter("h_test5");
	Cookie c5 = new Cookie("testForm5", dap5);
	c5.setMaxAge(60*60);
	response.addCookie(c5);
	
	//단위 테스는 URL은 다음과 같다
	//http://localhost:9010/onLineTest/testForm6.jsp?h_test1=2&h_test2=2&h_test3=2&h_test4=2&h_test4=2&h_test5=2
	//1번부터 5번까지 작성한 답안지의 값을 쿼리스트링으로 받아야 하므로 문제지는 testForm5.jsp에서 끝났다 하더라도
	//1번부터 5번까지의 답안지를 가지고 있는 testForm5.jsp에서 값을 모두 읽여들인 후
	//채점을 하는 testAccount.jsp페이지로 이동시켜야 한다.
	//반복되는 작업이고 문제 수가 많아지면 그 만큼 많은 값을 쿼리스트링으로 끝없이 넘겨야 하므로 비효율적이다
	//그래서 유지의 문제는 중요하고 여기서 쿠키를 사용하여 개선해 보도록 한다.
	response.sendRedirect( "testAccount.jsp");
%>

<!--
	실습 개요
	온라인 시험이지만 한 번 푼 문제도 다시 돌려 볼 수 있어야한다
	그래서 form태그로 문제를 감싼다
	form태그에 action속성을 이용하여 다음 문제로의 이동은 가능하지만
	이전 문제로 이동하기 위해서는 window객체 location객체의 href속성으로 처리해야 한다.
	이럴 경우 URL이 변경 되므로 화면전환시 새로운 요청을 서버로 전송하게 된다
	이때 전송 방식은 get으로 하였다
	한 화면에 한 문제만 볼 수 있으므로 선택한 답안지 정보는 2번 문제를 풀때 가져가야 한다
	가져 갈 때 화면에 나타낼 필요가 없어서 input 태그의 hidden속성을 사용했다.
	문제는 푼 문제가 늘어날수록 hidden의 갯수도 계속 늘어난다는 것이다.
	1번에는 한개이지만
	2번에서는 둘
	3번에서는 셋
	4번에서는 넷
	5번에서는 화난다
	
	이 문제를 개선하는 방법은 쿠키를 이용하여 한 문제를 풀때 마다 쿠키에 값을 저장하는 것이다
	
	Cookie c1 = new Cookie("testForm1", 2);
	아래 코드를 생략하면 디폴트가 현재 바라보는 물리적 폴더명이므로 
	현재 바라보는 경로에 onLineTest가 들어있는 경우에는 생략할 수 있으나
	직관적으로 알 수 있도록 써준다
	만일 setPath("/")라고 할 경우 루트 도메인에서 읽고 수정 삭제가 가능하므로 주의할것 
	c1.setPath("/onLineTest");
	c1.setMaxAge(60*60)// 평가시간 60분일 때 시간 설정값이다
	위에서 작성된 답안 번호를 저장한 값을 클라이언트측에서 반드시 내려 보내야한다
	response.addCookie(c1) 
	
	
-->