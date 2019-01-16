package com.hand.user.service;

import com.hand.user.po.User;

public interface UserService {
	public User login(String userName, String password);
	public boolean updateUser(User u);
	
	public User getUserInfo(int userId);
	public boolean password(User u);
}
