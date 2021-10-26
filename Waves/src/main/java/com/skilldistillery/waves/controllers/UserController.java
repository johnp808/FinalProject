package com.skilldistillery.waves.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.skilldistillery.waves.services.UserService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost:9090"})
public class UserController {

	@Autowired
	private UserService userSvc;
	
	@GetMapping("ping")
	public String ping() {
		return "pong";
	}
}
