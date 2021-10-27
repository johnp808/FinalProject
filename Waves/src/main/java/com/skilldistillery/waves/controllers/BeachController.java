package com.skilldistillery.waves.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.waves.entities.Beach;
import com.skilldistillery.waves.services.BeachService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost:4301"})
public class BeachController {
	
	@Autowired
	private BeachService beachSvc;
	
	@GetMapping("beaches")
	public List<Beach> index(HttpServletRequest req, HttpServletResponse res, Principal principal) {
		return beachSvc.index();
	}
	
//	@GetMapping("beachess/{beachId}")
//	public Beach show(HttpServletRequest req, HttpServletResponse res, @PathVariable int tid, Principal principal) {
//		return todoSvc.show(principal.getName(), tid);
//	}
	

}
