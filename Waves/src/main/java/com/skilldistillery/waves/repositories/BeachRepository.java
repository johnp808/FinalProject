package com.skilldistillery.waves.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.waves.entities.Beach;

public interface BeachRepository extends JpaRepository<Beach,Integer>{

	Beach findByName(String name);
	Beach findById(int id);
	List<Beach> findByFavoritedUsers_Username(String username);
}
