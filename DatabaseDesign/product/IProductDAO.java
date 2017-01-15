package design.dao;

import java.util.List;
import java.util.Set;

import design.vo.Product;

public interface IProductDAO extends IDAO<Product, Integer> {
	
	public List<Product> findAll(Set<Integer> key) throws Exception;

	public long getAllCount(String keyWord) throws Exception;
	
	public boolean doCreate(Product vo) throws Exception;
	
	public boolean doUpdate(Product vo) throws Exception ;
 	
 	public boolean doRemove(Integer id) throws Exception;
 	
 	public List<Product> findAll(String keyWord) throws Exception;
 	
	public Product findById(Integer id) throws Exception; 	
}
