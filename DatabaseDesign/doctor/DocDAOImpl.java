package design.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import design.dao.*;
import design.vo.*;

public class DocDAOImpl implements IDocDAO {
	private Connection conn;
	private PreparedStatement pstmt = null;

	public DocDAOImpl(Connection conn) {
		this.conn = conn;
	}

	public boolean doCreate(Doc vo) throws Exception {
		boolean flag = false;
		String sql = "INSERT INTO doctor(docno,name,deptname,worktime,deptno) VALUES (?,?,?,?,?) ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, vo.getdocno());
		this.pstmt.setString(2, vo.getname());
		this.pstmt.setString(3, vo.getdeptname());
		this.pstmt.setString(4, vo.getworktime());
		this.pstmt.setInt(5, vo.getdeptno());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean doRemove(Integer id) throws Exception {
		boolean flag = false;
		String sql = "DELETE FROM doctor WHERE docno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean doUpdate(Doc vo) throws Exception {
		boolean flag = false;
		String sql = "UPDATE doctor SET name=?,deptname=?,worktime=?,deptno=? WHERE docno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, vo.getname());
		this.pstmt.setString(2, vo.getdeptname());
		this.pstmt.setString(3, vo.getworktime());
		this.pstmt.setInt(4, vo.getdeptno());
		this.pstmt.setInt(5,vo.getdocno());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public List<Doc> findAll(String keyWord) throws Exception {
		List<Doc> all = new ArrayList<Doc>();
		String sql = "SELECT e.docno,e.name,e.deptname,e.worktime,e.deptno FROM doctor e"
				+ "  WHERE e.docno LIKE ? OR e.name LIKE ? OR e.worktime LIKE ? "
				+ " OR e.deptname LIKE ? OR e.deptno LIKE ?  ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + keyWord + "%");
		this.pstmt.setString(2, "%" + keyWord + "%");
		this.pstmt.setString(3, "%" + keyWord + "%");
		this.pstmt.setString(4, "%" + keyWord + "%");
		this.pstmt.setString(5, "%" + keyWord + "%");
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Doc doc = new Doc();
			doc.setdocno(rs.getInt(1));
			doc.setname(rs.getString(2));
			doc.setdeptname(rs.getString(3));
			doc.setworktime(rs.getString(4));
			doc.setdeptno(rs.getInt(5));
			all.add(doc);
		}
		return all;
	}

	public Doc findById(Integer id) throws Exception {
		Doc doc = null;
		String sql = "SELECT e.docno,e.name,e.deptname,e.worktime,e.deptno "
				+ " FROM doctor e"
				+ "  WHERE e.docno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			doc = new Doc();
			doc.setdocno(rs.getInt(1));
			doc.setname(rs.getString(2));
			doc.setdeptname(rs.getString(3));
			doc.setworktime(rs.getString(4));
			doc.setdeptno(rs.getInt(5));
		}
		return doc;
	}
	
	public List<Doc> findBydeptno(Integer deptno) throws Exception {
		List<Doc> all = new ArrayList<Doc>();
		String sql = "SELECT e.docno,e.name,e.deptname,e.worktime,e.deptno "
				+ " FROM doctor e"
				+ "  WHERE e.deptno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1,deptno);
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Doc doc = new Doc();
			doc.setdocno(rs.getInt(1));
			doc.setname(rs.getString(2));
			doc.setdeptname(rs.getString(3));
			doc.setworktime(rs.getString(4));
			doc.setdeptno(rs.getInt(5));
			all.add(doc);
		}
		return all;
	}
}

