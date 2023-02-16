<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MimeHtmlServlet2 응답페이지</title>
</head>
<body>
	<h2>MimeHtmlServlet2 응답페이지</h2>
	<%
	//스크립틀릿
	String myName = null;
	myName = (String) session.getAttribute("myName");
	myName = (String) session.getAttribute("myName");
	int age = 0;
	age = (int) session.getAttribute("age");
	out.print(myName);
	out.print("<br>");
	out.print(age);
	out.print("<hr>");
	Map<String, Object> rmap = (Map<String, Object>) session.getAttribute("rmap");
	Object keys[] = rmap.keySet().toArray();
	if(rmap!=null){ //NullPointerException방어 코드
	for (int i = 0; i < keys.length; i++) {
		out.print(rmap.get(keys[i]));
		out.print("<br>");
		}
	}
	//getAttribute의 리턴타입은 Object이다. (getParameter의 리턴타입은 String)
	out.print("<hr>");
	List<Map<String, Object>> mList = (List<Map<String, Object>>)session.getAttribute("mList");
	if(mList != null){
	for(int i=0; i<mList.size(); i++){
		Map<String, Object> rMap = mList.get(i);
		out.print(rMap.get("mem_id")+","+rMap.get("mem_pw")+","+rMap.get("mem_name")+"<br>");
		
	}	
	}		
	
	%>
</body>
</html>