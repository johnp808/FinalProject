package com.skilldistillery.waves.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.skilldistillery.waves.entities.Report;
import com.skilldistillery.waves.repositories.ReportRepository;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportRepository reportRepo;

	@Override
	public List<Report> getReportsByUsername(String username) {
		return reportRepo.findByUser_Username(username);
	}

}
