package com.skilldistillery.waves.services;

import com.skilldistillery.waves.entities.User;

public interface AuthService {
	public User register(User user);

	public User getUser(String username);
}
