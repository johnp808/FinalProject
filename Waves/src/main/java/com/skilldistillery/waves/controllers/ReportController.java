package com.skilldistillery.waves.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.waves.entities.Report;
import com.skilldistillery.waves.services.ReportService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost:4301"})
public class ReportController {

	@Autowired
	private ReportService reportSvc;
	
	@GetMapping("reports/user")
	public List<Report> getReportByUsername(
			HttpServletResponse res,
			Principal principal
			){
		List<Report> reports = reportSvc.getReportsByUsername(principal.getName());
		if(reports == null) {
			res.setStatus(404);
		}
		return reports;
	}
	
	@PutMapping("reports/{reportId}/{beachId}")
	public Report updateReportByIdAndUsername(
			@PathVariable int reportId,
			@PathVariable int beachId,
			@RequestBody Report report,
			HttpServletResponse res,
			Principal principal
			) {
		Report updated = reportSvc.updateReportById(reportId, beachId, principal.getName(), report);
		if(updated == null) {
			res.setStatus(404);
		}
		return updated;
	}
	
	@PostMapping("reports/{beachId}")
	public Report createReportByUsername(
			@PathVariable int beachId,
			@RequestBody Report report,
			HttpServletResponse res,
			Principal principal
			) {
		Report newReport = reportSvc.AddReport(beachId, principal.getName(), report);
		if(newReport != null) {
			res.setStatus(201);
			return newReport;
		}else {
			res.setStatus(404);
			return null;
		}
	}
	
}
