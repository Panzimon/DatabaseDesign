package design.dao;

import java.util.List;

import design.vo.Dept;

public interface IDeptDAO extends IDAO<Dept, Integer> {

	public boolean doCreate(Dept vo) throws Exception;
	
	public boolean doRemove(Integer id) throws Exception;
	
	public boolean doUpdate(Dept vo) throws Exception;
	
	public List<Dept> findAll(String keyWord) throws Exception;
		
	public Dept findById(Integer id) throws Exception;
}
