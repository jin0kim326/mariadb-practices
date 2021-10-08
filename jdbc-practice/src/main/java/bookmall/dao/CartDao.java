package bookmall.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookmall.vo.CartVo;
import bookmall.vo.CategoryVo;

public class CartDao {
	public List<CartVo> findAll() {
		List<CartVo> result = new  ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
//			SQL 준비
			String sql = "SELECT ca.count AS 수량,"
					+ "			 ca.member_no AS 고객번호,"
					+ "			 ca.book_no AS 도서번호"
					+ "     FROM cart ca,"
					+ "          book b,"
					+ "          member m"
					+ "    WHERE ca.member_no = m.no"
					+ "      AND ca.book_no = b.no";
			
			pstmt = conn.prepareStatement(sql);
			
			//5. SQL 실행
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Long count = rs.getLong(1);
				Long member_no = rs.getLong(2);
				Long book_no = rs.getLong(3);
				
				
				CartVo vo = new CartVo();
				vo.setCount(count);
				vo.setMemberNo(member_no);
				vo.setBookNo(book_no);
				result.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if ( conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return result;
	}

	public boolean insert(CartVo vo) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			
			//SQL 준비
			String sql = "INSERT INTO cart values (?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			//바인딩 (binding)
			pstmt.setLong(1, vo.getCount());
			pstmt.setLong(2, vo.getMemberNo());
			pstmt.setLong(3, vo.getBookNo());
								
			//5. SQL 실행
			int count = pstmt.executeUpdate();
			
			result = count == 1;
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if ( conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return result;
	}
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			// 1. JDBC Driver 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			// 2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/bookmall?charset=utf8";
			conn = DriverManager.getConnection(url, "bookmall", "bookmall");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: "+e);
		}
		return conn;
	}

}
