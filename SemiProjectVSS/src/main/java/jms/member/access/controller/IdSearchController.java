package jms.member.access.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import jms.member.control.Controller;
import jms.member.dao.MemberDAO;
import jms.member.dto.MemberDTO;
import jms.member.handler.HandlerAdapter;

public class IdSearchController implements Controller {
	private static final Log log = LogFactory.getLog(IdSearchController.class);

	@Override
	public HandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		String user_name = request.getParameter("user_name");
		log.info(user_name);
		String user_email = request.getParameter("user_email");
		log.info(user_email);
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUser_name(user_name);
		memberDTO.setUser_email(user_email);
		
		MemberDAO memberDAO = new MemberDAO();
		memberDTO = memberDAO.memberSearchId(user_name, user_email);
		log.info(memberDTO);
		request.setAttribute("user_id", memberDTO.getUser_id());
		
		HandlerAdapter handlerAdapter = new HandlerAdapter();
		handlerAdapter.setPath("/WEB-INF/view/access/member_id_search_view.jsp");
		return handlerAdapter;
	}

}
