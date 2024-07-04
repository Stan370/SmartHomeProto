package jspservlet.dao.db;

import jspservlet.vo.User;
import jspservlet.vo.User1;
import org.junit.Test;
import java.security.SecureRandom;
import java.util.Base64;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.security.spec.KeySpec;
import java.util.Arrays;

public class Utility {

    private static final int ITERATIONS = 65536;
    private static final int KEY_LENGTH = 256;

    @Test
    public void usercheck1() {
        HighUser user = new HighUser();
        String sql = "SELECT uid, password, salt FROM Administrators WHERE uid = ?";
        HighUser highUserQuery = BasicTool.getInstance(HighUser.class, sql, user.getUserId());
        
        if (highUserQuery != null) {
            boolean passwordMatch = verifyPassword(user.getPasswd(), highUserQuery.getPasswd(), highUserQuery.getSalt());
            System.out.println("Password match: " + passwordMatch);
        } else {
            System.out.println("User not found");
        }
    }

    public static synchronized Boolean checkUser(User1 user) {
        String sql = "SELECT uid, password, salt FROM user WHERE uid = ?";
        User1 userQuery = (User1) BasicTool.getInstance(User1.class, sql, user.getUid());
        
        if (userQuery == null) {
            return false;
        }
        
        return verifyPassword(user.getPassword(), userQuery.getPassword(), userQuery.getSalt());
    }

    public static synchronized Boolean userInsert(User1 user) {
        byte[] salt = generateSalt();
        String hashedPassword = hashPassword(user.getPassword(), salt);
        
        String sql = "INSERT INTO user (uid, password, salt, fid) VALUES (?, ?, ?, ?)";
        return BasicTool.insertInstance(sql, user.getUid(), hashedPassword, Base64.getEncoder().encodeToString(salt), user.getFid());
    }

    public static User1 trans(User user) {
        return new User1(user.getUsername(), user.getPassword(), user.getFamilyId());
    }

    private static byte[] generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);
        return salt;
    }

    private static String hashPassword(String password, byte[] salt) {
        try {
            KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, ITERATIONS, KEY_LENGTH);
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            byte[] hash = factory.generateSecret(spec).getEncoded();
            return Base64.getEncoder().encodeToString(hash);
        } catch (Exception e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }

    private static boolean verifyPassword(String inputPassword, String storedPassword, String storedSalt) {
        byte[] salt = Base64.getDecoder().decode(storedSalt);
        String hashedInputPassword = hashPassword(inputPassword, salt);
        return hashedInputPassword.equals(storedPassword);
    }
}