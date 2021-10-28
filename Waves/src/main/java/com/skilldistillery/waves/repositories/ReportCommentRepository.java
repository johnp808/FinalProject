package com.skilldistillery.waves.repositories;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.waves.entities.ReportComment;

public interface ReportCommentRepository extends JpaRepository<ReportComment, Integer> {

	ReportComment findById(int id);
	List<ReportComment> findByDate(Date postedDate);
	List<ReportComment> findByUserId(int userId);
	List<ReportComment> findByCommentId(int commentId);
	List<ReportComment> findByKeyword(String keyword);
	
}
