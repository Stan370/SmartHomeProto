package jspservlet.dao;

import jspservlet.vo.User;

public interface UserDAO {
	public boolean queryByUsername(User user) throws Exception;

	public int addUser(User user) throws Exception;
}
