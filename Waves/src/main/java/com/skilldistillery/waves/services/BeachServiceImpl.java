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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean destroy(String name, int bid) {
		// TODO Auto-generated method stub
		return false;
	}


	

}
