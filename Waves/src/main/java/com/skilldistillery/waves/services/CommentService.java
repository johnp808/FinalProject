package com.skilldistillery.waves.services;

import java.util.List;

import com.skilldistillery.waves.entities.ReportComment;
import com.skilldistillery.waves.entities.WeatherComment;

public interface CommentService {
	
	public List<WeatherComment> indexComment(String username);

	WeatherComment showComment(int wComId);
    

    public WeatherComment create(int weatherId, String username, WeatherComment wComment);

    WeatherComment updateComment(String username, int wid, WeatherComment wComment);

    boolean destroyComment(String username, int wid);
    
    public List<ReportComment> indexReport(String username);
    
    public ReportComment showReport(String username, int rid);
    
    public ReportComment createReport(String username, ReportComment rComment);
    
    public ReportComment updateReport(String username, int rid, ReportComment rComment);
    
    public boolean destroyReport(String username, int rid);






}
