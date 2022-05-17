package kr.ac.kopo.movie_project.dao;

import java.util.HashMap;
import java.util.List;

import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.model.Theater;

public interface MypageDao {

	List<MovieAdmin> list(String id);

	void sit_add(Theater item);

	List<Theater> theaterlist(String cinemaCode);

	List<Theater> theaterlist(String cinemaCode, String theaterName);

	void sitUpdate(Theater item);

	void theater_delete(String cinemaCode, String theaterName);

	void deleteTheater(String cinemaCode);

	void deleteCinema(String cinemaCode);

	List<Movie> movielist(HashMap<String, Object> map);

	void movieadd(Movie item);

	void moviedelete(Movie item);

	void movie_delete(String cinemaCode, String theaterName);

	void movie_all_delete(String cinemaCode);

}
