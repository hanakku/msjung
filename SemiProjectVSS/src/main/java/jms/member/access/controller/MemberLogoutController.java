package jms.member.access.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import jms.member.control.Controller;
import jms.member.handler.HandlerAdapter;

public class MemberLogoutController implements Controller {
	private static final Log log = LogFactory.getLog(MemberLogoutController.class);

	@Override
	public HandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession httpSession = request.getSession();
		String user_id = (String) httpSession.getAttribute("user_id");
		request.setAttribute("user_id", user_id);
		httpSession.invalidate();
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(user_id)) {
					log.info(cookie.getName().equals("user_id"));
					cookie.setPath("/");
					response.addCookie(cookie);
				}
			}
		}
		
		HandlerAdapter handlerAdapter = new HandlerAdapter();
		handlerAdapter.setPath("/WEB-INF/view/access/member_logout.jsp");
		return handlerAdapter;
	}

}
