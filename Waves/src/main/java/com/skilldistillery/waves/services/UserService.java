package com.skilldistillery.waves.services;

import java.util.List;

import com.skilldistillery.waves.entities.Beach;
import com.skilldistillery.waves.entities.User;

public interface UserService {

	User getUserByName(String username);
	boolean enabledDisabledUser(int userId);
	List<Beach> showFavorites(String username);
	
}
