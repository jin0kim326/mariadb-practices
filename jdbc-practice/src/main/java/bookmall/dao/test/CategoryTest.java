package bookmall.dao.test;

import bookmall.dao.CategoryDao;
import bookmall.vo.CategoryVo;

public class CategoryTest {
	public static void main(String[] args) {
		insertTest();
	}
	
	private static void insertTest() {
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
		
	}

}
