package com.dao;

import java.util.List;

import com.model.User;

public interface UserDao {
	public void saveUser(User user);
	public User getUser(int id);
	public List<User> allUsers();
	public void updateUser(User user);
	public void deleteUser(int id);
}