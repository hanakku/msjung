package jms.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
//import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import jms.member.dto.MemberDTO;
import jms.member.service.MemberService;

public class MemberDAO implements MemberService {
	private static final Log log = LogFactory.getLog(MemberDAO.class);

	@Override
	public ArrayList<MemberDTO> memberSelectAll(int page, int limit) {
		ArrayList<MemberDTO> arrayList = new ArrayList<MemberDTO>();
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "select * from (select rownum rnum, num, user_id, user_name, user_age, user_email, user_nickname, to_char(user_bdate, 'yyyy-mm-dd') user_bdate, to_char(user_reg_date, 'yyyy-mm-dd') user_reg_date, user_phone_num from (select * ";
			sql += "from member where user_id != 'admin' order by num desc))";
			sql += " where rnum between " + startrow + " and " + endrow;
			log.info("SQL 확인 - " + sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setNum(resultSet.getInt("num"));
				memberDTO.setUser_id(resultSet.getString("user_id"));
				memberDTO.setUser_name(resultSet.getString("user_name"));
				memberDTO.setUser_age(resultSet.getInt("user_age"));
				memberDTO.setUser_email(resultSet.getString("user_email"));
				memberDTO.setUser_nickname(resultSet.getString("user_nickname"));
				memberDTO.setUser_bdate(resultSet.getString("user_bdate"));
				memberDTO.setUser_reg_date(resultSet.getString("user_reg_date"));
				memberDTO.setUser_operator(resultSet.getString("user_operator"));
				memberDTO.setUser_phone_num(resultSet.getString("user_phone_num"));
				arrayList.add(memberDTO);
				log.info("조회 데이터 확인" + memberDTO);
			}
			if (resultSet.getRow( ) == 0) {
				log.info("등록된 회원이 없습니다.");	
			}
		} catch (Exception e) {
			log.info("전체 회원 조회 실패 - " + e);
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return arrayList;
	}

