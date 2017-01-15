package design.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import design.dao.IMemberDAO;
import design.vo.Member;

public class MemberDAOImpl implements IMemberDAO {

	private Connection conn;
	private PreparedStatement pstmt;

	public MemberDAOImpl(Connection conn) {
		this.conn = conn;
	}

	public boolean findLogin(Member vo) throws Exception {
		boolean flag = false;
		String sql = "SELECT COUNT(account) FROM member WHERE account=? AND password=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, vo.getAccount());
		this.pstmt.setString(2, vo.getPassword());
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			if (rs.getInt(1) > 0) {
				flag = true;
			}
		}
		return flag;
	}

	public boolean doCreate(Member vo) throws Exception {
		boolean flag = false;
		String sql = "INSERT INTO member(account,password,nickname,signdate,safequestion,safestring) VALUES (?,?,?,?,?,?) ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, vo.getAccount());
		this.pstmt.setString(2, vo.getPassword());
		this.pstmt.setString(3, vo.getNickname());
		this.pstmt.setDate(4, new java.sql.Date(vo.getSigndate().getTime()));
		this.pstmt.setString(5,vo.getSafequestion());
		this.pstmt.setString(6,vo.getSafestring());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean doUpdate(Member vo) throws Exception {
		boolean flag = false;
		String sql = "UPDATE member SET nickname=?,password=?,safequestion=?,safestring=? WHERE account=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, vo.getNickname());
		this.pstmt.setString(2,vo.getPassword());
		this.pstmt.setString(3,vo.getSafequestion());
		this.pstmt.setString(4,vo.getSafestring());
		this.pstmt.setString(5, vo.getAccount());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public Member findById(String id) throws Exception {
		Member mem = null ;
		String sql = "SELECT account,password,nickname,signdate,safequestion,safestring FROM member WHERE account=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, id) ;
		ResultSet rs = this.pstmt.executeQuery() ;
		if(rs.next()){
			mem = new Member() ;
			mem.setAccount(rs.getString(1)) ;
			mem.setPassword(rs.getString(2)) ;
			mem.setNickname(rs.getString(3)) ;
			mem.setSigndate(rs.getDate(4)) ;
			mem.setSafequestion(rs.getString(5));
			mem.setSafestring(rs.getString(6));
		}
		return mem;
	}

	public boolean findByString(String mid,String answer) throws Exception {
		boolean flag = false;
		String sql = "SELECT COUNT(account) FROM member WHERE safestring=? AND account=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1,answer);
		this.pstmt.setString(2,mid);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			if (rs.getInt(1) > 0) {
				flag = true;
			}
		}
		return flag;
	}
	public boolean doUpdatepassword(String mid,String password) throws Exception {
		boolean flag = false;
		String sql = "UPDATE member SET password=? WHERE account=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1,password);
		this.pstmt.setString(2,mid);
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}
}
