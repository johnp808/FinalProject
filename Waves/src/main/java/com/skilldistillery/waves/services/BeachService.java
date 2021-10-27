package com.skilldistillery.waves.services;

import java.util.List;

import com.skilldistillery.waves.entities.Beach;

public interface BeachService {

	Beach getBeachByName(String name);
	List<Beach> index();

}
