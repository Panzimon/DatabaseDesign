package design.dao.proxy;

import java.util.HashMap;
import java.util.List;

import design.dao.*;
import design.dao.impl.*;
import design.dbc.DatabaseConnection;
import design.vo.Dept;

public class DeptDAOProxy implements IDeptDAO {
	private DatabaseConnection dbc = null;
	private IDeptDAO dao = null;

	public DeptDAOProxy() {
		this.dbc = new DatabaseConnection();
		this.dao = new DeptDAOImpl(this.dbc.getConnection());
	}

	public boolean doCreate(Dept vo) throws Exception {
		boolean flag = false;
		try {
			if (this.dao.findById(vo.getdeptno()) == null) {
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

	public boolean doUpdate(Dept vo) throws Exception {
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

	public List<Dept> findAll(String keyWord) throws Exception {
		List<Dept> all = null;
		try {
			all = this.dao.findAll(keyWord);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	public Dept findById(Integer id) throws Exception {
		Dept dept = null;
		try {
			dept = this.dao.findById(id);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return dept;
	}
}
