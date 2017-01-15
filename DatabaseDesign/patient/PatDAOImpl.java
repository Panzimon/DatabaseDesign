package design.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import design.dao.*;
import design.vo.*;

public class PatDAOImpl implements IPatDAO {
	private Connection conn;
	private PreparedStatement pstmt = null;

	public PatDAOImpl(Connection conn) {
		this.conn = conn;
	}

	public boolean doCreate(Pat vo) throws Exception {
		boolean flag = false;
		String sql = "INSERT INTO patient(pno,pname,age,lastdate) VALUES (?,?,?,?) ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, vo.getpno());
		this.pstmt.setString(2, vo.getpname());
		this.pstmt.setInt(3, vo.getage());
		this.pstmt.setDate(4, new java.sql.Date(vo.getlastdate().getTime()));
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean doRemove(Integer id) throws Exception {
		boolean flag = false;
		String sql = "DELETE FROM patient WHERE pno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean doUpdate(Pat vo) throws Exception {
		boolean flag = false;
		String sql = "UPDATE patient SET pname=?,age=?,lastdate=? WHERE pno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, vo.getpname());
		this.pstmt.setInt(2, vo.getage());
		this.pstmt.setDate(3, new java.sql.Date(vo.getlastdate().getTime()));
		this.pstmt.setInt(4,vo.getpno());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public List<Pat> findAll(String keyWord) throws Exception {
		List<Pat> all = new ArrayList<Pat>();
		String sql = "SELECT pno,pname,age,lastdate FROM patient"
				+ "  WHERE pno like ? or pname like ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, keyWord);
		this.pstmt.setString(2, keyWord);
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Pat pat= new Pat();
			pat.setpno(rs.getInt(1));
			pat.setpname(rs.getString(2));
			pat.setage(rs.getInt(3));
			pat.setlastdate(rs.getDate(4));
			all.add(pat);
		}
		return all;
	}

	public List<Pat> find() throws Exception {
		List<Pat> all = new ArrayList<Pat>();
		String sql = "SELECT pno,pname,age,lastdate FROM patient";
		this.pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Pat pat= new Pat();
			pat.setpno(rs.getInt(1));
			pat.setpname(rs.getString(2));
			pat.setage(rs.getInt(3));
			pat.setlastdate(rs.getDate(4));
			all.add(pat);
		}
		return all;
	}
	
	public Pat findById(Integer id) throws Exception {
		Pat pat = null;
		String sql = "SELECT e.pno,e.pname,e.age,e.lastdate "
				+ " FROM patient e"
				+ "  WHERE e.pno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			pat = new Pat();
			pat.setpno(rs.getInt(1));
			pat.setpname(rs.getString(2));
			pat.setage(rs.getInt(3));
			pat.setlastdate(rs.getDate(4));
		}
		return pat;
	}
}

