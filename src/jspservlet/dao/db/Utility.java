package jspservlet.dao.db;
import jspservlet.vo.User;
import jspservlet.vo.User1;
import org.junit.Test;

import java.util.ArrayList;

public class Utility {
	
	
	@Test
	public void usercheck1() {
		HighUser user = new HighUser();
		String sql = "select uid, (aes_decrypt(password, 'wodemishi') from Administrators where uid = ?";
		HighUser highUserQuery=BasicTool.getInstance(HighUser.class, sql, user.getUserId());
		System.out.println(user.getPasswd().equals(highUserQuery.getPasswd()));;
	}

	public static synchronized Boolean checkUser(User1 user) {

			String sql = "select uid , convert(aes_decrypt(unhex(password), 'wodemishi') using utf8) as password , family_fid from user where uid = ?";
			User1 UserQuery=(User1)BasicTool.getInstance(User1.class, sql, user.getUid());
			if(UserQuery==null)
				return false;
			if(UserQuery.getPassword().equals(user.getPassword()))
				return true;
			else return false;
	}

	public static synchronized Boolean userInsert(User1 user) {
		String sql = "insert into user values(?,hex(aes_encrypt(?, 'wodemishi')),?)";
		Boolean b = BasicTool.insertInstance(sql, user.getUid(), user.getPassword(), user.getFid());
		return b;
		Arrays.stream(A).max().getAsInt()

	}

	public static User1 trans(User user){
		return new User1(user.getUsername(),user.getPassword(),user.getFamilyId());
	}











}
