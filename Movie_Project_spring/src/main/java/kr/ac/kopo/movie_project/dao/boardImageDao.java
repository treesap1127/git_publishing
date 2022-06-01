package kr.ac.kopo.movie_project.dao;

import kr.ac.kopo.movie_project.model.BoardImage;

public interface boardImageDao {

	void add(BoardImage image);

	boolean delete(int code);

}
