package com.skilldistillery.waves.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Beach> index() {
		return beachRepo.findAll();
	}
	

}
