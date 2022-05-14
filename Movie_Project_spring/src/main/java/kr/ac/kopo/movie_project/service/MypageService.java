package kr.ac.kopo.movie_project.service;

import java.util.List;

import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.model.Theater;

public interface MypageService {

	List<MovieAdmin> list(String id);

	void sit_add(Theater item);

	List<Theater> theaterlist(String cinemaCode);

	List<Theater> theaterlist(String cinemaCode, String theaterName);

	void sitUpdate(Theater item);

	void theater_delete(String cinemaCode, String theaterName);

}
