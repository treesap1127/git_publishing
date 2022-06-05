package kr.ac.kopo.movie_project.service;

import java.util.List;

import kr.ac.kopo.movie_project.model.MovieAdmin;

public interface AdminService {

	List<MovieAdmin> admin();

	void approve(String cinemaCode, String id);

	void reject(String cinemaCode);

	List<MovieAdmin> adminTable();

	MovieAdmin cinemaItem(String cinemaCode);

	void cinemaUpdate(MovieAdmin item);

}
