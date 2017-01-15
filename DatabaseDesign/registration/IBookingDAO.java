package design.dao;

import java.util.*;

import design.vo.Booking;

public interface IBookingDAO extends IDAO<Booking, Integer> {
	
	public boolean doCreate(Booking vo) throws Exception;

	public int doCount(Date date) throws Exception;
	
	public boolean doRemove(Integer pno,Integer deptno)  throws Exception;	
	
	public Booking findById(Integer pno,Integer deptno) throws Exception;	
	
	public List<Booking> findAll() throws Exception;
}
