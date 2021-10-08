package bookmall.dao.test;

import java.util.List;

import bookmall.dao.OrderDao;
import bookmall.vo.OrderVo;

public class OrderTest {
	public static void main(String[] args) {
//		insertTest();
		findAllTest();
	}
	
	private static void findAllTest() {
		List<OrderVo> list = new OrderDao().findAll();
		for (OrderVo vo : list) {
			System.out.println(vo);
		}
	} 
	
	private static void insertTest() {
		OrderVo vo = null;
		OrderDao dao = new OrderDao();		
		// 2번책 1권, 1번책 1권 구매 
		vo = new OrderVo();
		vo.setOrderNumber( "S-20211007-0001" );
		vo.setPayment(30800L); 
		vo.setAddr("부산시 강서구 명지국제5로 11");
		vo.setMemberNo(1L);
		dao.insert(vo);
	}
	
//	private static String makeOrderNumber(int id) {
//		String result = null;
//		// 현재 날짜 구하기
//		LocalDateTime now = LocalDateTime.now();
//		LocalDateTime ldt = LocalDateTime.of(now.getYear(),
//		now.getMonth(), now.getDayOfMonth(), now.getHour(), now.getMinute(), now.getSecond());
//		// 포맷 정의
//
//		// 포맷 적용
//		String formatedNow = now.format(formatter);
//		result = "S-" + formatedNow +"-"+id;   
//				
//		return result;
//	}
}
