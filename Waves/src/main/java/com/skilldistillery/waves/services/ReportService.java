package com.skilldistillery.waves.services;

import java.util.List;
import com.skilldistillery.waves.entities.Report;

public interface ReportService {
	
	List<Report> getAllReports();

	List<Report> getReportsByUsername(String username);
	
	Report updateReportById(Integer reportId, Integer beachId, String username, Report report);
	
	Report AddReport(int beachId, String username, Report report);

	List<Report> getAllReportForBeach(int beachId);
	
	
}
