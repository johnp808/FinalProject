package com.skilldistillery.waves.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.waves.entities.Beach;
import com.skilldistillery.waves.entities.User;
import com.skilldistillery.waves.repositories.BeachRepository;
import com.skilldistillery.waves.repositories.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private BeachRepository beachRepo;
	
	@Override
	public User getUserByName(String username) {
		return userRepo.findByUsername(username);
	}

	@Override
	public List<Beach> showFavorites(String username) {

		return beachRepo.findByFavoritedUsers_Username(username);
	}


}
