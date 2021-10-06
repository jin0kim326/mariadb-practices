package bookmall.dao.test;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import bookmall.dao.OrderDao;
import bookmall.vo.OrderVo;

public class OrderTest {
	static int orderId = 0;
	public static void main(String[] args) {
		insertTest();
	}
	
	private static void insertTest() {
		OrderVo vo = null;
		OrderDao dao = new OrderDao();		
		// 2번책 1권, 1번책 1권 구매 
		vo = new OrderVo();
		vo.setOrderNumber( makeOrderNumber(orderId) );
		orderId++;
		vo.setPayment(30800L); 
		vo.setAddr("부산시 강서구 명지국제5로 11");
		vo.setMemberNo(1L);
		dao.insert(vo);
	}
	
	private static String makeOrderNumber(int id) {
		String result = null;
		// 현재 날짜 구하기
		LocalDate now = LocalDate.now();
		// 포맷 정의
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		// 포맷 적용
		String formatedNow = now.format(formatter);
		result = "S-" + formatedNow +"-"+id;   
				
		return result;
	}
}
