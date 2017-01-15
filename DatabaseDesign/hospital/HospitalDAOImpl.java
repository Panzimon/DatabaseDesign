package design.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import design.dao.IHospitalDAO;
import design.vo.Hospital;

public class HospitalDAOImpl implements IHospitalDAO {
	private Connection conn;
	private PreparedStatement pstmt;

	public HospitalDAOImpl(Connection conn) {
		this.conn = conn;
	}

	public boolean doCreate(Hospital vo) throws Exception {
		boolean flag = false;
		String sql = "INSERT INTO hospital(hno,name,address,tel,zipcode) VALUES (?,?,?,?,?) ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, vo.gethno());
		this.pstmt.setString(2, vo.getname());
		this.pstmt.setString(3, vo.getaddress());
		this.pstmt.setInt(4, vo.gettel());
		this.pstmt.setInt(5, vo.getzipcode());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean doRemove(Integer id) throws Exception {
		boolean flag = false;
		String sql = "DELETE FROM Hospital WHERE hno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean doUpdate(Hospital vo) throws Exception {
		boolean flag = false;
		String sql = "UPDATE hospital SET name=?,address=?,tel=?,zipcode=? WHERE hno=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1,vo.getname());
		this.pstmt.setString(2,vo.getaddress());
		this.pstmt.setInt(3,vo.gettel());
		this.pstmt.setInt(4,vo.getzipcode());
		this.pstmt.setInt(5, vo.gethno());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public List<Hospital> findAll(String keyWord) throws Exception {
		List<Hospital> all = new ArrayList<Hospital>();
		String sql = "SELECT hno,name,address,tel,zipcode FROM hospital WHERE hno LIKE ? OR name LIKE ? OR address LIKE ? OR tel LIKE ? OR zipcode LIKE ?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + keyWord + "%");
		this.pstmt.setString(2, "%" + keyWord + "%");
		this.pstmt.setString(3, "%" + keyWord + "%");
		this.pstmt.setString(4,"%" + keyWord + "%");
		this.pstmt.setString(5,"%" + keyWord + "%");
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Hospital hospital = new Hospital();
			hospital.sethno(rs.getInt(1));
			hospital.setname(rs.getString(2));
			hospital.setaddress(rs.getString(3));
			hospital.settel(rs.getInt(4));
			hospital.setzipcode(rs.getInt(5));		
			all.add(hospital);
		}
		return all;
	}

	public Hospital findById(Integer id) throws Exception {
		Hospital hospital = null;
		String sql = "SELECT hno,name,address,tel,zipcode FROM hospital WHERE hno=? ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			hospital = new Hospital();
			hospital.sethno(rs.getInt(1));
			hospital.setname(rs.getString(2));
			hospital.setaddress(rs.getString(3));
			hospital.settel(rs.getInt(4));
			hospital.setzipcode(rs.getInt(5));			
		}
		return hospital;
	}

}
