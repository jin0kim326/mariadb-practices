package bookmall.vo;

public class OrderVo {
	private Long no;
	private String orderNumber;
	private Long payment;
	private String addr;
	private Long memberNo;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public Long getPayment() {
		return payment;
	}
	public void setPayment(Long payment) {
		this.payment = payment;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Long getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Long memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "OrderVo [no=" + no + ", orderNumber=" + orderNumber + ", payment=" + payment + ", addr=" + addr
				+ ", memberNo=" + memberNo + "]";
	}
	
	
	
}
