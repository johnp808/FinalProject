package com.skilldistillery.waves.services;

import java.util.List;

import com.skilldistillery.waves.entities.Beach;

public interface BeachService {

	Beach getBeachByName(String name);
	List<Beach> index();
	Beach create(Beach beach);
	Beach update(String name, int bid, Beach beach);
	boolean destroy(String name, int bid);
	Beach getBeachById(int id);

}
