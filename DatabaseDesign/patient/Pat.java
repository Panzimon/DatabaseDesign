package design.vo;

import java.io.Serializable;
import java.util.*;

public class Pat implements Serializable {
	private Integer pno;
	private String pname ;
	private Integer age ;
	private Date lastdate ;
	
	public Integer getpno() {
		return pno;
	}
	public void setpno(Integer pno) {
		this.pno= pno;
	}
	public String getpname() {
		return pname;
	}
	public void setpname(String pname) {
		this.pname = pname;
	}
	public Integer getage() {
		return age;
	}
	public void setage(Integer age) {
		this.age = age;
	}
	public Date getlastdate() {
		return lastdate;
	}
	public void setlastdate(Date lastdate) {
		this.lastdate = lastdate;
	}
}
