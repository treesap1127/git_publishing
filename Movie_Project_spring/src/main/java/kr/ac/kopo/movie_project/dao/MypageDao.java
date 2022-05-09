package kr.ac.kopo.movie_project.dao;

import java.util.List;

import kr.ac.kopo.movie_project.model.MovieAdmin;

public interface MypageDao {

	List<MovieAdmin> list(String id);

}
