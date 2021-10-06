package bookmall.dao.test;

import bookmall.dao.BookDao;
import bookmall.vo.BookVo;

public class BookDaoTest {

	public static void main(String[] args) {
		insertTest();
	}
	
	private static void insertTest() {
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
	}

}
