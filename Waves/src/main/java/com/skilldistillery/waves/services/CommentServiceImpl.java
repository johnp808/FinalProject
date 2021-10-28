package com.skilldistillery.waves.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.waves.entities.ReportComment;
import com.skilldistillery.waves.entities.WeatherComment;
import com.skilldistillery.waves.repositories.ReportCommentRepository;
import com.skilldistillery.waves.repositories.WeatherCommentRepository;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private WeatherCommentRepository wComRepo;
	
	@Autowired
	private ReportCommentRepository rComRepo;

	@Override
	public List<WeatherComment> index(String username) {
		
		return wComRepo.findAll();
	}

	@Override
	public List<WeatherComment> show( String username, int wid) {
	
		return wComRepo.findByUser_UsernameAndId(username, wid);
	}

	@Override
	public WeatherComment create(String username, WeatherComment wComment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WeatherComment update(String username, int wid, WeatherComment wComment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean destroy(String username, int wid) {
		// TODO Auto-generated method stub
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
