package jms.member.dto;

public class MemberDTO {
	private String user_id;
	private String user_name;
	private int user_age;
	private String user_pw;
	private String user_email;
	private String user_nickname;
	private String user_bdate;
	private String user_reg_date;
	private String user_operator;
	private String user_phone_num;
	private int num;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getUser_age() {
		return user_age;
	}
	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getUser_bdate() {
		return user_bdate;
	}
	public void setUser_bdate(String user_bdate) {
		this.user_bdate = user_bdate;
	}
	public String getUser_reg_date() {
		return user_reg_date;
	}
	public void setUser_reg_date(String user_reg_date) {
		this.user_reg_date = user_reg_date;
	}
	public String getUser_operator() {
		return user_operator;
	}
	public void setUser_operator(String user_operator) {
		this.user_operator = user_operator;
	}
	public String getUser_phone_num() {
		return user_phone_num;
	}
	public void setUser_phone_num(String user_phone_num) {
		this.user_phone_num = user_phone_num;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "MemberDTO [user_id=" + user_id + ", user_name=" + user_name + ", user_age=" + user_age + ", user_pw="
				+ user_pw + ", user_email=" + user_email + ", user_nickname=" + user_nickname + ", user_bdate="
				+ user_bdate + ", user_reg_date=" + user_reg_date + ", user_operator=" + user_operator
				+ ", user_phone_num=" + user_phone_num + ", num=" + num + "]";
	}

	
}
