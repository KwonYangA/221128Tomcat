<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키 정보는 사용자 컴터에 저장되어 있다
	//그래서 서버는 요청을 해야 함 - 사용자 컴터에게
	//서버는 사용자를 어떻게 구분하나요? - JSessionID발급 -> 쿠키에 저장됨 -> 쿠키값 기준으로 너를 알아봄
	String users[] = new String[5];
	Cookie cs[] =  request.getCookies();
	int size = 0;
	size = cs.length;
	for(int i=0; i<size; i++){
		String c_name = cs[i].getName();
		if("testForm1".equals(c_name)){
			users[0] = cs[0].getValue();
		}else if("testForm2".equals(c_name)){
			users[1] = cs[1].getValue();
		}else if("testForm3".equals(c_name)){
			users[2] = cs[2].getValue();
		}else if("testForm4".equals(c_name)){
			users[3] = cs[3].getValue();
		}else if("testForm5".equals(c_name)){
			users[4] = cs[4].getValue();
		}	
	}

	// 문제당 배점
	int jumsu = 20;
	
	// 합격기준 점수는
	int pass = 60;
	
	//맞춘 객수
	int cnt = 0;
	
	//합격 여부
	boolean isPass = false;
	
	//정답표
	String daps[] = {"3", "4", "1", "2", "4"};
	
	// 채점하는 로직을 구현하시오
	for(int i=0; i<daps.length; i++){
		for(int j=0; j<users.length; j++){
			if(daps[i].equals(users[j])){
				if(i==j){
					cnt++;
				}
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	const cookieDelete=() =>{
		location.href="cookieDelete.jsp"
	} 
</script>
</head>
<body>
<h3>맞힌 갯수 : <%=cnt%>개 입니다.</h3>
<h3>당신의 점수는 : <%=cnt*jumsu%>점 입니다.</h3>
<div>
<button onclick="cookieDelete()">쿠키삭제</button>
<%
 if((jumsu*cnt) >= pass){
	 out.print("그러니까 당신은 합격");
 }else{
	 out.print("그러니까 당신은 불합격");	 
 }
%>
</div>
</body>
</html>