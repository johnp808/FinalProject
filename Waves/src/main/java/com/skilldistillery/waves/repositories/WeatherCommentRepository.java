package com.skilldistillery.waves.repositories;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.waves.entities.WeatherComment;

public interface WeatherCommentRepository extends JpaRepository<WeatherComment, Integer> {
//	WeatherComment findById(int id);
	List<WeatherComment> findByCommentDate(LocalDateTime postedDate);
	List<WeatherComment> findByUser_UsernameAndId(String username, int userId);
//	WeatherComment findByUser_UsernameAndComId(String username, int wComId);
	WeatherComment findByWeather_Id(int commentId);
	List<WeatherComment> findByWeatherLike(String keyword);
	List<WeatherComment> findByUser_Username(String username);
}
