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

import com.skilldistillery.waves.entities.ReportComment;
import com.skilldistillery.waves.entities.WeatherComment;
import com.skilldistillery.waves.services.CommentService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost:4301"})
public class CommentController {

	@Autowired
	private CommentService comSvc;
	
// 			*** 									Weather comments									***
	
	
	@GetMapping("weather/comment")
	public List<WeatherComment> showComments(
			HttpServletResponse res,
			Principal principal
			) {
		List<WeatherComment> commentList = comSvc.indexComment(principal.getName()); // this shows all the comments for the user
		if(commentList == null) {
			res.setStatus(404);
		}
		return commentList;
	}
	
	@GetMapping("weather/comment/{wComId}")
	public WeatherComment showCommentById(HttpServletRequest req, HttpServletResponse res, Principal principal, @PathVariable int wComId) {
		WeatherComment wCom = comSvc.showCommentById( wComId);
		if (wCom == null) {

			res.setStatus(404);
		}
		return wCom;
	}
	
	@PostMapping("auth/weather/comment/{weatherId}")
	public WeatherComment createWeatherCommentByUsername(
			@PathVariable int weatherId,
			@RequestBody WeatherComment weatherComment,
			HttpServletResponse res,
			Principal principal
			) {
		WeatherComment newWeatherComment = comSvc.createComment( weatherId, principal.getName(), weatherComment);
		if(newWeatherComment != null) {
			res.setStatus(201);
			return newWeatherComment;
		}else {
			res.setStatus(404);
			return null;
		}
	}
	
	@PutMapping("auth/weather/comment/{wComId}")
	public WeatherComment update(HttpServletRequest req, HttpServletResponse res, Principal principal, @PathVariable int wComId, @RequestBody WeatherComment wc) {
		wc = comSvc.updateComment(principal.getName(), wComId, wc);
		if (wc == null) {
			res.setStatus(404);
		}
		return wc;
	}
	
	@DeleteMapping("auth/weather/comment/{wComId}")
	public boolean destroy(HttpServletRequest req, HttpServletResponse res, Principal principal, @PathVariable int wComId) {
		boolean deleted = comSvc.destroyComment(principal.getName(), wComId);
		if (deleted) {
			res.setStatus(204);
		}
		return deleted;
	}

	
//			*** 										Report Comments											***
	
	
	@GetMapping("report/comment")
	public List<ReportComment> showReportComments(
			HttpServletResponse res,
			Principal principal
			) {
		List<ReportComment> commentList = comSvc.indexReport(principal.getName()); // this shows all the comments for the user
		if(commentList == null) {
			res.setStatus(404);
		}
		return commentList;
	}
	
	@GetMapping("report/comment/{rComId}")
	public ReportComment showReportCommentById(HttpServletRequest req, HttpServletResponse res, Principal principal, @PathVariable int rComId) {
		ReportComment rCom = comSvc.showReportCommentById( rComId);
		if (rCom == null) {

			res.setStatus(404);
		}
		return rCom;
	}
	
	@PostMapping("auth/report/comment/{reportId}")
	public ReportComment createReportCommentByUsername(
			@PathVariable int reportId,
			@RequestBody ReportComment reportComment,
			HttpServletResponse res,
			Principal principal
			) {
		ReportComment newReportComment = comSvc.createReport( reportId, principal.getName(), reportComment);
		if(newReportComment != null) {
			res.setStatus(201);
			return newReportComment;
		}else {
			res.setStatus(404);
			return null;
		}
	}
	
	@PutMapping("auth/report/comment/{rComId}")
	public ReportComment updateReportComment(HttpServletRequest req, HttpServletResponse res, Principal principal, @PathVariable int rComId, @RequestBody ReportComment rC) {
		rC = comSvc.updateReportComment(principal.getName(), rComId, rC);
		if (rC == null) {
			res.setStatus(404);
		}
		return rC;
	}
	
	@DeleteMapping("auth/report/comment/{rComId}")
	public boolean destroyReportComment(HttpServletRequest req, HttpServletResponse res, Principal principal, @PathVariable int rComId) {
		boolean deleted = comSvc.destroyReportComment(principal.getName(), rComId);
		if (deleted) {
			res.setStatus(204);
		}
		return deleted;
	}
}
