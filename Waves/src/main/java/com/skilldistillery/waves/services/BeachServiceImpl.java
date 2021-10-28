package com.skilldistillery.waves.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.waves.entities.Beach;
import com.skilldistillery.waves.entities.Beach;
import com.skilldistillery.waves.repositories.BeachRepository;

@Service
public class BeachServiceImpl implements BeachService {

	@Autowired
	private BeachRepository beachRepo;
	
	@Override
	public Beach getBeachByName(String name) {
		return beachRepo.findByName(name);
	}

	@Override
	public Beach getBeachById(int id) {
		return beachRepo.findById(id);
	}
	
	@Override
	public List<Beach> index() {
		return beachRepo.findAll();
	}

	@Override
	public Beach create(Beach beach) {
		if(beach != null) {
			beachRepo.saveAndFlush(beach);
			return beach;
		}
		else {
			return null;
		}
	}

	@Override
	public Beach update(String name, int bid, Beach beach) {
		Beach existingBeach = beachRepo.findById(bid);
		
		if(existingBeach != null) {
			existingBeach.setName(beach.getName());
			existingBeach.setDescription(beach.getDescription());
			existingBeach.setDefaultImage(beach.getDefaultImage());
			existingBeach.setParkingAvailable(beach.getParkingAvailable());
			existingBeach.setEnabled(beach.getEnabled());
			existingBeach.setHours(beach.getHours());
			existingBeach.setOperational(beach.isOperational());
			existingBeach.setPetFriendly(beach.getPetFriendly());
			existingBeach.setPriceOfAdmission(beach.getPriceOfAdmission());
			existingBeach.setLocation(beach.getLocation());
			existingBeach.setFavoritedUsers(beach.getFavoritedUsers());
			existingBeach.setInclementConditions(beach.getInclementConditions());
			existingBeach.setBeachSettings(beach.getBeachSettings());
			
			beachRepo.saveAndFlush(existingBeach);
			return existingBeach;
		}
		return null;
	}

	@Override
	public boolean destroy(String name, int bid) {
		boolean deleted = false;
		Beach beach = beachRepo.findById(bid);
		if (beach != null) {
			beachRepo.delete(beach);
			deleted = true;
		}
		return deleted;
	}

	@Override
	public boolean enabledDisabledBeach(int bid) {
		Beach beach = beachRepo.findById(bid);
		// if the users enabled is false, enable it, otherwise return false
			if(beach != null) {
				beach.setEnabled(!beach.getEnabled());
				beachRepo.save(beach);
				return true;
			}
			return false;
	}


	

}
