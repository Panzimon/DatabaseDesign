package design.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import design.dao.IProductDAO;
import design.vo.Product;

public class ProductDAOImpl implements IProductDAO {
	private Connection conn;
	private PreparedStatement pstmt = null;

	public ProductDAOImpl(Connection conn) {
		this.conn = conn;
	}

	public List<Product> findAll(Set<Integer> key) throws Exception {
		List<Product> all = new ArrayList<Product>();
		StringBuffer sql = new StringBuffer(); // 循环修改内容的时候使用StringBuffer
		sql.append("SELECT pid,name,note,price,amount FROM product WHERE pid IN (");
		int count = 0;
		Iterator<Integer> iter = key.iterator();
		while (iter.hasNext()) {
			count++;
			sql.append(iter.next());
			if (count <= key.size() - 1) {
				sql.append(",");
			}
		}
		sql.append(")");
		this.pstmt = conn.prepareStatement(sql.toString());
		ResultSet rs = this.pstmt.executeQuery();
		while (rs.next()) {
			Product pro = new Product();
			pro.setPid(rs.getInt(1));
			pro.setName(rs.getString(2));
			pro.setNote(rs.getString(3));
			pro.setPrice(rs.getDouble(4));
			pro.setAmount(rs.getInt(5));
			all.add(pro);
		}
		return all;
	}

	public boolean doCreate(Product vo) throws Exception {
		boolean flag = false;
		String sql = "INSERT INTO product(pid,name,note,price,amount) VALUES (?,?,?,?,?) ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, vo.getPid());
		this.pstmt.setString(2, vo.getName());
		this.pstmt.setString(3, vo.getNote());
		this.pstmt.setDouble(4, vo.getPrice());
		this.pstmt.setInt(5, vo.getAmount());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean doRemove(Integer id) throws Exception {
		boolean flag = false;
		String sql = "DELETE FROM product WHERE pid=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean doUpdate(Product vo) throws Exception {
		boolean flag = false;
		String sql = "UPDATE patient SET name=?,note=?,price=?,amount=? WHERE pid=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, vo.getName());
		this.pstmt.setString(2, vo.getNote());
		this.pstmt.setDouble(3, vo.getPrice());
		this.pstmt.setInt(4, vo.getAmount());
		this.pstmt.setInt(5, vo.getPid());
		if (this.pstmt.executeUpdate() > 0) {
			flag = true;
		}
		return flag;
	}	
	
	public List<Product> findAll(String keyWord) throws Exception {
		List<Product> all = new ArrayList<Product>();
		String sql = "SELECT * FROM (	"
				+ " SELECT pid,name,note,price,amount"
				+ " FROM product WHERE (pid LIKE ? OR name LIKE ? OR note LIKE ? OR price LIKE ? OR amount LIKE ? )  "
				+ " ORDER BY pid) temp ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + keyWord + "%");
		this.pstmt.setString(2, "%" + keyWord + "%");
		this.pstmt.setString(3, "%" + keyWord + "%");
		this.pstmt.setString(4, "%" + keyWord + "%");
		this.pstmt.setString(5, "%" + keyWord + "%");
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Product pro = new Product();
			pro.setPid(rs.getInt(1));
			pro.setName(rs.getString(2));
			pro.setNote(rs.getString(3));
			pro.setPrice(rs.getDouble(4));
			pro.setAmount(rs.getInt(5));
			all.add(pro);
		}
		return all;
	}

	public Product findById(Integer id) throws Exception {
		Product pro = null;
		String sql = "SELECT pid,name,note,price,amount FROM product WHERE pid=?";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, id);
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) {
			pro = new Product() ;
			pro.setPid(rs.getInt(1)) ;
			pro.setName(rs.getString(2)) ;
			pro.setNote(rs.getString(3)) ;
			pro.setPrice(rs.getDouble(4)) ;
			pro.setAmount(rs.getInt(5)) ;
		}
		return pro;
	}

	public long getAllCount(String keyWord) throws Exception {
		long count = 0;
		String sql = "SELECT COUNT(pid) FROM product "
				+ " WHERE name LIKE ? OR note LIKE ? OR price LIKE ? OR amount LIKE ? ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%" + keyWord + "%");
		this.pstmt.setString(2, "%" + keyWord + "%");
		this.pstmt.setString(3, "%" + keyWord + "%");
		this.pstmt.setString(4, "%" + keyWord + "%");
		ResultSet rs = this.pstmt.executeQuery();
		if (rs.next()) { 
			count = rs.getInt(1);
		}
		return count;
	}

}
