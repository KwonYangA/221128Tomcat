package com.day1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
/*
  자바로는 웹서비스가 불가하다 -> request와 respnose없어서 안된다.
  왜냐하면 - http(s:security + 인증서)프로토콜을 지원하는 API가 없으니까
  자바에는 URL(프로토콜://도메인:포트번호/경로/페이지 이름 or Servlet)을 등록할 수 없다.
  Server+ Applet
  a.jsp -> a_jsp.java -> a_jsp.class
  웹페이지 출력이란?
  request - 쿼리스트링 - get 방식 - RESTful API(get, post, put , delete)
  document.write("<b></b>)
  PrintWriter out = res.getWriter();
  out.print("<b>/</b>")
  out.print("<b></b>")
 */
public class DeptManager extends HttpServlet {
	Logger logger = Logger.getLogger(DeptManager.class);
	@Override	
	 public void doGet(HttpServletRequest req, HttpServletResponse res)
	 	throws ServletException, IOException
	 	{
		 logger.info("[[doGet호출 성공]]");
		 String u_deptno = req.getParameter("deptno");
		 String u_dname = req.getParameter("dname");
		 String u_loc = req.getParameter("loc");
		 res.setContentType("text/plain;charset=UTF-8");
		 PrintWriter out = res.getWriter();
		 out.print(u_deptno+","+u_dname+","+u_loc);
	 	}
	 @Override
	 public void doPost(HttpServletRequest req, HttpServletResponse res)
			 throws ServletException, IOException
		{
		}
}
