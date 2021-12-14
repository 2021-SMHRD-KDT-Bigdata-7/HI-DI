package Model;

public class Poll_itemsVO {

	private int item_seq;
	private int poll_seq;
	private String item_name;
	private String item_content;
	
	
	public Poll_itemsVO(int item_seq, int poll_seq, String item_name, String item_content) {
		super();
		this.item_seq = item_seq;
		this.poll_seq = poll_seq;
		this.item_name = item_name;
		this.item_content = item_content;
	}


	public int getItem_seq() {
		return item_seq;
	}


	public void setItem_seq(int item_seq) {
		this.item_seq = item_seq;
	}


	public int getPoll_seq() {
		return poll_seq;
	}


	public void setPoll_seq(int poll_seq) {
		this.poll_seq = poll_seq;
	}


	public String getItem_name() {
		return item_name;
	}


	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}


	public String getItem_content() {
		return item_content;
	}


	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}
	
	
	
	
	
	
}