	@Override
	public MemberDTO memberInsert(MemberDTO memberDTO) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			connection.setAutoCommit(false);
			java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(System.currentTimeMillis());
			String sql = "insert into member(user_id, user_name, user_age, user_pw, user_email, user_nickname, user_bdate, user_phone_num, num, user_reg_date)";
			sql += "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			log.info("SQL - " + sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, memberDTO.getUser_id());	
			preparedStatement.setString(2, memberDTO.getUser_name());
			preparedStatement.setInt(3, memberDTO.getUser_age());
			preparedStatement.setString(4, memberDTO.getUser_pw());
			preparedStatement.setString(5, memberDTO.getUser_email());
			preparedStatement.setString(6, memberDTO.getUser_nickname());
			preparedStatement.setString(7, memberDTO.getUser_bdate());
			preparedStatement.setString(8, memberDTO.getUser_phone_num());
			preparedStatement.setInt(9, memberDTO.getNum());
			preparedStatement.setTimestamp(10, currentTimestamp);
			int count = preparedStatement.executeUpdate();
			log.info("입력 데이터 확인 - " + memberDTO);
			if (count > 0) {
				connection.commit();
				log.info("커밋되었습니다.");
			} else {
				connection.rollback();
				log.info("롤백되었습니다.");
			}	
		} catch (Exception e) {
			log.info("회원 가입 실패 - " + e);
		} finally {
			try {
				connection.close();
				preparedStatement.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return memberDTO;
	}

	@Override
	public MemberDTO memberUpdate(MemberDTO memberDTO) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		log.info("업데이트 정보 - " + memberDTO);
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "update member set user_name = ?, user_age = ?, user_pw = ?, user_email = ?, user_nickname = ?, user_bdate = to_date(?, 'yyyy-mm-dd'), user_phone_num = ?";
			sql += "where user_id = ?";
			log.info("SQL - " + sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, memberDTO.getUser_name());
			preparedStatement.setInt(2, memberDTO.getUser_age());
			preparedStatement.setString(3, memberDTO.getUser_pw());
			preparedStatement.setString(4, memberDTO.getUser_email());
			preparedStatement.setString(5, memberDTO.getUser_nickname());
			preparedStatement.setString(6, memberDTO.getUser_bdate());
			preparedStatement.setString(7, memberDTO.getUser_phone_num());
			preparedStatement.setString(8, memberDTO.getUser_id());
			int count = preparedStatement.executeUpdate();
			log.info("수정 데이터 확인 - " + memberDTO);
			if (count > 0) {
				connection.commit();
				log.info("커밋되었습니다.");
			} else {
				connection.rollback( );
				log.info("롤백되었습니다.");
			}	
		} catch (Exception e) {
			log.info("회원 정보 수정 실패 - " + e);
		} finally {
			try {
				connection.close();
				preparedStatement.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return memberDTO;
	}

	@Override
	public MemberDTO memberDelete(MemberDTO memberDTO) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "delete from member";
			sql += " where user_id = ? ";
			log.info("SQL - " + sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, memberDTO.getUser_id());
			int count = preparedStatement.executeUpdate();
			if (count > 0) {
				connection.commit();
				log.info("커밋되었습니다.");
			} else {
				connection.rollback( );
				log.info("롤백되었습니다.");
			}
		} catch (Exception e) {
			log.info("회원 삭제 실패 - " + e);
		} finally {
			try {
				connection.close();
				preparedStatement.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return memberDTO;
//		return null;
	}

	@Override
	public MemberDTO memberSelect(MemberDTO memberDTO) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "select num, user_id, user_name, user_age, user_pw, user_email, user_nickname, to_char(user_bdate, 'yyyy-mm-dd') user_bdate, to_char(user_reg_date, 'yyyy-mm-dd') user_reg_date, user_phone_num from member";
			sql += " where user_id = ? ";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, memberDTO.getUser_id());
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				log.info("아이디 확인 - " + resultSet.getString("user_id"));
				memberDTO.setNum(resultSet.getInt("num"));
				memberDTO.setUser_id(resultSet.getString("user_id"));
				memberDTO.setUser_name(resultSet.getString("user_name"));
				memberDTO.setUser_age(resultSet.getInt("user_age"));
				memberDTO.setUser_pw(resultSet.getString("user_pw"));
				memberDTO.setUser_email(resultSet.getString("user_email"));
				memberDTO.setUser_nickname(resultSet.getString("user_nickname"));
				memberDTO.setUser_bdate(resultSet.getString("user_bdate"));
				memberDTO.setUser_reg_date(resultSet.getString("user_reg_date"));
				memberDTO.setUser_phone_num(resultSet.getString("user_phone_num"));
			}	
		} catch (Exception e) {
			log.info("개별 회원 정보 조회 실패 - " + e);
			e.printStackTrace();
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return memberDTO;
	}

	@Override
	public int memberNumber() {
		int i = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "select max(num) from member";
			log.info("SQL 확인 - " + sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery(sql);
			if (resultSet.next()) {
				i = resultSet.getInt("max(num)");
			}
		} catch (Exception e) {
			log.info("최대 회원 번호 검색 실패 - " + e);
			e.printStackTrace();
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return i;
	}

	@Override
	public int memberCount() {
		int i = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "select count(*) from member where user_id != 'admin'";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				i = resultSet.getInt(1);
			}
		} catch (Exception e) {
			log.info("현재 회원 수 검색 실패 - " + e);
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return i;
	}

	@Override
	public ArrayList<MemberDTO> memberSearch(String keyword, int page, int limit) {
		log.info("검색 단어 확인 - " + keyword);
		String searchCall = "";
		if (!keyword.equals("")) {
			searchCall = "where user_id like '%" + keyword + "%'";
		}
		ArrayList<MemberDTO> arrayList = new ArrayList<MemberDTO>();
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "select * from (select rownum rnum, user_id, user_name, user_age, user_email, user_nickname, to_char(user_bdate, 'yyyy-mm-dd') user_bdate, to_char(user_reg_date, 'yyyy-mm-dd') user_reg_date, user_phone_num from (select * "; // to_char(user_reg_date, 'yyyy-mm-dd') user_bdate
			sql += "from member " + searchCall + " order by num desc) where user_id != 'admin')";
			sql += " where rnum between " + startrow + " and " + endrow;
			log.info("SQL - " + sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setNum(resultSet.getInt("num"));
				memberDTO.setUser_id(resultSet.getString("user_id"));
				memberDTO.setUser_name(resultSet.getString("user_name"));
				memberDTO.setUser_age(resultSet.getInt("user_age"));
				memberDTO.setUser_pw(resultSet.getString("user_pw"));
				memberDTO.setUser_email(resultSet.getString("user_email"));
				memberDTO.setUser_nickname(resultSet.getString("user_nicjname"));
				memberDTO.setUser_bdate(resultSet.getString("user_bdate"));
				memberDTO.setUser_reg_date(resultSet.getString("user_reg_date"));
				memberDTO.setUser_phone_num(resultSet.getString("user_phone_num"));
				arrayList.add(memberDTO);
				log.info("조회 데이터 확인" + memberDTO);
			}
			if (resultSet.getRow( ) == 0) {
				log.info("등록된 회원이 없습니다.");
			}
		} catch (Exception e) {
			log.info("회원 검색 실패 - " + e);
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return arrayList;
	}

	@Override
	public int memberSearchCount(String keyword) {
		int i = 0;
		log.info("검색 단어 확인 - " + keyword);
		String searchCall = "";
		if(!keyword.equals("")) {
			searchCall = "user_id like '%" + keyword + "%'";
		}
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "select count(*) from (select * from member where user_id != 'admin') where " + searchCall;
			log.info("SQL 확인 - " + sql);
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				i = resultSet.getInt(1);
			}
		} catch (Exception e) {
			log.info("아이디 검색 회원 수 검색 실패 - " + e);
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
		return i;
	}

	@Override
	public MemberDTO memberLogin(MemberDTO memberDTO) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "select * from member ";
			sql += "where user_id = ?";
			log.info("SQL - " + sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, memberDTO.getUser_id());
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				memberDTO.setUser_name(resultSet.getString("user_name"));
				memberDTO.setUser_id(resultSet.getString("user_id"));
				log.info("아이디 확인 - " + resultSet.getString("user_id"));
				if (resultSet.getString("user_pw").equals(memberDTO.getUser_pw())) {
					memberDTO.setUser_pw(resultSet.getString("user_pw"));
					log.info("비밀번호 확인 - " + resultSet.getString("user_pw"));
				} else {
					memberDTO.setUser_pw("");
				}
			} else {
				memberDTO.setUser_id("");
			}
		} catch (Exception e) {
			log.info("로그인 실패 - " + e);
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return memberDTO;
	}

	@Override
	public int memberId(String user_id) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int idCheck = 0;
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "select * from member ";
			sql += "where user_id=? ";
			log.info("SQL - " + sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user_id);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next() || user_id.equals("")) {	
				idCheck = 1; // 존재하는 경우
			} else {
				idCheck = 0; // 존재하지 않는 경우
			}
		} catch (Exception e) {
			log.info("회원 아이디 체크 실패 - " + e);
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return idCheck;
	}

	@Override
	public MemberDTO memberSearchId(String user_name, String user_email) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		MemberDTO memberDTO = new MemberDTO();
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "select * from member where user_name = ? and user_email = ?";
			log.info("SQL - " + sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user_name);
			preparedStatement.setString(2, user_email);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				memberDTO.setNum(resultSet.getInt("num"));
				memberDTO.setUser_id(resultSet.getString("user_id"));
				memberDTO.setUser_name(resultSet.getString("user_name"));
				memberDTO.setUser_pw(resultSet.getString("user_pw"));
				memberDTO.setUser_email(resultSet.getString("user_email"));
				log.info("조회 데이터 확인" + memberDTO);
			}
		} catch (Exception e) {
			log.info("아이디 찾기 실패 - " + e);
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return memberDTO;
	}

	@Override
	public MemberDTO memberSearchPw(String user_id, String user_email) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		MemberDTO memberDTO = new MemberDTO();
		try {
			Context context = new InitialContext();
			DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc");
			connection = dataSource.getConnection();
			String sql = "select * from member where user_id = ? and user_email = ?";
			log.info("SQL - " + sql);
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user_id);
			preparedStatement.setString(2, user_email);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				memberDTO.setNum(resultSet.getInt("num"));
				memberDTO.setUser_id(resultSet.getString("user_id"));
				memberDTO.setUser_name(resultSet.getString("user_name"));
				memberDTO.setUser_pw(resultSet.getString("user_pw"));
				memberDTO.setUser_email(resultSet.getString("user_email"));
				log.info("조회 데이터 확인" + memberDTO);
			}
		} catch (Exception e) {
			log.info("비밀번호 찾기 실패 - " + e);
		} finally {
			try {
				resultSet.close();
				preparedStatement.close( );
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return memberDTO;
	}

}
