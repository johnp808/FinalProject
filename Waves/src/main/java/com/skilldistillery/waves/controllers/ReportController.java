package com.skilldistillery.waves.controllers;

import java.beans.PropertyEditorSupport;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.waves.entities.Report;
import com.skilldistillery.waves.entities.Weather;
import com.skilldistillery.waves.services.ReportService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost:4301"})
public class ReportController {

	@Autowired
	private ReportService reportSvc;
	
	@GetMapping("reports")
	public List<Report> getAllReports(HttpServletResponse res){
		List<Report> reports = reportSvc.getAllReports();
		if(reports == null) {
			res.setStatus(404);
		}
		return reports;
	}
	
	@GetMapping("reports/{beachId}")
	public List<Report> getWeatherByBeachId(@PathVariable Integer beachId){
		return reportSvc.getAllReportForBeach(beachId);
	}
	
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
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		webDataBinder.registerCustomEditor(LocalDate.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalDate.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("yyyy-MM-dd").format((LocalDate) getValue());
			}
		});
		webDataBinder.registerCustomEditor(LocalTime.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalTime.parse(text, DateTimeFormatter.ofPattern("HH:mm")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("HH:mm").format((LocalTime) getValue());
			}
		});
		// 2020-11-04T09:44
		webDataBinder.registerCustomEditor(LocalDateTime.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalDateTime.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm").format((LocalDateTime) getValue());
			}
		});
	}
	
}
