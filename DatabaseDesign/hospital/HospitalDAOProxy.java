package design.dao.proxy;

import java.util.HashMap;
import java.util.List;

import design.dao.*;
import design.dao.impl.*;
import design.dbc.DatabaseConnection;
import design.vo.Hospital;

public class HospitalDAOProxy implements IHospitalDAO {
	private DatabaseConnection dbc = null;
	private IHospitalDAO dao = null;

	public HospitalDAOProxy() {
		this.dbc = new DatabaseConnection();
		this.dao = new HospitalDAOImpl(this.dbc.getConnection());
	}

	public boolean doCreate(Hospital vo) throws Exception {
		boolean flag = false;
		try {
			if (this.dao.findById(vo.gethno()) == null) {
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

	public boolean doUpdate(Hospital vo) throws Exception {
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

	public List<Hospital> findAll(String keyWord) throws Exception {
		List<Hospital> all = null;
		try {
			all = this.dao.findAll(keyWord);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	public Hospital findById(Integer id) throws Exception {
		Hospital hospital = null;
		try {
			hospital = this.dao.findById(id);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return hospital;
	}
}
