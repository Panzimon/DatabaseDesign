package design.dao.proxy;

import java.util.HashMap;
import java.util.List;

import design.dao.*;
import design.dao.impl.*;
import design.dbc.DatabaseConnection;
import design.vo.Room;

public class RoomDAOProxy implements IRoomDAO {
	private DatabaseConnection dbc = null;
	private IRoomDAO dao = null;

	public RoomDAOProxy() {
		this.dbc = new DatabaseConnection();
		this.dao = new RoomDAOImpl(this.dbc.getConnection());
	}

	public boolean doCreate(Room vo) throws Exception {
		boolean flag = false;
		try {
			if (this.dao.findById(vo.getrno()) == null) {
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

	public boolean doUpdate(Room vo) throws Exception {
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

	public List<Room> findAll(String keyWord) throws Exception {
		List<Room> all = null;
		try {
			all = this.dao.findAll(keyWord);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return all;
	}

	public Room findById(Integer id) throws Exception {
		Room room = null;
		try {
			room = this.dao.findById(id);
		} catch (Exception e) {
			throw e;
		} finally {
			this.dbc.close();
		}
		return room;
	}
}
