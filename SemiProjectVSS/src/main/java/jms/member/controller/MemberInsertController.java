package jms.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import jms.member.control.Controller;
import jms.member.dao.MemberDAO;
import jms.member.dto.MemberDTO;
import jms.member.handler.HandlerAdapter;

public class MemberInsertController implements Controller {
	private static final Log log = LogFactory.getLog(MemberInsertController.class);

	@Override
	public HandlerAdapter execute(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		log.info(user_id);
		String user_name = request.getParameter("user_name");
		log.info(user_name);
		int user_age = Integer.parseInt(request.getParameter("user_age"));
		log.info(user_age);
		String user_pw = request.getParameter("user_pw");
		log.info(user_pw);
		String user_email = request.getParameter("user_email");
		log.info(user_email);
		String user_nickname = request.getParameter("user_nickname");
		log.info(user_nickname);
		String user_bdate = request.getParameter("user_bdate");
		log.info(user_bdate);
		String user_phone_num = request.getParameter("user_phone_num");
		log.info(user_phone_num);
		MemberDTO memberDTO = new MemberDTO();
		MemberDAO memberDAO = new MemberDAO();
		int num = memberDAO.memberNumber();
		memberDTO.setNum(num + 1);
		memberDTO.setUser_id(user_id);
		memberDTO.setUser_name(user_name);
		memberDTO.setUser_age(user_age);
		memberDTO.setUser_pw(user_pw);
		memberDTO.setUser_email(user_email);
		memberDTO.setUser_nickname(user_nickname);
		memberDTO.setUser_bdate(user_bdate);
		memberDTO.setUser_phone_num(user_phone_num);
		log.info(memberDTO);
		memberDTO = memberDAO.memberInsert(memberDTO);
		request.setAttribute("user_id", memberDTO.getUser_id());
		
		HandlerAdapter handlerAdapter = new HandlerAdapter();
		handlerAdapter.setPath("/WEB-INF/view/member/member_insert_view.jsp");
		return handlerAdapter;
	}

}
