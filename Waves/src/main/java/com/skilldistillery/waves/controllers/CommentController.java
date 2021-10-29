package com.skilldistillery.waves.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.waves.entities.WeatherComment;
import com.skilldistillery.waves.services.CommentService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost:4301"})
public class CommentController {

	@Autowired
	private CommentService wComSvc;
	
	@GetMapping("comment")
	public List<WeatherComment> showComments(
			HttpServletResponse res,
			Principal principal
			) {
//		List<WeatherComment> commentList = wComSvc.showComment(principal.getName()); this shows the first comment only
		List<WeatherComment> commentList = wComSvc.indexComment(principal.getName()); // this shows all the comments for the user
		if(commentList == null) {
			res.setStatus(404);
		}
		return commentList;
	}
	
	@PostMapping("comment/{weatherId}")
	public WeatherComment createWeatherCommentByUsername(
			@PathVariable int weatherId,
			@RequestBody WeatherComment weatherComment,
			HttpServletResponse res,
			Principal principal
			) {
		WeatherComment newWeatherComment = wComSvc.create( weatherId, principal.getName(), weatherComment);
		if(newWeatherComment != null) {
			res.setStatus(201);
			return newWeatherComment;
		}else {
			res.setStatus(404);
			return null;
		}
	}
}
