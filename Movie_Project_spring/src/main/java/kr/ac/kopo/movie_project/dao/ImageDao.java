package kr.ac.kopo.movie_project.dao;

import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieImage;

public interface ImageDao {

	void imageadd(MovieImage movieimage);

	void delete(Movie item);

	void th_delete(String theaterName);

	void ci_delete(String cinemaCode);


}
