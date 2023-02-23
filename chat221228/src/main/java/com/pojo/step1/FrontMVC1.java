package com.pojo.step1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class FrontMVC1 extends HttpServlet {
	Logger logger = Logger.getLogger(FrontMVC1.class);

	protected void doService(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doService호출");
		String uri = req.getRequestURI();
		logger.info(uri); //  /dept/getDeptList.st1
		String context = req.getContextPath();
		logger.info(context);
		String command = uri.substring(context.length()+1);
		System.out.println(command);
		int end = command.lastIndexOf(".");
		System.out.println(end);
		command = command.substring(0, end);
		System.out.println(command); 
		String upmu[] = null;
		upmu = command.split("/"); //dept, getDeptList
		for(String imsi: upmu) {
			System.out.println(imsi);
		}
		//게으른 인스턴스화
		//아직 결정 되지 않음 - 업무명이 Controller 클래스의 접두어이다.
		ActionForward af = null;
		DeptController deptController = null;
		EmpController empController = null;
		req.setAttribute("upmu", upmu);
		if("dept".equals(upmu[0])) {
			//request객체는 저장소이다 - setAttribute, getAttribute
			deptController = new DeptController();
			af = deptController.execute(req, res); //deptController는 서블릿이 아니여서 req, res를 was로 부터 주입받을 수 없다.
			//왜냐햐면 httpServlet을 상속받지X
		}else if("emp".equals(upmu[0])) {
			empController = new EmpController();
			af = empController.execute(req, res);
		}
		//페이지 이동처리 공통코드 만들기
		//1.res.sendRedirect("/dept/getDeptList.jsp"); //jsp-> 서블릿 -> jsp
		// res.sendRedirect("/dept/getDeptList.st1"); // jsp -> 서블릿 -> 서블릿 -> jsp
		if(af != null) {
			if(af.isRedirect()) {
				res.sendRedirect(af.getPath());
			}else {
				RequestDispatcher view = req.getRequestDispatcher(af.getPath());
				view.forward(req, res);
			}
		}//end of 페이지 이동처리에 대한 공통 코드 부분
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doService(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doService(req, res);
	}
	
}
