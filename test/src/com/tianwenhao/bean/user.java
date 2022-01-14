package com.tianwenhao.bean;

public class user {
	private String uid;
	private String password;
	private String fid;
	public user() {
		super();
	}
	public user(String uid, String password, String fid) {
		super();
		this.uid = uid;
		this.password = password;
		this.fid = fid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}

	
	
	
	
}
