package jspservlet.dao.db;

import java.io.Serializable;

public class HighUser implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String userId;
	private String passwd;
	private String type = "administrator";
	
	public HighUser() {
		
	}

	public HighUser(String userId, String passwd, String type) {
		super();
		this.userId = userId;
		this.passwd = passwd;
		this.type = type;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

}
