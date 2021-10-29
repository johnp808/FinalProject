package com.skilldistillery.waves.services;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.skilldistillery.waves.entities.Beach;
import com.skilldistillery.waves.entities.Report;
import com.skilldistillery.waves.entities.User;
import com.skilldistillery.waves.entities.Weather;
import com.skilldistillery.waves.repositories.BeachRepository;
import com.skilldistillery.waves.repositories.UserRepository;
import com.skilldistillery.waves.repositories.WeatherRepository;

@Service
public class WeatherServiceImpl implements WeatherService {
	
	@Autowired
	private WeatherRepository weatherRepo;
	@Autowired
	private BeachRepository beachRepo;
	@Autowired
	private UserRepository userRepo;

	@Override
	public List<Weather> getWeatherListByUsername(String username) {
		return weatherRepo.findByUser_Username(username);
	}
	
	@Override
	public Weather updateWeatherById(int weatherId, int beachId, String username, Weather weather) {
		Optional<Weather> managedWeather = weatherRepo.findById(weatherId);
		Beach beach = beachRepo.findById(beachId);
		User user = userRepo.findByUsername(username);
		if(managedWeather.isPresent() && user!=null && beach!=null && weather!=null) {
			weather.setId(weatherId);
			weather.setBeach(beach);
			weather.setUser(user);
			weatherRepo.saveAndFlush(weather);
			return weather;
		}
		return null;
	}
	
	@Override
	public Weather AddWeather(int beachId, String username, Weather weather) {
		Beach beach = beachRepo.findById(beachId);
		User user = userRepo.findByUsername(username);
		if(user!=null && beach!=null && weather!=null) {
			weather.setBeach(beach);
			weather.setUser(user);
			weatherRepo.saveAndFlush(weather);
			return weather;
		}
		return null;
	}

	@Override
	public List<Weather> getAllWeather() {
		return weatherRepo.findAll();
	}
	

}
