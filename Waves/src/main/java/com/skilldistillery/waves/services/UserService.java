package com.skilldistillery.waves.services;

import java.util.List;

import com.skilldistillery.waves.entities.Beach;
import com.skilldistillery.waves.entities.Report;
import com.skilldistillery.waves.entities.ReportComment;
import com.skilldistillery.waves.entities.User;
import com.skilldistillery.waves.entities.Weather;

public interface UserService {

	User getUserByName(String username);
	boolean enabledDisabledUser(int userId);
	List<Beach> showFavorites(String username);
	Beach addFavorite(String username,int beachId);
	boolean deleteFavorite(String username, int beachId);
	boolean destroy(String username);
	User update(int id, User user);
	User show(int id);
	
	List<User> getAllUsers();
	
	
	
	
	
}
