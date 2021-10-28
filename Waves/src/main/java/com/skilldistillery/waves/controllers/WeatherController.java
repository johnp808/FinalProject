package com.skilldistillery.waves.controllers;

import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.skilldistillery.waves.entities.Weather;
import com.skilldistillery.waves.services.WeatherService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost:4301"})
public class WeatherController {

	@Autowired
	private WeatherService weatherSvc;
	
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
}
