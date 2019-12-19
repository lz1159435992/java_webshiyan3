package service;

import dao.UserDao;
import domain.User;

public class UserService{
	private UserDao userDao = new UserDao();

	public Boolean registerUser(User user) {
		if (userDao.find(user.getUsername(),user.getPassword())==null) {
			userDao.add(user);
			return true;
		}
		else
			return false;
	}

	public User loginUser(String username, String password) {
		return userDao.find(username, password);
	}
}
