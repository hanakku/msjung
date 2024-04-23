package jms.member.access.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import jms.member.control.Controller;
import jms.member.dao.MemberDAO;
import jms.member.dto.MemberDTO;
import jms.member.handler.HandlerAdapter;

public class PwSearchController implements Controller {
	private static final Log log = LogFactory.getLog(PwSearchController.class);

	@Override
	public HandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		log.info(user_id);
		String user_email = request.getParameter("user_email");
		log.info(user_email);
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUser_id(user_id);
		memberDTO.setUser_email(user_email);
		
		MemberDAO memberDAO = new MemberDAO();
		memberDTO = memberDAO.memberSearchPw(user_id, user_email);
		log.info(memberDTO);
		request.setAttribute("user_pw", memberDTO.getUser_pw( ));
		
		HandlerAdapter handlerAdapter = new HandlerAdapter();
		handlerAdapter.setPath("/WEB-INF/view/access/member_pw_search_view.jsp");
		return handlerAdapter;
	}

}
