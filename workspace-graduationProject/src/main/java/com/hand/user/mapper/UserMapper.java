package com.hand.user.mapper;

import com.hand.user.po.User;

import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
		public User login(User u);
		public int updateUser(User u);
		public User getUserInfo(int userId);
		public int password(User u);
}
