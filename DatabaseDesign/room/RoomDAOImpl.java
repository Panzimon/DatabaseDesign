package design.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import design.dao.IRoomDAO;
import design.vo.Room;

public class RoomDAOImpl implements IRoomDAO {
	private Connection conn;
	private PreparedStatement pstmt;

	public RoomDAOImpl(Connection conn) {
		this.conn = conn;
	}

	public boolean doCreate(Room vo) throws Exception {
		boolean flag = false;
		String sql = "INSERT INTO room(rno,loc,aval,hno,name) VALUES (?,?,?,?,?) ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, vo.getrno());
		this.pstmt.setString(2, vo.getloc());
		this.pstmt.setString(3, vo.getaval());
		this.pstmt.setInt(4, vo.gethno());
		this.pstmt.setString(5, vo.getname());
		
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean doRemove(Integer id) throws Exception {
		boolean flag = false;
		String sql = "DELETE FROM room WHERE rno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean doUpdate(Room vo) throws Exception {
		boolean flag = false;
		String sql = "UPDATE room SET loc=?,aval=?,hno=?,name=?  WHERE rno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, vo.getloc());
		this.pstmt.setString(2, vo.getaval());
		this.pstmt.setInt(3, vo.gethno());
		this.pstmt.setString(4, vo.getname());
		this.pstmt.setInt(5, vo.getrno());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public List<Room> findAll(String keyWord) throws Exception {
		List<Room> all = new ArrayList<Room>();
		String sql = "SELECT rno,loc,aval,hno,name FROM room WHERE rno LIKE ? OR loc LIKE ? OR aval LIKE ? OR hno LIKE ? OR name LIKE ? ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + keyWord + "%");
		this.pstmt.setString(2, "%" + keyWord + "%");
		this.pstmt.setString(3, "%" + keyWord + "%");
		this.pstmt.setString(4, "%" + keyWord + "%");
		this.pstmt.setString(5, "%" + keyWord + "%");
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Room room = new Room();
			room.setrno(rs.getInt(1));
			room.setloc(rs.getString(2));
			room.setaval(rs.getString(3));
			room.sethno(rs.getInt(4));
			room.setname(rs.getString(5));
			all.add(room);
		}
		return all;
	}

	public Room findById(Integer id) throws Exception {
		Room room = null;
		String sql = "SELECT rno,loc,aval,hno,name FROM Room WHERE rno=? ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			room = new Room();
			room.setrno(rs.getInt(1));
			room.setloc(rs.getString(2));
			room.setaval(rs.getString(3));
			room.sethno(rs.getInt(4));
			room.setname(rs.getString(5));
		}
		return room;
	}
}
