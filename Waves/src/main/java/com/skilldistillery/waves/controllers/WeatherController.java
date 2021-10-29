package com.skilldistillery.waves.controllers;

import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.waves.entities.Report;
import com.skilldistillery.waves.entities.Weather;
import com.skilldistillery.waves.services.WeatherService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost:4301"})
public class WeatherController {

	@Autowired
	private WeatherService weatherSvc;
	
	@GetMapping("weather")
	public List<Weather> getAllWeather(HttpServletResponse res){
		List<Weather> weather = weatherSvc.getAllWeather();
		if(weather == null) {
			res.setStatus(404);
		}
		return weather;
	}
	
	@GetMapping("weather/user")
	public List<Weather> getReportByUsername(
			HttpServletResponse res,
			Principal principal
			){
		List<Weather> weatherList = weatherSvc.getWeatherListByUsername(principal.getName());
		if(weatherList == null) {
			res.setStatus(404);
		}
		return weatherList;
	}
	
	@PutMapping("weather/{weatherId}/{beachId}")
	public Weather updateWeatherByIdAndUsername(
			@PathVariable int weatherId,
			@PathVariable int beachId,
			@RequestBody Weather weather,
			HttpServletResponse res,
			Principal principal
			) {
		Weather updated = weatherSvc.updateWeatherById(weatherId, beachId, principal.getName(), weather);
		if(updated == null) {
			res.setStatus(404);
		}
		return updated;
	}
	

	@PostMapping("weather/{beachId}")
	public Weather createWeatherByUsername(
			@PathVariable int beachId,
			@RequestBody Weather weather,
			HttpServletResponse res,
			Principal principal
			) {
		Weather newWeather = weatherSvc.AddWeather(beachId, principal.getName(), weather);
		if(newWeather != null) {
			res.setStatus(201);
			return newWeather;
		}else {
			res.setStatus(404);
			return null;
		}
	}
}
