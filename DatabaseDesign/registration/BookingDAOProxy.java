package design.dao.proxy;

import java.util.*;

import design.dao.IBookingDAO;
import design.dao.impl.BookingDAOImpl;
import design.dbc.DatabaseConnection;
import design.vo.Booking;

public class BookingDAOProxy implements IBookingDAO {
	private DatabaseConnection dbc = null;
	private IBookingDAO dao = null;
	private long count = 0;

	public BookingDAOProxy() {
		this.dbc = new DatabaseConnection();
		this.dao = new BookingDAOImpl(this.dbc.getConnection());
	}

	public boolean doCreate(Booking vo) throws Exception {
		boolean flag = false;
		try {
			if (this.dao.findById(vo.getpno(),vo.getdeptno()) == null) { 
				flag = this.dao.doCreate(vo);//同一科同一个病人不能同时挂两个号
			}
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}

	public boolean doRemove(Integer pno,Integer deptno)  throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.doRemove(pno,deptno);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}

	public List<Booking> findAll() throws Exception {
		List<Booking> all = null;
		try {
			all = this.dao.findAll();
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	public Booking findById(Integer pno,Integer deptno) throws Exception {
		Booking booking= null;
		try {
			booking= this.dao.findById(pno,deptno);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return booking;
	}
	
	public int doCount(Date date) throws Exception{
		int num = 0;
		try {
			num = this.dao.doCount(date);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return num;
	}
}
