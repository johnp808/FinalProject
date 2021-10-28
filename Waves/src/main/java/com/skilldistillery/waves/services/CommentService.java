package com.skilldistillery.waves.services;

import java.util.List;

import com.skilldistillery.waves.entities.ReportComment;
import com.skilldistillery.waves.entities.WeatherComment;

public interface CommentService {
	
	public List<WeatherComment> index(String username);

    public List<WeatherComment> show(String username, int wid);

    public WeatherComment create(String username, WeatherComment wComment);

    public WeatherComment update(String username, int wid, WeatherComment wComment);

    public boolean destroy(String username, int wid);
    
    public List<ReportComment> indexReport(String username);
    
    public ReportComment showReport(String username, int rid);
    
    public ReportComment createReport(String username, ReportComment rComment);
    
    public ReportComment updateReport(String username, int rid, ReportComment rComment);
    
    public boolean destroyReport(String username, int rid);

}
