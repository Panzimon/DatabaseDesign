package design.dao.proxy;

import java.util.List;

import design.dao.IPatDAO;
import design.dao.impl.PatDAOImpl;
import design.dbc.DatabaseConnection;
import design.vo.Pat;

public class PatDAOProxy implements IPatDAO {
	private DatabaseConnection dbc = null;
	private IPatDAO dao = null;
	private long count = 0;

	public PatDAOProxy() {
		this.dbc = new DatabaseConnection();
		this.dao = new PatDAOImpl(this.dbc.getConnection());
	}

	public boolean doCreate(Pat vo) throws Exception {
		boolean flag = false;
		try {
			if (this.dao.findById(vo.getpno()) == null) { // 现在没有查询到雇员信息
				flag = this.dao.doCreate(vo);
			}
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
			flag = this.dao.doRemove(id);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}

	public boolean doUpdate(Pat vo) throws Exception {
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

	public List<Pat> findAll(String keyWord) throws Exception {
		List<Pat> all = null;
		try {
			all = this.dao.findAll(keyWord);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}
	
	public List<Pat> find() throws Exception {
		List<Pat> all = null;
		try {
			all = this.dao.find();
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	public Pat findById(Integer id) throws Exception {
		Pat pat= null;
		try {
			pat= this.dao.findById(id);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return pat;
	}

}
