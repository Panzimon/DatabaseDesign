package design.dao.proxy;

import java.util.List;
import java.util.Set;

import design.dao.IProductDAO;
import design.dao.impl.ProductDAOImpl;
import design.dbc.DatabaseConnection;
import design.vo.Product;

public class ProductDAOProxy implements IProductDAO {
	private DatabaseConnection dbc = null;
	private IProductDAO dao = null;
	private long count = 0;

	public ProductDAOProxy() {
		this.dbc = new DatabaseConnection();
		this.dao = new ProductDAOImpl(this.dbc.getConnection());
	}

	public List<Product> findAll(Set<Integer> key) throws Exception {
		List<Product> all = null;
		try {
			all = this.dao.findAll(key);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	public boolean doCreate(Product vo) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.doCreate(vo);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}

	public boolean doRemove(Integer id) throws Exception {
		boolean flag = false;
		try {
			flag = this.doRemove(id);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}

	public boolean doUpdate(Product vo) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.doUpdate(vo);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}

	public List<Product> findAll(String keyWord) throws Exception {
		List<Product> all = null;
		try {
			all = this.dao.findAll(keyWord);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	public Product findById(Integer id) throws Exception {
		Product pro = null;
		try {
			pro = this.dao.findById(id);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return pro;
	}

	public long getAllCount(String keyWord) throws Exception {
		return this.count;
	}

}
