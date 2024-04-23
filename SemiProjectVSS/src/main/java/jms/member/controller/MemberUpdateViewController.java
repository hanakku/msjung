package jms.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import jms.member.control.Controller;
import jms.member.dao.MemberDAO;
import jms.member.dto.MemberDTO;
import jms.member.handler.HandlerAdapter;

public class MemberUpdateViewController implements Controller {
	private static final Log log = LogFactory.getLog(MemberUpdateViewController.class);

	@Override
	public HandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDTO memberDTO = new MemberDTO();
		MemberDAO memberDAO = new MemberDAO();
		memberDTO.setUser_id(request.getParameter("user_id"));
		memberDTO.setUser_name(request.getParameter("user_name"));
		memberDTO.setUser_age(Integer.parseInt(request.getParameter("user_age")));
		memberDTO.setUser_pw(request.getParameter("user_pw"));
		memberDTO.setUser_email(request.getParameter("user_email"));
		memberDTO.setUser_nickname(request.getParameter("user_nickname"));
		memberDTO.setUser_bdate(request.getParameter("user_bdate"));
		memberDTO.setUser_phone_num(request.getParameter("user_phone_num"));
		log.info("업데이터 정보 - " + memberDTO);
		memberDTO = memberDAO.memberUpdate(memberDTO);
		request.setAttribute("memberDTO", memberDTO);
		
		HandlerAdapter handlerAdapter = new HandlerAdapter();
		handlerAdapter.setPath("/WEB-INF/view/member/member_update_view.jsp");
		return handlerAdapter;
	}

}
