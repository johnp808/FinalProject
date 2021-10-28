package com.skilldistillery.waves.repositories;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.waves.entities.WeatherComment;

public interface WeatherCommentRepository extends JpaRepository<WeatherComment, Integer> {
	WeatherComment findById(int id);
	List<WeatherComment> findByDate(Date postedDate);
	List<WeatherComment> findByUser_UsernameAndId(String username, int userId);
	List<WeatherComment> findByCommentId(int commentId);
	List<WeatherComment> findByKeyword(String keyword);
	
	

}
