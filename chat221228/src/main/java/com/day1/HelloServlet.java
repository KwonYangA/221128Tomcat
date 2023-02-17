package com.day1;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
//form전송시 클라이언트측의 요청을 서블릿이 듣는다.
//method="get"이면 doGet호출
//post이면 doPost호출됨
//상속을 받으면 doGet과 doPost 오버라이딩 할 수 있는데
//이 함수의 파라미터를 통해서 request요청 객체와 response응답 객체를 주입 받는다
//톰캣 서버에서 주입 해줌
//웹 서비스를 위해서는 URL등록이 필수이다-왜냐면 브라우저가 실행 주체이니까...
//프로젝트에 필요한 URL등록은 annotation과 web.xml문서를 통해서 가능하다
//annotation은 자동이고 편하기는 하지만 수동처리와 비교해서 추가 작업이 불가능한 단점이 있다
//xml문서를 통해서 객체를 등록하고 주입 받는다
//이유는 spring 사용시 메이븐 레포를 이용한 프로젝트 생성인 경우에 xml문서로 환경 설정함
//클래스 사이의 객체 주입관계도 xml문서로 처리 가능함
public class HelloServlet extends HttpServlet {
	Logger logger = Logger.getLogger(HelloServlet.class);
@Override	
 public void doGet(HttpServletRequest req, HttpServletResponse res)
 	throws ServletException, IOException
 	{
	 System.out.println("doGet호출");
	 logger.info("doGet호출 성공");
	 res.setContentType("text/html;charset=utf-8");
	 PrintWriter out = res.getWriter();
	 String msg = "안녕하세요";
	 //브라우저에서 요청[Get방식]시 응답으로 나가는 문자열
	 //문자열(1.텍스트파일:숫자의 경우 문자로 변환 후 쓴다, 2. 바이너리파일:데이터를 있는 그대로 읽고 쓴다)
	 //text메인타입 html서브타입 - 브라우저 번역 - 태그는 없고 내용만 출력
	 out.print("<font size=28px color=red>"+msg+"</font>");
//	 BookDao bDao = new BookDao();
//	 logger.info(bDao.testDate());
	 
	 //단위테스트가 불가하다 - Postman사용하면 가능하다
	 
	 
	 //get 방식
	 //서버측의 리소스(html, css, js,,)를 가져오기 위해서..
	 //쿼리스트링 전송(소용량)
	 //노출
 	}
 @Override
 public void doPost(HttpServletRequest req, HttpServletResponse res)
		 throws ServletException, IOException
	{
	 logger.info("doPost호출 성공");
	}
}

