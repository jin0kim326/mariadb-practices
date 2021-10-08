package bookmall.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookmall.vo.MemberVo;
import bookmall.vo.OrderVo;

public class OrderDao {
	public List<OrderVo> findAll() {
		List<OrderVo> result = new  ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
//			SQL 준비
			String sql = "SELECT o.no,"
					+ "	   	     o.order_number AS 주문번호,"
					+ "       	 o.payment AS 결제금액,"
					+ "       	 o.addr AS 주소,"
					+ "       	 o.member_no AS 고객번호"
					+ "     FROM `order` o,"
					+ "       	 member m"
					+ "    WHERE o.member_no = m.no";
			
			pstmt = conn.prepareStatement(sql);
			
			//5. SQL 실행
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Long no = rs.getLong(1);
				String order_number = rs.getString(2);
				Long payment = rs.getLong(3);
				String addr = rs.getString(4);
				Long member_no = rs.getLong(5);
				
				OrderVo vo = new OrderVo();
				vo.setNo(no);
				vo.setOrderNumber(order_number);
				vo.setPayment(payment);
				vo.setAddr(addr);
				vo.setMemberNo(member_no);
				
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
	
	public boolean insert(OrderVo vo) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			
			//SQL 준비
			String sql = "INSERT INTO `order` values (null, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			//바인딩 (binding)
			pstmt.setString(1, vo.getOrderNumber());
			pstmt.setLong(2, vo.getPayment());
			pstmt.setString(3, vo.getAddr());
			pstmt.setLong(4, vo.getMemberNo());
								
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
