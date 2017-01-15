package design.dao;

import design.vo.Member;

public interface IMemberDAO extends IDAO<Member, String> {
	public boolean findLogin(Member vo) throws Exception;
	
	public boolean doCreate(Member member) throws Exception;
	
	public Member findById(String id) throws Exception;
	
	public boolean doUpdate(Member vo) throws Exception ;
	
	public boolean doUpdatepassword(String mid,String password) throws Exception ;
	
	public boolean findByString(String mid,String answer) throws Exception;
}
