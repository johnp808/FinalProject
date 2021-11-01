package com.skilldistillery.waves.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import com.skilldistillery.waves.entities.Beach;
import com.skilldistillery.waves.entities.Location;
import com.skilldistillery.waves.entities.Report;
import com.skilldistillery.waves.entities.User;
import com.skilldistillery.waves.repositories.BeachRepository;
import com.skilldistillery.waves.repositories.LocationRepository;

@Service
public class BeachServiceImpl implements BeachService {

	@Autowired
	private BeachRepository beachRepo;
	@Autowired
	private LocationRepository localRepo;
	
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
			existingBeach.setRating(beach.getRating());
			
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

	//Get list of beaches by rating
	@Override
	public List<Beach> getBeachByRating(double rating) {
		List<Beach> allBeaches = beachRepo.findAll();
		List<Beach> matches = new ArrayList<>();
		double high = Math.ceil(rating);
		double low = Math.floor(rating);
		for(int i = 0; i < allBeaches.size(); i++) {
			if(allBeaches.get(i).getRating() <= high && 
					allBeaches.get(i).getRating() >= low ) 
			{
				matches.add(allBeaches.get(i));	
			}
		}
		if(matches.size() > 0) {
			return matches;
		}
		else {
			return allBeaches;
		}
	}

	//Get list of beaches by location
	@Override
	public List<Beach> getBeachByLocation(Location location) {
		// TODO Auto-generated method stub
		return null;
	}

	//Get list of beaches by keywords matching desc.
	@Override
	public List<Beach> getBeachByKeyword(String keyword) {
		List<Beach> allBeaches = beachRepo.findAll();
		List<Beach> matches = new ArrayList<>();
		Beach b = null;
		keyword = keyword.toLowerCase();
		String search = null;
		for(int i = 0; i < allBeaches.size(); i++) {
			b = allBeaches.get(i);
			search = b.getLocation().getStreet();
			search = search.toLowerCase();
			if(search.contains(keyword)) {
				matches.add(b);
			}
			search = b.getLocation().getCity();
			search = search.toLowerCase();
			if(search.contains(keyword)) {
				matches.add(b);
			}
			search = b.getLocation().getState();
			search = search.toLowerCase();
			if(search.contains(keyword)) {
				matches.add(b);
			}
			search = b.getLocation().getZip();
			search = search.toLowerCase();
			if(search.contains(keyword)) {
				matches.add(b);
			}
			search = b.getName();
			search = search.toLowerCase();
			if(search.contains(keyword)) {
				matches.add(b);
			}
			search = b.getDescription();
			search = search.toLowerCase();
			if(search.contains(keyword)) {
				matches.add(b);
			}
			

		}
		
		return matches;
	}	
	
	@Override
	public Beach addBeach(int localId, Beach beach){
		Location local = localRepo.getById(localId);
		if(local!=null && beach!=null) {
			beach.setLocation(local);
			beachRepo.saveAndFlush(beach);
			return beach;
		}
		
		return null;
	}

}
