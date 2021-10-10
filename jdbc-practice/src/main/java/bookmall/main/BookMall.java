package bookmall.main;

import java.util.List;

import bookmall.dao.BookDao;
import bookmall.dao.CartDao;
import bookmall.dao.CategoryDao;
import bookmall.dao.MemberDao;
import bookmall.dao.OrderDao;
import bookmall.vo.BookVo;
import bookmall.vo.CartVo;
import bookmall.vo.CategoryVo;
import bookmall.vo.MemberVo;
import bookmall.vo.OrderVo;

public class BookMall {
	public static void main(String[] args) {
		try {
			setCategory();
			viewCategory();
			Thread.sleep(800);
			
			setBook();
			viewBook();
			Thread.sleep(800);
			
			setMember();
			viewMember();
			Thread.sleep(800);
			
			setCart();
			viewCart();
			Thread.sleep(800);
			
			setOrder();
			viewOrder();
			Thread.sleep(800);
		} catch (InterruptedException e)  {
			System.out.println("ERROR : " + e);
		}
		
	}

	private static void viewOrder() {
		System.out.println("***** Order Display *****");
		List<OrderVo> list = new OrderDao().findAll();
		for (OrderVo vo : list) {
			System.out.println(vo);
		}
	}

	private static void viewCart() {
		System.out.println("***** Cart Display *****");
		List<CartVo> list = new CartDao().findAll();
		for (CartVo vo : list) {
			System.out.println(vo);
		}		
	}

	private static void viewMember() {
		System.out.println("***** View Display *****");
		List<MemberVo> list = new MemberDao().findAll();
		for (MemberVo vo : list) {
			System.out.println(vo);
		}		
	}

	private static void viewBook() {
		System.out.println("***** View Display *****");
		List<BookVo> list = new BookDao().findAll();
		for (BookVo vo : list) {
			System.out.println(vo);
		}		
	}

	private static void viewCategory() {
		System.out.println("***** Category Display *****");
		List<CategoryVo> list = new CategoryDao().findAll();
		for (CategoryVo vo : list) {
			System.out.println(vo);
		}
	}
	
	
	private static void setOrder() {
		OrderVo vo = null;
		OrderDao dao = new OrderDao();		
		// 2번책 1권, 1번책 1권 구매 
		vo = new OrderVo();
		vo.setOrderNumber( "S-20211007-0001" );
		vo.setPayment(30800L); 
		vo.setAddr("부산시 강서구 명지국제5로 11");
		vo.setMemberNo(1L);
		dao.insert(vo);
		
		System.out.println("주문 완료");
	}

	private static void setCart() {
		CartVo vo = null;
		CartDao dao = new CartDao();
	
		vo = new CartVo();
		vo.setCount(3L);
		vo.setMemberNo(1L);
		vo.setBookNo(2L);
		dao.insert(vo);
		
		vo = new CartVo();
		vo.setCount(1L);
		vo.setMemberNo(2L);
		vo.setBookNo(1L);
		dao.insert(vo);
		System.out.println("카트 추가 완료");
		
		
	}

	private static void setMember() {
		MemberVo vo = null;
		MemberDao dao = new MemberDao();
		
		vo = new MemberVo();
		vo.setName("김진영");
		vo.setPhone("01026131862");
		vo.setEmail("jin0kim326@gmail.com");
		vo.setPassword("1234");
		dao.insert(vo);
		
		vo = new MemberVo();
		vo.setName("홍길동");
		vo.setPhone("01026451175");
		vo.setEmail("kildong1175@naver.com");
		vo.setPassword("5678");
		dao.insert(vo);
		System.out.println("회원 추가 완료");
	}

	private static void setBook() {
		BookVo vo = null;
		BookDao dao = new BookDao();
		
		vo = new BookVo();
		vo.setTitle("믿는 인간에 대하여");
		vo.setPrice(14400L);
		vo.setCategoryNo(1L);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("인사이드 자바스크립트");
		vo.setPrice(16200L);
		vo.setCategoryNo(3L);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("부의 시그널");
		vo.setPrice(14400L);
		vo.setCategoryNo(2L);
		dao.insert(vo);
		System.out.println("책 추가 완료");
	}

	private static void setCategory() {
		CategoryVo vo = null;
		CategoryDao dao = new CategoryDao();
	
		vo = new CategoryVo();
		vo.setCategoryName("인문학");
		dao.insert(vo);
		
		vo = new CategoryVo();
		vo.setCategoryName("경제");
		dao.insert(vo);
		
		vo = new CategoryVo();
		vo.setCategoryName("IT/컴퓨터");
		dao.insert(vo);
		System.out.println("카테고리 설정 완료");
	}
	
	

}
