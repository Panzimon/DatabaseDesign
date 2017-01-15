package design.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import design.dao.IDeptDAO;
import design.vo.Dept;

public class DeptDAOImpl implements IDeptDAO {
	private Connection conn;
	private PreparedStatement pstmt;

	public DeptDAOImpl(Connection conn) {
		this.conn = conn;
	}

	public boolean doCreate(Dept vo) throws Exception {
		boolean flag = false;
		String sql = "INSERT INTO dept(deptno,deptname,deptloc,hno,name) VALUES (?,?,?,?,?) ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, vo.getdeptno());
		this.pstmt.setString(2, vo.getdeptname());
		this.pstmt.setString(3, vo.getdeptloc());
		this.pstmt.setInt(4, vo.gethno());
		this.pstmt.setString(5, vo.getname());
		
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean doRemove(Integer id) throws Exception {
		boolean flag = false;
		String sql = "DELETE FROM dept WHERE deptno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean doUpdate(Dept vo) throws Exception {
		boolean flag = false;
		String sql = "UPDATE dept SET deptname=?,deptloc=?,hno=?,name=?  WHERE deptno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, vo.getdeptname());
		this.pstmt.setString(2, vo.getdeptloc());
		this.pstmt.setInt(3, vo.gethno());
		this.pstmt.setString(4, vo.getname());
		this.pstmt.setInt(5, vo.getdeptno());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public List<Dept> findAll(String keyWord) throws Exception {
		List<Dept> all = new ArrayList<Dept>();
		String sql = "SELECT deptno,deptname,deptloc,hno,name FROM dept WHERE deptno LIKE ? OR deptname LIKE ? OR deptloc LIKE ? OR hno LIKE ? OR name LIKE ? ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + keyWord + "%");
		this.pstmt.setString(2, "%" + keyWord + "%");
		this.pstmt.setString(3, "%" + keyWord + "%");
		this.pstmt.setString(4, "%" + keyWord + "%");
		this.pstmt.setString(5, "%" + keyWord + "%");
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Dept dept = new Dept();
			dept.setdeptno(rs.getInt(1));
			dept.setdeptname(rs.getString(2));
			dept.setdeptloc(rs.getString(3));
			dept.sethno(rs.getInt(4));
			dept.setname(rs.getString(5));
			all.add(dept);
		}
		return all;
	}

	public Dept findById(Integer id) throws Exception {
		Dept dept = null;
		String sql = "SELECT deptno,deptname,deptloc,hno,name FROM dept WHERE deptno=? ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			dept = new Dept();
			dept.setdeptno(rs.getInt(1));
			dept.setdeptname(rs.getString(2));
			dept.setdeptloc(rs.getString(3));
			dept.sethno(rs.getInt(4));
			dept.setname(rs.getString(5));
		}
		return dept;
	}
}
