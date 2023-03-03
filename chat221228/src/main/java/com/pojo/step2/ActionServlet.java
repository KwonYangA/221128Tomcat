package com.pojo.step2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

public class ActionServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Logger logger = Logger.getLogger(ActionServlet.class);
			
	protected void doService(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	logger.info("doService호출");
	String uri = req.getRequestURI(); //
	logger.info(uri); //  
	String context = req.getContextPath();// 
	logger.info(context);
	String command = uri.substring(context.length()+1); //
	System.out.println(command); 
	int end = command.lastIndexOf(".");//
	System.out.println(end);
	command = command.substring(0, end);
	System.out.println(command); 
	String upmu[] = null;
	upmu = command.split("/");
	logger.info(upmu[0]+"--"+upmu[1]);
	
	req.setAttribute("upmu", upmu);
	Board2Controller boardController = new Board2Controller();
	Object obj = "";
	obj = boardController.execute(req, res);
	if(obj != null) { //응답시 
		String pageMove[] = null;//redirect:XXX.jsp or forward:XXX.jsp
		if(obj instanceof String) {
			if(((String) obj).contains(":")) {
				logger.info(":포함되어있어유");
				pageMove = obj.toString().split(":");
			}else {
				logger.info(": 포함되어있지 않아유");
				pageMove = obj.toString().split("/");
			}
			logger.info(pageMove[0]+"--"+pageMove[1]);
		}
		if(pageMove != null) {
			//pageMove[0] = redirect or forward
			//pageMove[1] = XXX.jsp
			String path = pageMove[1];
			if("redirect".equals(pageMove[0])) {
				res.sendRedirect(path);
			}else if("forward".equals(pageMove[0])) {
				RequestDispatcher view = req.getRequestDispatcher("/"+path+".jsp");
				view.forward(req, res);
			}else{
				path = pageMove[0]+"/"+pageMove[1];
				RequestDispatcher view = req.getRequestDispatcher("/WEB-INF/view/"+path+".jsp");
				view.forward(req, res);
			}	
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
