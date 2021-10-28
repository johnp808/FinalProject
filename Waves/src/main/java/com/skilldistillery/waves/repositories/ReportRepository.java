package com.skilldistillery.waves.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.skilldistillery.waves.entities.Report;

public interface ReportRepository extends JpaRepository<Report, Integer> {

	List<Report> findByUser_Username(String username);
	
	
}
