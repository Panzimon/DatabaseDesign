package design.dao.proxy;

import java.util.List;

import design.dao.IMemberDAO;
import design.dao.impl.MemberDAOImpl;
import design.dbc.DatabaseConnection;
import design.vo.Member;

public class MemberDAOProxy implements IMemberDAO {

	private DatabaseConnection dbc = null;
	private IMemberDAO dao;

	public MemberDAOProxy() {
		this.dbc = new DatabaseConnection();
		this.dao = new MemberDAOImpl(this.dbc.getConnection());
	}

	public boolean findByString(String mid,String answer) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.findByString(mid,answer);
			
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}

	public boolean findLogin(Member vo) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.findLogin(vo);
			
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}

	public boolean doUpdatepassword(String mid,String password) throws Exception {
		boolean flag = false;
		try {
			flag = this.dao.doUpdatepassword(mid,password);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}

	public boolean doCreate(Member vo) throws Exception {
		boolean flag = false;
		try {
			if (this.dao.findById(vo.getAccount()) == null) {
				flag = this.dao.doCreate(vo);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}

	public boolean doUpdate(Member vo) throws Exception {
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

	public Member findById(String id) throws Exception {
		Member mem = null;
		try {
			mem = this.dao.findById(id);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return mem;
	}
}
