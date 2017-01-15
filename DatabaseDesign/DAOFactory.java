package design.factory;

import design.dao.*;
import design.dao.proxy.*;


public class DAOFactory {

	public static IMemberDAO getIMemberDAOInstance(){
		return new MemberDAOProxy() ; 
	}
	public static IHospitalDAO getIHospitalDAOInstance(){
		return new HospitalDAOProxy() ; 
	}
	public static IDeptDAO getIDeptDAOInstance(){
		return new DeptDAOProxy() ; 
	}	
	public static IDocDAO getIDocDAOInstance(){
		return new DocDAOProxy() ; 
	}	
	public static IRoomDAO getIRoomDAOInstance(){
		return new RoomDAOProxy() ; 
	}		
	public static IPatDAO getIPatDAOInstance(){
		return new PatDAOProxy() ; 
	}
	public static IProductDAO getIProductDAOInstance(){
		return new ProductDAOProxy() ; 
	}
	public static IBookingDAO getIBookingDAOInstance(){
		return new BookingDAOProxy() ; 
	}		
}
