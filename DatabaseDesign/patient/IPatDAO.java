package design.dao;

import java.util.List;

import design.vo.Pat;

public interface IPatDAO extends IDAO<Pat, Integer> {
	
	public boolean doCreate(Pat vo) throws Exception;
	
	public boolean doRemove(Integer id) throws Exception;
	
	public boolean doUpdate(Pat vo) throws Exception;
	
	public List<Pat> findAll(String keyWord) throws Exception;

	public List<Pat> find() throws Exception;
	
	public Pat findById(Integer id) throws Exception;		
}
