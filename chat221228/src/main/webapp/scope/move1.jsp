<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.book.scope.Sonata" %>

<%
	Sonata myCar = (Sonata)request.getAttribute("myCar");
	String oMyCar = request.getParameter("oMyCar");
	Sonata herCar = (Sonata)request.getAttribute("herCar");
	String oHerCar = request.getParameter("oHerCar");
	Sonata himCar = (Sonata)request.getAttribute("himCar");
	Sonata yourCar = (Sonata)session.getAttribute("yourCar");
	String oYourCar = request.getParameter("oYourCar");
	out.print("scope1.jsp에서 생성된 객체 유지 되나요?");
	out.print("<hr>");
	//out.print(myCar.carName+",,,"+oMyCar.carName+",,,"+oMyCar.concat("1")+"자동차".concat("1"));
	//out.print("<hr>");
	//out.print(herCar.carName+",,,"+oHerCar.carName+",,,"+oMyCar.indexOf(3)+"소나타".concat("1"));
	//out.print("<hr>");
	//out.print(yourCar.carName+",,,"+oYourCar.carName+",,,"+oMyCar.charAt(2)+true.concat("1")+ new Boolean(true).toString()); 
%>