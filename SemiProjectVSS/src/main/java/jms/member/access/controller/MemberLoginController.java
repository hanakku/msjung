package jms.member.access.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import jms.member.control.Controller;
import jms.member.dao.MemberDAO;
import jms.member.dto.MemberDTO;
import jms.member.handler.HandlerAdapter;

public class MemberLoginController implements Controller {
	private static final Log log = LogFactory.getLog(MemberLoginController.class);

	@Override
	public HandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String save = request.getParameter("save");
		log.info(save);
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUser_id(user_id);
		memberDTO.setUser_pw(user_pw);
		log.info(memberDTO);
		
		MemberDAO memberDAO = new MemberDAO();
		memberDTO = memberDAO.memberLogin(memberDTO);
		log.info("로그인 내용" + memberDTO);
		request.setAttribute("user_name", memberDTO.getUser_name());
		request.setAttribute("memberDTO", memberDTO);
		if (!memberDTO.getUser_id().equals("") & !memberDTO.getUser_pw().equals("")) {
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("user_id", memberDTO.getUser_id());
			httpSession.setAttribute("user_name", memberDTO.getUser_name());
			Cookie cookie = new Cookie("user_id", memberDTO.getUser_id());
			cookie.setMaxAge(60 * 60 * 24);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		HandlerAdapter handlerAdapter = new HandlerAdapter();
		handlerAdapter.setPath("/WEB-INF/view/access/member_login_check.jsp");
		return handlerAdapter;
	}

}
