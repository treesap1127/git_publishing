package kr.ac.kopo.movie_project.dao;

import java.util.List;

import kr.ac.kopo.movie_project.model.MovieAdmin;

public interface AdminDao {

	List<MovieAdmin> admin();

	void approve(String cinemaCode);

	void reject(String cinemaCode);

	List<MovieAdmin> adminTable();

	void approveId(String id);

	MovieAdmin cinemaItem(String cinemaCode);

	void cinemaUpdate(MovieAdmin item);

}
