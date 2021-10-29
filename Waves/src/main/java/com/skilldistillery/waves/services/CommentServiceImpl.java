package com.skilldistillery.waves.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.waves.entities.Report;
import com.skilldistillery.waves.entities.ReportComment;
import com.skilldistillery.waves.entities.User;
import com.skilldistillery.waves.entities.Weather;
import com.skilldistillery.waves.entities.WeatherComment;
import com.skilldistillery.waves.repositories.ReportCommentRepository;
import com.skilldistillery.waves.repositories.ReportRepository;
import com.skilldistillery.waves.repositories.UserRepository;
import com.skilldistillery.waves.repositories.WeatherCommentRepository;
import com.skilldistillery.waves.repositories.WeatherRepository;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private WeatherCommentRepository wComRepo;
	
	@Autowired
	private ReportCommentRepository rComRepo;
	
	@Autowired
	private UserRepository userRepo;

	@Autowired
	private WeatherRepository weatherRepo;
	
	@Autowired
	private ReportRepository reportRepo;

	@Override
	public List<WeatherComment> indexComment(String username) {
		
		return wComRepo.findAll();
	}

	
	@Override
	public WeatherComment showCommentById(int wComId) {
	
	Optional<WeatherComment> wComm= wComRepo.findById(wComId);
	if(wComm.isPresent()) {
		return wComm.get();
	}
	return null;
	}

	@Override
	public WeatherComment createComment(int weatherId, String username, WeatherComment wComment) {
		User user = userRepo.findByUsername(username);
		Optional<Weather> weather = weatherRepo.findById(weatherId);
		if (user != null && weather != null) {
			wComment.setUser(user);
			wComment.setWeather(weather.get());
			wComRepo.saveAndFlush(wComment);
			return wComment;
		} else {
			return null;
		}
	}
	

	@Override
	public WeatherComment updateComment(String username, int wid, WeatherComment wComment) {
		Optional<WeatherComment> managedComment =wComRepo.findById(wid);
		User user = userRepo.findByUsername(username);
		if(managedComment.isPresent() && user!= null && wComment!=null) {
			WeatherComment wC = managedComment.get();
			wC.setCommentDate(wComment.getCommentDate());
			wC.setComment(wComment.getComment());
			wC.setWeather(wComment.getWeather());
			
			return wC;
		}
		return null;
	}

	@Override
	public boolean destroyComment(String username, int wid) {
			boolean deleted = false;
			Optional<WeatherComment> wC = wComRepo.findById(wid);
			if (wC.isPresent()) {
				WeatherComment wComm = wC.get();
				wComRepo.delete(wComm);
				deleted = true;
			}
			return deleted;
		}

	@Override
	public List<ReportComment> indexReport(String username) {
		return rComRepo.findAll();
	}
	
	@Override
	public ReportComment showReportCommentById(int rComId) {

		ReportComment rComm= rComRepo.queryById(rComId);
		if(rComm != null) {
			return rComm;
		}
		return null;
		}

	@Override
	public ReportComment createReport(int reportId, String username, ReportComment rComment) {
		User user = userRepo.findByUsername(username);
		Optional<Report> report = reportRepo.findById(reportId);
		if (user != null && report != null) {
			rComment.setUser(user);
			rComment.setComment(rComment.getComment());
			rComment.setCommentDate(rComment.getCommentDate());
			rComment.setReport(report.get());
			rComRepo.saveAndFlush(rComment);
			return rComment;
		} else {
			return null;
		}
	}
	
	@Override
	public ReportComment updateReportComment(String username, int rid, ReportComment rComment) {
		ReportComment managedReportComment = rComRepo.queryById(rid);
		User user = userRepo.findByUsername(username);
		if(managedReportComment != null && user!= null && rComment!=null) {
			ReportComment rC = managedReportComment;
			rC.setComment(rComment.getComment());
			rC.setCommentDate(rComment.getCommentDate());
			rComRepo.saveAndFlush(rC);
			return rC;
		}
		return null;
	}

	@Override
	public boolean destroyReportComment(String username, int rid) {
			boolean deleted = false;
			ReportComment rC = rComRepo.queryById(rid);
			if (rC != null) {
				ReportComment rComm = rC;
				rComRepo.delete(rComm);
				deleted = true;
			}
			return deleted;
		}
}
