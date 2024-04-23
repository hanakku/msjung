package jms.member.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import jms.member.access.controller.IdCheckController;
import jms.member.access.controller.IdSearchController;
import jms.member.access.controller.MemberLoginController;
import jms.member.access.controller.MemberLogoutController;
import jms.member.access.controller.PwSearchController;
import jms.member.control.Controller;
import jms.member.controller.MemberDeleteController;
import jms.member.controller.MemberInsertController;
import jms.member.controller.MemberSearchController;
import jms.member.controller.MemberSelectController;
import jms.member.controller.MemberSelectDetailController;
import jms.member.controller.MemberUpdateController;
import jms.member.controller.MemberUpdateViewController;
import jms.member.handler.HandlerAdapter;

@WebServlet("/MemberDispatcherServlet")
public class MemberDispatcherServlet extends HttpServlet {
	private static Log log = LogFactory.getLog(MemberDispatcherServlet.class);
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String pathURI = requestURI.substring(contextPath.length());
		HandlerAdapter handlerAdapter = null;
		Controller controller = null;

		if(pathURI.equals("/memberSelect.me")) {
			controller = new MemberSelectController();
			handlerAdapter = controller.execute(request, response);
			log.info("회원 조회 - " + handlerAdapter);
		}
		
		
		

		else if(pathURI.equals("/MemberInsertView.me")) {
			handlerAdapter = new HandlerAdapter();
			handlerAdapter.setPath("/WEB-INF/view/member/member_insert.jsp");
			log.info("회원 가입 화면 뷰 확인 - " + handlerAdapter);
		}
		
		else if(pathURI.equals("/MemberInsert.me")) {		
			controller = new MemberInsertController();
			handlerAdapter = controller.execute(request, response);
			log.info("회원 가입 확인 - " + handlerAdapter);
		}
		
		else if(pathURI.equals("/MemberUpdate.me")) {
			controller = new MemberUpdateController();
			handlerAdapter = controller.execute(request, response);
			log.info("회원 수정 페이지 이동 확인 - " + handlerAdapter);
		}
		
		else if(pathURI.equals("/MemberUpdateView.me")) {
			controller = new MemberUpdateViewController();
			handlerAdapter = controller.execute(request, response);
			log.info("회원 수정 확인 - " + handlerAdapter);
		}
		
		else if(pathURI.equals("/MemberDelete.me")) {
			controller = new MemberDeleteController();
			handlerAdapter = controller.execute(request, response);
			log.info("회원 삭제 확인 - " + handlerAdapter);
		}
		
		else if(pathURI.equals("/MemberSelectDetail.me")) {
			controller = new MemberSelectDetailController();
			handlerAdapter = controller.execute(request, response);
			log.info("회원 상세 조회 확인 - " + handlerAdapter);
		}
		
		else if(pathURI.equals("/LoginView.me")) {
			handlerAdapter = new HandlerAdapter();
			handlerAdapter.setPath("/WEB-INF/view/access/member_login.jsp");
			log.info("로그인 화면 뷰 확인 - " + handlerAdapter);
		}
		
		else if(pathURI.equals("/LoginHome.me")) {
			handlerAdapter = new HandlerAdapter( );
			handlerAdapter.setPath("/WEB-INF/view/access/login_home.jsp");
			log.info("홈 화면 뷰 확인 - " + handlerAdapter);
			}
	
		else if(pathURI.equals("/Login.me")) {
			controller = new MemberLoginController();
			handlerAdapter = controller.execute(request, response);
			log.info("로그인 확인 - " + handlerAdapter);
		}
		
		else if(pathURI.equals("/Logout.me")) {
			controller = new MemberLogoutController();
			handlerAdapter = controller.execute(request, response);
			log.info("로그아웃 확인 - " + handlerAdapter);
		}
		
		else if(pathURI.equals("/IdCheck.me")) {
			controller = new IdCheckController();
			handlerAdapter = controller.execute(request, response);
			log.info("아이디 체크 확인 -" + handlerAdapter);
		}
		
		else if(pathURI.equals("/IdSearchView.me")) {
			handlerAdapter = new HandlerAdapter( );
			handlerAdapter.setPath("/WEB-INF/view/access/member_id_search.jsp");
			log.info("아이디 찾기 뷰화면  확인 -" + handlerAdapter);
		}
		
		else if(pathURI.equals("/IdSearch.me")) {
			controller = new IdSearchController( );
			handlerAdapter = controller.execute(request, response);
			log.info("아이디 찾기 확인 - " + handlerAdapter);
		}
		
		else if(pathURI.equals("/PasswordSearchView.me")) {
			handlerAdapter = new HandlerAdapter( );
			handlerAdapter.setPath("/WEB-INF/view/access/member_pw_search.jsp");
			log.info("비밀번호 찾기 화면 뷰 확인 - " + handlerAdapter);
		} 
		
		else if(pathURI.equals("/PasswordSearch.me")) {
			controller = new PwSearchController();
			handlerAdapter = controller.execute(request, response);
			log.info("비밀번호 찾기 확인 - " + handlerAdapter);
		} 
		
		else if(pathURI.equals("/MemberSearch.me")) {
			controller = new MemberSearchController();
			handlerAdapter = controller.execute(request, response);
			log.info("회원 검색 확인 -" + handlerAdapter);
		}
		
		if(handlerAdapter != null) {
			if(handlerAdapter.isRedirect( )) {
				response.sendRedirect(handlerAdapter.getPath( ));
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(handlerAdapter.getPath( ));
				dispatcher.forward(request, response);
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
