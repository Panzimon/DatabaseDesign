package design.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class Room implements Serializable {
	private Integer rno ;
	private String loc ;
	private String aval ;
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
	public Integer getrno() {
		return rno;
	}
	public void setrno(Integer rno) {
		this.rno = rno;
	}
	public String getloc() {
		return loc;
	}
	public void setloc(String loc) {
		this.loc = loc;
	}
	public String getaval() {
		return aval;
	}
	public void setaval(String aval) {
		this.aval = aval;
	}
}
