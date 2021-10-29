package com.skilldistillery.waves.repositories;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.waves.entities.ReportComment;

public interface ReportCommentRepository extends JpaRepository<ReportComment, Integer> {

	ReportComment queryById(int rid);
	List<ReportComment> findByCommentDate(LocalDateTime postedDate);
	List<ReportComment> findByUserId(int userId);
	List<ReportComment> findByReport_Id(int commentId);
	List<ReportComment> findByCommentLike(String keyword);
}
