package com.skilldistillery.waves.services;

import java.util.List;
import com.skilldistillery.waves.entities.Report;

public interface ReportService {

	List<Report> getReportsByUsername(String username);
	
	
}
