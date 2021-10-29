package com.skilldistillery.waves.services;

import java.util.List;

import com.skilldistillery.waves.entities.ReportComment;
import com.skilldistillery.waves.entities.WeatherComment;

public interface CommentService {
	
	public List<WeatherComment> indexComment(String username);

	public WeatherComment showCommentById(int wComId);

    public WeatherComment createComment(int weatherId, String username, WeatherComment wComment);

    public WeatherComment updateComment(String username, int wid, WeatherComment wComment);

    public boolean destroyComment(String username, int wid);
    
    public List<ReportComment> indexReport(String username);
    
    public ReportComment showReportCommentById(int rComId);
    
    public ReportComment createReport(int reportId, String username, ReportComment rComment);
    
    ReportComment updateReportComment(String username, int rid, ReportComment rComment);
    
	public boolean destroyReportComment(String name, int rComId);









}
