package com.skilldistillery.waves.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.skilldistillery.waves.entities.User;
import com.skilldistillery.waves.repositories.UserRepository;

@Service
public class AuthServiceImpl implements AuthService {
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private PasswordEncoder encoder;

	@Override
	public User register(User user) {
		String encodedPW = encoder.encode(user.getPassword());
		user.setPassword(encodedPW); // only persist encoded password

		// set other fields to default values
		user.setEnabled(true);
		user.setRole("standard");

		userRepo.saveAndFlush(user);
		return user;
	}

	@Override
	public User getUser(String username) {
		return userRepo.findByUsername(username);
	}

}
