package com.skilldistillery.waves.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.skilldistillery.waves.entities.Location;
import com.skilldistillery.waves.entities.User;
import com.skilldistillery.waves.repositories.LocationRepository;
import com.skilldistillery.waves.repositories.UserRepository;

@Service
public class AuthServiceImpl implements AuthService {
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private LocationRepository localRepo;
	
	@Autowired
	private PasswordEncoder encoder;
	

	@Override
	public User register(User user) {
		String encodedPW = encoder.encode(user.getPassword());
		user.setPassword(encodedPW); // only persist encoded password

		// set other fields to default valueslocal.setStreet(beach.getLocation().getStreet());
		Location local = new Location();
		local.setStreet(user.getLocation().getStreet());
		local.setCity(user.getLocation().getCity());
		local.setState(user.getLocation().getState());
		local.setZip(user.getLocation().getZip());
		localRepo.saveAndFlush(local);
		user.setLocation(local);
		user.setEnabled(true);
		user.setRole("user");
		

		userRepo.saveAndFlush(user);
		return user;
	}

	@Override
	public User getUser(String username) {
		return userRepo.findByUsername(username);
	}

}
