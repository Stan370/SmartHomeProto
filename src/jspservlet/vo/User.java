package jspservlet.vo;

public class User {
	private String username;
	private String password;
	private String familyId;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public String getFamilyId() {
		return familyId;
	}

	public void setFamilyId(String familyId) {
		this.familyId = familyId;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
