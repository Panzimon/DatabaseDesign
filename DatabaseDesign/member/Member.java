package design.vo;

import java.io.Serializable;
import java.util.Date;

public class Member implements Serializable {
	private String account;
	private String password ;
	private String nickname ;
	private Date signdate ;
	private String safequestion;
	private String safestring;
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getSigndate() {
		return signdate;
	}
	public void setSigndate(Date signdate) {
		this.signdate = signdate;
	}
	public void setSafequestion(String safequestion) {
		this.safequestion = safequestion;
	}
	public String getSafequestion() {
		return safequestion;
	}
	public void setSafestring(String safestring) {
		this.safestring = safestring;
	}
	public String getSafestring() {
		return safestring;
	}
	
}
