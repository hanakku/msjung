package jms.member.service;

import java.util.ArrayList;

import jms.member.dto.MemberDTO;

public interface MemberService {
	
	public ArrayList<MemberDTO> memberSelectAll(int page, int limit);
	
	public MemberDTO memberInsert(MemberDTO memberDTO);
	
	public MemberDTO memberUpdate(MemberDTO memberDTO);
	
	public MemberDTO memberDelete(MemberDTO memberDTO);
	
	public MemberDTO memberSelect(MemberDTO memberDTO);
	
	public int memberNumber();
	
	public int memberCount();
	
	public ArrayList<MemberDTO> memberSearch(String keyword, int page, int limit);
	
	public int memberSearchCount(String keyword);
	
	public MemberDTO memberLogin(MemberDTO memberDTO);
	
	public int memberId(String user_id);
	
	public MemberDTO memberSearchId(String user_name, String user_email);
	
	public MemberDTO memberSearchPw(String user_id, String user_email);
	
}
