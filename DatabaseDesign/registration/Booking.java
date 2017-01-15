package design.vo;

import java.io.Serializable;
import java.util.*;

public class Booking implements Serializable {
	private Integer pno;
	private String pname ;
	private Integer age ;
	private Integer deptno;
	private Integer docno ;
	private Date date ;
	
	public Integer getdocno() {
		return docno;
	}
	public void setdocno(Integer docno) {
		this.docno= docno;
	}	
	public Integer getdeptno() {
		return deptno;
	}
	public void setdeptno(Integer deptno) {
		this.deptno= deptno;
	}
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
	public Date getdate() {
		return date;
	}
	public void setdate(Date date) {
		this.date = date;
	}
}
