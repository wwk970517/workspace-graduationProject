package com.hand.user.service.impl;

import com.hand.user.mapper.UserMapper;
import com.hand.user.po.User;
import com.hand.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

	@Autowired(required = true)
	private UserMapper userMapper;
	
	@Override
	public User login(String userName, String password) {
		User user=new User();
		user.setUserName(userName);
		user.setPassword(password);
		System.out.println(user.getUserName());
		User user1 = userMapper.login(user);
		System.out.println(user1.getCreationDate());
		return user1;
	}

	@Override
	public boolean updateUser(User u) {
		int rows=userMapper.updateUser(u);
		if(rows>=1) return true;
		else return false;
	}

	@Override
	public User getUserInfo(int userId) {
		User user=userMapper.getUserInfo(userId);
		return user;
	}

	@Override
	public boolean password(User u) {
		int rows =userMapper.password(u);
		if(rows>=1) return true;
		else return false;
	}

}
