package com.skilldistillery.waves.controllers;



import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.waves.entities.Beach;
import com.skilldistillery.waves.services.UserService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost:4301"})
public class UserController {

	@Autowired
	private UserService userSvc;
	
	@GetMapping("ping")
	public String ping() {
		return "pong";
	}
	
	@GetMapping("favorites")
public List<Beach> favorites(HttpServletRequest req, HttpServletResponse res, Principal principal) {
	
		return userSvc.showFavorites(principal.getName());
}

	@PutMapping("enabled/{userId}")
	public boolean enabledDisabledUser(HttpServletRequest req, HttpServletResponse res,@PathVariable int userId, Principal principal) {
	
		return userSvc.enabledDisabledUser(userId);
	}
	
}
