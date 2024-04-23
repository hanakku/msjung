package jms.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import jms.member.control.Controller;
import jms.member.dao.MemberDAO;
import jms.member.dto.MemberDTO;
import jms.member.handler.HandlerAdapter;

public class MemberDeleteController implements Controller {
	private static final Log log = LogFactory.getLog(MemberDeleteController.class);

	@Override
	public HandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		log.info(user_id);
		MemberDTO memberDTO = new MemberDTO();
//		memberDTO.setUser_id(user_id);
		MemberDAO memberDAO = new MemberDAO();
		memberDTO = memberDAO.memberDelete(memberDTO);
		log.info(memberDTO);
		request.setAttribute("memberDTO", memberDTO);	
		HandlerAdapter handlerAdapter = new HandlerAdapter();
		handlerAdapter.setPath("/WEB-INF/view/member/member_delete.jsp");
//		return null;
		return handlerAdapter;
	}

}
