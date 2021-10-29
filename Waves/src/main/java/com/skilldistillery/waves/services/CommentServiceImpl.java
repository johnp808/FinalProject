package com.skilldistillery.waves.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.waves.entities.ReportComment;
import com.skilldistillery.waves.entities.User;
import com.skilldistillery.waves.entities.Weather;
import com.skilldistillery.waves.entities.WeatherComment;
import com.skilldistillery.waves.repositories.ReportCommentRepository;
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

	@Override
	public List<WeatherComment> indexComment(String username) {
		
		return wComRepo.findAll();
	}

	@Override
	public List<WeatherComment> showComment( String username, int wid) {
	
		return wComRepo.findByUser_UsernameAndId(username, wid);
	}

	@Override
	public WeatherComment create(int weatherId, String username, WeatherComment wComment) {
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
	public List<WeatherComment> showComment(String username) {
		
		return wComRepo.findByUser_Username(username);
	}

	@Override
	public WeatherComment updateComment(String username, int wid, WeatherComment wComment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean destroyComment(String username, int wid) {

		return false;
	}

	@Override
	public List<ReportComment> indexReport(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReportComment showReport(String username, int rid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReportComment createReport(String username, ReportComment rComment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReportComment updateReport(String username, int rid, ReportComment rComment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean destroyReport(String username, int rid) {
		// TODO Auto-generated method stub
		return false;
	}

}
