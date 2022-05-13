package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.movie_project.dao.MypageDao;
import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.model.Theater;
import kr.ac.kopo.movie_project.model.TheaterList;
@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	MypageDao dao;
	@Override
	public List<MovieAdmin> list(String id) {
		return dao.list(id);
	}
	@Override
	public void sit_add(Theater item) {
		String sit_st=item.getSit().toString();
		String sit_item=sit_st.substring(1, sit_st.length() - 1);
		item.setSit_str(sit_item);
		dao.sit_add(item);
		
	}
	@Override
	public List<Theater> theaterlist(String cinemaCode) {
		return dao.theaterlist(cinemaCode);
	}
	@Override
	public List<TheaterList> theaterlist(String cinemaCode, String theaterName) {
		return dao.theaterlist(cinemaCode,theaterName);
	}

}
