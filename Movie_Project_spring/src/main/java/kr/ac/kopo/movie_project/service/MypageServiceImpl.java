package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.movie_project.dao.MypageDao;
import kr.ac.kopo.movie_project.model.MovieAdmin;
@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	MypageDao dao;
	@Override
	public List<MovieAdmin> list(String id) {
		return dao.list(id);
	}

}
