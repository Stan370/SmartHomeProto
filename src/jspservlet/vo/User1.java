package jspservlet.vo;

import java.io.Serializable;

public class User1 implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String uid;
	private String password;
	private String family_fid;
	
	
	public User1(String uid, String password, String fid) {
		super();
		this.uid = uid;
		this.password = password;
		this.family_fid = fid;
	}
	
	public User1() {
		super();
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
		return family_fid;
	}

	public void setFid(String fid) {
		this.family_fid = fid;
	}

	@Override
	public String toString() {
		return "/" + uid + "/" + password + "/" + family_fid + "/";
	}

	public String getFamily_fid() {
		return family_fid;
	}
}
