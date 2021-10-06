package bookmall.vo;

public class CartVo {
	private Long count;
	private Long memberNo;
	private Long bookNo;
	
	public Long getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Long memberNo) {
		this.memberNo = memberNo;
	}
	public Long getBookNo() {
		return bookNo;
	}
	public void setBookNo(Long bookNo) {
		this.bookNo = bookNo;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "CartVo [count=" + count + ", memberNo=" + memberNo + ", bookNo=" + bookNo + "]";
	}
	
	
	
	
	
}
