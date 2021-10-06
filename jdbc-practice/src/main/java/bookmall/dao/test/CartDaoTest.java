package bookmall.dao.test;

import bookmall.dao.CartDao;
import bookmall.vo.CartVo;
import bookmall.vo.CategoryVo;

public class CartDaoTest {
	public static void main(String[] args) {
		insertTest();
	}
	
	private static void insertTest() {
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
		
	}
}
