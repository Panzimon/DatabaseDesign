package design.dao;

import java.util.List;

import design.vo.Hospital;

public interface IHospitalDAO extends IDAO<Hospital, Integer> {
	
	public boolean doCreate(Hospital vo) throws Exception;
	
	public boolean doRemove(Integer id) throws Exception;
	
	public boolean doUpdate(Hospital vo) throws Exception;	
	
	public Hospital findById(Integer id)  throws Exception;

	public List<Hospital> findAll(String keyWord) throws Exception;
}
