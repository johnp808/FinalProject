package com.skilldistillery.waves.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.waves.services.UserService;

@RestController
public class UserController {

	@Autowired
	private UserService userSvc;
}