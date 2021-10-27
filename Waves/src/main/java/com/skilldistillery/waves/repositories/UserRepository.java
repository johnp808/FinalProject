package com.skilldistillery.waves.repositories;



import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.waves.entities.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByUsername(String username);
}
