package design.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class Dept implements Serializable {
	private Integer deptno ;
	private String deptname ;
	private String deptloc ;
	private Integer hno;
	private String name ;
	
	public String getname() {
		return name;
	}
	public void setname(String name) {
		this.name = name;
	}
	public Integer gethno() {
		return hno;
	}
	public void sethno(Integer hno) {
		this.hno = hno;
	}
	public Integer getdeptno() {
		return deptno;
	}
	public void setdeptno(Integer deptno) {
		this.deptno = deptno;
	}
	public String getdeptname() {
		return deptname;
	}
	public void setdeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getdeptloc() {
		return deptloc;
	}
	public void setdeptloc(String deptloc) {
		this.deptloc = deptloc;
	}
}
