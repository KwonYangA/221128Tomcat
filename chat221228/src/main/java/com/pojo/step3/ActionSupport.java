package com.pojo.step3;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class ActionSupport extends HttpServlet {
	Logger logger = Logger.getLogger(ActionSupport.class);

	protected void doService(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doService호출");
		String uri = req.getRequestURI(); //
		logger.info(uri); //
		String context = req.getContextPath();//
		logger.info(context);
		String command = uri.substring(context.length() + 1); //
		System.out.println(command);
		int end = command.lastIndexOf(".");//
		System.out.println(end);
		command = command.substring(0, end);
		System.out.println(command);
		String upmu[] = null;
		upmu = command.split("/");
		logger.info(upmu[0] + ", " + upmu[1]);

		req.setAttribute("upmu", upmu);

		Object obj = "";
		try {
			obj = HandlerMapping.getController(upmu, req, res);
		} catch (Exception e) {
			logger.info("Exception :" + e.toString());
		}
		if (obj != null) { // 응답시
			String pageMove[] = null;// redirect:XXX.jsp or forward:XXX.jsp
			ModelAndView mav = null;
			if(obj instanceof String) {
				logger.info("obj가 String일때");
				if(((String) obj).contains(":")) {
					logger.info(":포함되어 있어요.");
					pageMove = obj.toString().split(":");
				}else if(((String) obj).contains("/")){
					logger.info("/포함되어 있어요.");
					pageMove = obj.toString().split("/");
				}else{
					//spring boot ->  @RestController spring4(@RestController가 미지원)버전은 ResponseBody사용
					logger.info(": 콜론도 /도 포함되어 있지 않아요.");//text/plain -> text형식 ->String
					pageMove = new String[1];
					pageMove[0] = obj.toString();
					logger.info(obj.toString());
				}
			}else if(obj instanceof ModelAndView) {
				logger.info("obj가 ModelAndView일때");
				mav = (ModelAndView)obj;
				pageMove = new String[2];
				pageMove[0] = "";//forward-> ViewResolver else if()타게됨-> webapp
				pageMove[1] = mav.getViewName();
				
			}
			logger.info("Object가 String일때와 ModelAndView일때 가 끝난지점...");
			if(pageMove !=null && pageMove.length==2) {
				//pageMove[0] = redirect or forward
				//pageMove[1] = XXX.jsp
				new ViewResolver(req,res,pageMove);
			}
			else if(pageMove !=null && pageMove.length==1) {
				res.setContentType("text/plain;charset=UTF-8");
				PrintWriter out = res.getWriter();
				out.print(pageMove[0]);
			}
		}
		}
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doGet호출");
		doService(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doPost호출");
		doService(req, res);
	}
}
