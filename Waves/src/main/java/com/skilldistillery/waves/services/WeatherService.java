package com.skilldistillery.waves.services;

import java.util.List;
import com.skilldistillery.waves.entities.Weather;

public interface WeatherService {

	List<Weather> getAllWeather();
	
	List<Weather> getWeatherListByUsername(String username);

	Weather updateWeatherById(int weatherId, int beachId, String username, Weather weather);

	Weather AddWeather(int beachId, String username, Weather weather);

	List<Weather> getAllWeatherForBeach(int beachId);
	
}
