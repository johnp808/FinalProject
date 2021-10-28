package com.skilldistillery.waves.controllers;



import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.waves.entities.Beach;
import com.skilldistillery.waves.entities.User;
import com.skilldistillery.waves.services.BeachService;
import com.skilldistillery.waves.services.UserService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost:4301"})
public class UserController {

	@Autowired
	private UserService userSvc;
	
	@Autowired
	private BeachService beachSvc;
	
	@GetMapping("ping")
	public String ping() {
		return "pong";
	}
	
	@GetMapping("auth/favorites")
public List<Beach> favorites(HttpServletRequest req, HttpServletResponse res, Principal principal) {
	
		return userSvc.showFavorites(principal.getName());
}

	@PutMapping("auth/enabled/{userId}")
	public boolean enabledDisabledUser(HttpServletRequest req, HttpServletResponse res,@PathVariable int userId, Principal principal) {
	
		return userSvc.enabledDisabledUser(userId);
	}
	@PostMapping("auth/favorites/{beachId}")
	public Beach createFavorite(HttpServletRequest req, HttpServletResponse res, Principal principal, @PathVariable int beachId) {
		Beach beach =userSvc.addFavorite(principal.getName(), beachId);
		if (beach == null) {
			res.setStatus(400);
		}
		return beach;
	}
	@DeleteMapping("auth/favorites/{beachId}")
	public void destroy(HttpServletRequest req, HttpServletResponse res, Principal principal, @PathVariable int beachId) {
		if(userSvc.deleteFavorite(principal.getName(), beachId)) {
			res.setStatus(204);
		} else {
			res.setStatus(404);
		}
		
	}

	@DeleteMapping("auth/delete")
	public void destroy(
			HttpServletRequest req,
			HttpServletResponse res,
			Principal principal
			) {
		if(userSvc.destroy(principal.getName())) {
			res.setStatus(204);
		}
		else {
			res.setStatus(404);
		}
	}
}
