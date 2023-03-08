<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//여기는 자바 - 자바코딩 가능 - 스크립틀릿
	//localhost:9000/common/hangulTest.jsp?mem_name=김춘추
	//쿼리스트링으로 넘오는 한글처리->server.xml문서-> URIEncoding="UTF-8" 추가
	String name = request.getParameter("mem_name");
	out.print(name);
%>
<!-- 여기는 HTML  -->