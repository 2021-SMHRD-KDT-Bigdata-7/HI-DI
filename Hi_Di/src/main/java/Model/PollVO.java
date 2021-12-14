package Model;

public class PollVO {

	private int poll_seq;
	private String poll_title;
	private String poll_content;
	private String mb_id;
	private String reg_date;
	
	
	public PollVO(int poll_seq, String poll_title, String poll_content, String mb_id, String reg_date) {
		super();
		this.poll_seq = poll_seq;
		this.poll_title = poll_title;
		this.poll_content = poll_content;
		this.mb_id = mb_id;
		this.reg_date = reg_date;
	}


	public int getPoll_seq() {
		return poll_seq;
	}


	public void setPoll_seq(int poll_seq) {
		this.poll_seq = poll_seq;
	}


	public String getPoll_title() {
		return poll_title;
	}


	public void setPoll_title(String poll_title) {
		this.poll_title = poll_title;
	}


	public String getPoll_content() {
		return poll_content;
	}


	public void setPoll_content(String poll_content) {
		this.poll_content = poll_content;
	}


	public String getMb_id() {
		return mb_id;
	}


	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}


	public String getReg_date() {
		return reg_date;
	}


	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	
	
}
