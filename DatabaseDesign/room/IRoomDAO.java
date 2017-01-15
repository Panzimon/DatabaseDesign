package design.dao;

import java.util.List;

import design.vo.Room;

public interface IRoomDAO extends IDAO<Room, Integer> {

	public boolean doCreate(Room vo) throws Exception;
	
	public boolean doRemove(Integer id) throws Exception;
	
	public boolean doUpdate(Room vo) throws Exception;
	
	public List<Room> findAll(String keyWord) throws Exception;
		
	public Room findById(Integer id) throws Exception;
}
