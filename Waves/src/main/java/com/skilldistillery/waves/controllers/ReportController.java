package com.skilldistillery.waves.controllers;

import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
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
	
}
