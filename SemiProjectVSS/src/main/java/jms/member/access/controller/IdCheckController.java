package jms.member.access.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import jms.member.control.Controller;
import jms.member.dao.MemberDAO;
import jms.member.handler.HandlerAdapter;


public class IdCheckController implements Controller {
	private static final Log log = LogFactory.getLog(IdCheckController.class);

	@Override
	public HandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		log.info(user_id);
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.memberId(user_id);
		if(result == 1) {
			log.info("존재하는 아이디 - " + user_id);
		} else if(result == 0) {
			log.info("존재하지 않는 아이디 - " + user_id);
		}
		try {
			PrintWriter out = response.getWriter();
			out.write(result + "");
			out.close();
		} catch(IOException e) {
			e.printStackTrace();
		}
		HandlerAdapter handlerAdapter = new HandlerAdapter( );
		handlerAdapter.setPath("/WEB-INF/view/member/member_insert.jsp");
		return null;
	}

}
