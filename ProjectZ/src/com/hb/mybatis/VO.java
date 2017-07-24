package com.hb.mybatis;

public class VO {
	private String idx, id, pwd;
	public VO() {}
	public VO(String idx, String id, String pwd) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
}
