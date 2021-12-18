package Model;

public class CalendarVO {
	
	private int User_check_seq;
	private int check_seq;
	private String user_check_result;
	private String MB_ID;
	private String reg_date;
	
	
	public CalendarVO(int user_check_seq, int check_seq, String user_check_result, String mB_ID, String reg_date) {
		super();
		User_check_seq = user_check_seq;
		this.check_seq = check_seq;
		this.user_check_result = user_check_result;
		MB_ID = mB_ID;
		this.reg_date = reg_date;
	}
	public int getUser_check_seq() {
		return User_check_seq;
	}
	public void setUser_check_seq(int user_check_seq) {
		User_check_seq = user_check_seq;
	}
	public int getCheck_seq() {
		return check_seq;
	}
	public void setCheck_seq(int check_seq) {
		this.check_seq = check_seq;
	}
	public String getUser_check_result() {
		return user_check_result;
	}
	public void setUser_check_result(String user_check_result) {
		this.user_check_result = user_check_result;
	}
	public String getMB_ID() {
		return MB_ID;
	}
	public void setMB_ID(String mB_ID) {
		MB_ID = mB_ID;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	
	
	
}
	