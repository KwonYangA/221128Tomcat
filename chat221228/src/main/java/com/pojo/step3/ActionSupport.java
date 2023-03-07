package com.pojo.step3;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.pojo.step2.Board2Controller;

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
			if (obj instanceof String) {
				if (((String) obj).contains(":")) {
					logger.info(":포함되어있어유");
					pageMove = obj.toString().split(":");
				} else {
					logger.info(": 포함되어있지 않아유");
					pageMove = obj.toString().split("/");
				}
			} else if (obj instanceof ModelAndView) {
				mav = (ModelAndView) obj;
				pageMove = new String[2];
				pageMove[0] = ""; //forward-> ViewResolver else if()타게 됨->webapp				
				pageMove[1] = mav.getViewName();
			}
			if (pageMove != null) {
				new ViewResolver(req, res, pageMove);
				}
				//WEB-INF/
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
