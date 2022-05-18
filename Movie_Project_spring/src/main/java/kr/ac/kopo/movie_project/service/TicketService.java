package kr.ac.kopo.movie_project.service;

import java.util.List;

import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieAdmin;

public interface TicketService {

	List<Movie> movielist();

	List<MovieAdmin> movieplace(MovieAdmin bicCity);

	List<Movie> cinema(MovieAdmin item);

	List<Movie> cinemaCode(Movie item);

	List<Movie> cinematime(Movie item);

}
