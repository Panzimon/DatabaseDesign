package design.vo;

import java.io.Serializable;
import java.util.*;

public class Doc implements Serializable {
	private Integer docno ;
	private String name ;
	private String deptname ;
	private String worktime ;
	private Integer deptno;
	
	public Integer getdocno() {
		return docno;
	}
	public void setdocno(Integer docno) {
		this.docno = docno;
	}
	public String getname() {
		return name;
	}
	public void setname(String name) {
		this.name = name;
	}
	public String getdeptname() {
		return deptname;
	}
	public void setdeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getworktime() {
		return worktime;
	}
	public void setworktime(String worktime) {
		this.worktime = worktime;
	}
	public Integer getdeptno() {
		return deptno;
	}
	public void setdeptno(Integer deptno) {
		this.deptno = deptno;
	}
}
