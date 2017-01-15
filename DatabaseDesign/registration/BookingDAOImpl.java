package design.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import design.dao.*;
import design.vo.*;

public class BookingDAOImpl implements IBookingDAO {
	private Connection conn;
	private PreparedStatement pstmt = null;

	public BookingDAOImpl(Connection conn) {
		this.conn = conn;
	}

	public boolean doCreate(Booking vo) throws Exception {
		boolean flag = false;
		String sql = "INSERT INTO booking(pno,pname,age,deptno,docno,date) VALUES (?,?,?,?,?,?) ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, vo.getpno());
		this.pstmt.setString(2, vo.getpname());
		this.pstmt.setInt(3, vo.getage());
		this.pstmt.setInt(4, vo.getdeptno());
		this.pstmt.setInt(5, vo.getdocno());
		this.pstmt.setDate(6, new java.sql.Date(vo.getdate().getTime()));
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean doRemove(Integer pno,Integer deptno) throws Exception {
		boolean flag = false;
		String sql = "DELETE FROM booking WHERE pno=? and deptno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, pno);
		this.pstmt.setInt(2, deptno);
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public List<Booking> findAll() throws Exception {
		List<Booking> all = new ArrayList<Booking>();
		String sql = "SELECT * FROM booking";
		this.pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Booking booking= new Booking();
			booking.setpno(rs.getInt(1));
			booking.setpname(rs.getString(2));
			booking.setage(rs.getInt(3));
			booking.setdeptno(rs.getInt(4));
			booking.setdocno(rs.getInt(5));
			booking.setdate(rs.getDate(6));
			all.add(booking);
		}
		return all;
	}

	public Booking findById(Integer pno,Integer deptno) throws Exception {
		Booking booking = null;
		String sql = "SELECT pno,pname,age,deptno,docno,date "
				+ "  FROM booking"
				+ "  WHERE pno=? and deptno=? ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, pno);
		this.pstmt.setInt(2, deptno);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			booking = new Booking();
			booking.setpno(rs.getInt(1));
			booking.setpname(rs.getString(2));
			booking.setage(rs.getInt(3));
			booking.setdeptno(rs.getInt(4));
			booking.setdocno(rs.getInt(5));
			booking.setdate(rs.getDate(6));
		}
		return booking;
	}
	
	public int doCount(Date date) throws Exception{
		int num = 0;
		String sql = "SELECT COUNT(date) FROM booking WHERE DATE_FORMAT(date,'%Y-%m-%d') LIKE ? ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setDate(1,new java.sql.Date(date.getTime()));
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			num = rs.getInt(1);
		}
		return num;
	}
	
}

