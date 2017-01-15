package design.dao.proxy;

import java.util.List;

import design.dao.IDocDAO;
import design.dao.impl.DocDAOImpl;
import design.dbc.DatabaseConnection;
import design.vo.Doc;

public class DocDAOProxy implements IDocDAO {
	private DatabaseConnection dbc = null;
	private IDocDAO dao = null;
	private long count = 0;

	public DocDAOProxy() {
		this.dbc = new DatabaseConnection();
		this.dao = new DocDAOImpl(this.dbc.getConnection());
	}

	public boolean doCreate(Doc vo) throws Exception {
		boolean flag = false;
		try {
			if (this.dao.findById(vo.getdocno()) == null) { // 现在没有查询到雇员信息
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

	public boolean doUpdate(Doc vo) throws Exception {
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

	public List<Doc> findAll(String keyWord) throws Exception {
		List<Doc> all = null;
		try {
			all = this.dao.findAll(keyWord);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	public Doc findById(Integer id) throws Exception {
		Doc doc = null;
		try {
			doc = this.dao.findById(id);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return doc;
	}

	public List<Doc> findBydeptno(Integer deptno) throws Exception {
		List<Doc> all = null;
		try {
			all = this.dao.findBydeptno(deptno);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}
}
