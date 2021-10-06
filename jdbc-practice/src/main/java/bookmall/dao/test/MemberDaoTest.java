package bookmall.dao.test;

import bookmall.dao.MemberDao;
import bookmall.vo.BookVo;
import bookmall.vo.MemberVo;

public class MemberDaoTest {
		public static void main(String[] args) {
			insertTest();
		}
		
		private static void insertTest() {
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
			
		}
	}

