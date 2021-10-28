package com.skilldistillery.waves.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.skilldistillery.waves.entities.Weather;
import com.skilldistillery.waves.repositories.WeatherRepository;

@Service
public class WeatherServiceImpl implements WeatherService {
	
	@Autowired
	private WeatherRepository weatherRepo;

	@Override
	public List<Weather> getWeatherListByUsername(String username) {
		return weatherRepo.findByUser_Username(username);
	}

}
