package kr.ac.kopo.movie_project.dao;

import java.util.List;

import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.model.Theater;
import kr.ac.kopo.movie_project.model.TheaterList;

public interface MypageDao {

	List<MovieAdmin> list(String id);

	void sit_add(Theater item);

	List<Theater> theaterlist(String cinemaCode);

	List<TheaterList> theaterlist(String cinemaCode, String theaterName);

}
