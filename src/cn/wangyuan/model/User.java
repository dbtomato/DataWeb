package cn.wangyuan.model;

public class User {
	private String pwd;
	private String name;
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
public User(String name,String pwd) {
       this.name=name;
       this.pwd=pwd;
}
}
