package com.skilldistillery.waves.controllers;

import java.beans.PropertyEditorSupport;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@GetMapping("weather")
	public List<Weather> getAllWeather(HttpServletResponse res){
		List<Weather> weather = weatherSvc.getAllWeather();
		if(weather == null) {
			res.setStatus(404);
		}
		return weather;
	}
	
	@GetMapping("weather/{beachId}")
	public List<Weather> getWeatherByBeachId(@PathVariable Integer beachId){
		return weatherSvc.getAllWeatherForBeach(beachId);
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
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		webDataBinder.registerCustomEditor(LocalDate.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalDate.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("yyyy-MM-dd").format((LocalDate) getValue());
			}
		});
		webDataBinder.registerCustomEditor(LocalTime.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalTime.parse(text, DateTimeFormatter.ofPattern("HH:mm")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("HH:mm").format((LocalTime) getValue());
			}
		});
		// 2020-11-04T09:44
		webDataBinder.registerCustomEditor(LocalDateTime.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalDateTime.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm").format((LocalDateTime) getValue());
			}
		});
	}
}
