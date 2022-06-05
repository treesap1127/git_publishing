package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.movie_project.dao.AdminDao;
import kr.ac.kopo.movie_project.model.MovieAdmin;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDao dao;
	@Override
	public List<MovieAdmin> admin() {
		return dao.admin();
	}
	@Transactional
	@Override
	public void approve(String cinemaCode,String id) {
		dao.approve(cinemaCode);
		dao.approveId(id);
	}
	@Override
	public void reject(String cinemaCode) {
		dao.reject(cinemaCode);
		
	}
	@Override
	public List<MovieAdmin> adminTable() {
		return dao.adminTable();
	}
	@Override
	public MovieAdmin cinemaItem(String cinemaCode) {
		return dao.cinemaItem(cinemaCode);
	}
	@Override
	public void cinemaUpdate(MovieAdmin item) {
		dao.cinemaUpdate(item);
	}

}
