package com.skilldistillery.waves.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.skilldistillery.waves.entities.Weather;

public interface WeatherRepository extends JpaRepository<Weather, Integer>{

	List<Weather> findByUser_Username(String username);
	
}
