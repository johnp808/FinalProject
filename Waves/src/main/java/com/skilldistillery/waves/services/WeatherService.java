package com.skilldistillery.waves.services;

import java.util.List;
import com.skilldistillery.waves.entities.Weather;

public interface WeatherService {

	List<Weather> getWeatherListByUsername(String username);
	
}
