package com.skilldistillery.waves.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.waves.entities.Beach;
import com.skilldistillery.waves.entities.User;
import com.skilldistillery.waves.entities.WeatherComment;
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

	@Override
	public boolean enabledDisabledUser(int userId) {
		Optional<User> user = userRepo.findById(userId);
	// if the users enabled is false, enable it, otherwise return false
		if(user.isPresent()) {
			User u = user.get();
			u.setEnabled(!u.getEnabled());
			userRepo.save(u);
			return true;
		}
		return false;
	}

	
	@Override
	public boolean deleteFavorite(String username, int beachId) {
		boolean deleted = false;
		Beach beach =beachRepo.findById(beachId);
		User user = userRepo.findByUsername(username);
		List<Beach> favorites = user.getBeachFavorites();
		if(beach != null) {	
			for (int i = 0; i < favorites.size(); i++){
					if(favorites.get(i).equals(beach)) {
						//remove from favorites;
						favorites.remove(i);
						break;
					}
	
			}
			user.setBeachFavorites(favorites);
			userRepo.saveAndFlush(user);
			deleted = true;
		}
		return deleted;
		
	}

	@Override
	public Beach addFavorite(String username, int beachId) {
		User user = userRepo.findByUsername(username);
		Beach beach = beachRepo.findById(beachId);
		if(beach != null) {
		user.getBeachFavorites().add(beach);
		userRepo.saveAndFlush(user);
		return beach;
		}else {
			return null;
		}
	}


	@Override
	public boolean destroy(String username) {
		boolean deleted = false;
		User user = userRepo.findByUsername(username);
		if(user != null) {
			userRepo.delete(user);
			deleted = true;
		}
		return deleted;
	}
	
}

/*
 *make sure when creating user to set enabled to true.
 */
