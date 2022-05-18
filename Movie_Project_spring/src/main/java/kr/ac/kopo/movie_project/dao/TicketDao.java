package kr.ac.kopo.movie_project.dao;

import java.util.List;

import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieAdmin;

public interface TicketDao {

	List<Movie> movielist();

	List<MovieAdmin> movieplace(MovieAdmin bicCity);

	List<MovieAdmin> cinema(MovieAdmin item);

	List<Movie> cinemaCode(Movie item);


}
