package com.skilldistillery.waves.services;

import java.util.List;

import com.skilldistillery.waves.entities.Beach;
import com.skilldistillery.waves.entities.User;

public interface UserService {

	User getUserByName(String username);
	List<Beach> showFavorites(String username);
}
