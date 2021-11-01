package com.skilldistillery.waves.services;

import java.util.List;

import com.skilldistillery.waves.entities.Beach;
import com.skilldistillery.waves.entities.Location;

public interface BeachService {

	Beach getBeachByName(String name);
	List<Beach> index();
	Beach create(Beach beach);
	Beach update(String name, int bid, Beach beach);
	boolean destroy(String name, int bid);
	Beach getBeachById(int id);
	boolean enabledDisabledBeach(int bid);
	List<Beach> getBeachByRating(double rating);
	List<Beach> getBeachByLocation(Location location);
	List<Beach> getBeachByKeyword(String keyword);
	Beach addBeach(int localId, Beach beach);
	
}
