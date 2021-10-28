package com.skilldistillery.waves.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.waves.entities.Beach;
import com.skilldistillery.waves.entities.Report;
import com.skilldistillery.waves.entities.User;
import com.skilldistillery.waves.repositories.BeachRepository;
import com.skilldistillery.waves.repositories.ReportRepository;
import com.skilldistillery.waves.repositories.UserRepository;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportRepository reportRepo;
	@Autowired
	private BeachRepository beachRepo;
	@Autowired
	private UserRepository userRepo;

	@Override
	public List<Report> getReportsByUsername(String username) {
		return reportRepo.findByUser_Username(username);
	}

	@Override
	public Report updateReportById(Integer reportId, Integer beachId, String username, Report report) {
		Optional<Report> managedReport = reportRepo.findById(reportId);
		Optional<Beach> beach = beachRepo.findById(beachId);
		User user = userRepo.findByUsername(username);
		if(managedReport.isPresent() && user!=null && beach!=null && report!=null) {
			report.setId(reportId);
			report.setBeach(beach.get());
			report.setUser(user);
			reportRepo.saveAndFlush(report);
			return report;
		}
		return null;
	}

	@Override
	public Report AddReport(int beachId, String username, Report report) {
		Beach beach = beachRepo.findById(beachId);
		User user = userRepo.findByUsername(username);
		if(user!=null && beach!=null && report!=null) {
			report.setBeach(beach);
			report.setUser(user);
			reportRepo.saveAndFlush(report);
			return report;
		}
		return null;
	}
	
	

}
