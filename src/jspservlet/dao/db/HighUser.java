package jspservlet.dao.db;

import java.io.Serializable;
import java.security.SecureRandom;

public class HighUser implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String userId;
	private String passwd;
	private String type = "administrator";
    private static final String SECRET_KEY = "your_secret_key_here"; // Replace with a strong, unique secret key
    private static final int SALT_LENGTH = 16; // 盐的长度
    private static final int HASH_LENGTH = 256; // 生成哈希值的长度
    private static final int ITERATIONS = 10000; // 迭代次数
	
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

	private static byte[] combineSaltAndSecret(byte[] salt) {
        byte[] secretBytes = SECRET_KEY.getBytes();
        byte[] combined = new byte[salt.length + secretBytes.length];
        System.arraycopy(salt, 0, combined, 0, salt.length);
        System.arraycopy(secretBytes, 0, combined, salt.length, secretBytes.length);
        return combined;
    }
	
    public static String getSalt(String uid) {
        String sql = "SELECT salt FROM user WHERE uid = ?";
        try {
            return (String) BasicTool.getScalar(sql, uid);
        } catch (Exception e) {
            System.err.println("Error retrieving salt for user: " + uid);
            e.printStackTrace();
            return null;
        }
    }

}
