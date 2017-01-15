package design.dao;

import java.util.List;

import design.vo.Doc;

public interface IDocDAO extends IDAO<Doc, Integer> {
	
	public boolean doCreate(Doc vo) throws Exception;
	
	public boolean doRemove(Integer id) throws Exception;
	
	public boolean doUpdate(Doc vo) throws Exception;
	
	public List<Doc> findAll(String keyWord) throws Exception;
	
	public Doc findById(Integer id) throws Exception;	

	public List<Doc> findBydeptno(Integer deptno) throws Exception;		
}
