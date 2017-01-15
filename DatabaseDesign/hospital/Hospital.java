package design.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class Hospital implements Serializable {
	private Integer hno ;
	private String name ;
	private String address;
	private Integer tel ;
	private Integer zipcode ;
	
	public Integer getzipcode() {
		return zipcode;
	}
	public void setzipcode(Integer zipcode) {
		this.zipcode = zipcode;
	}
	public Integer gettel() {
		return tel;
	}
	public void settel(Integer tel) {
		this.tel = tel;
	}
	public Integer gethno() {
		return hno;
	}
	public void sethno(Integer hno) {
		this.hno = hno;
	}
	public String getname() {
		return name;
	}
	public void setname(String name) {
		this.name = name;
	}
	public String getaddress() {
		return address;
	}
	public void setaddress(String address) {
		this.address = address;
	}
}
