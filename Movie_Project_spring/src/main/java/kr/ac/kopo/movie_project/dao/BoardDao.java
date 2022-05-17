package kr.ac.kopo.movie_project.dao;

import java.util.List;

import kr.ac.kopo.movie_project.model.BoardMaster;

public interface BoardDao {

	List<BoardMaster> list();

	void add(BoardMaster item);

	void createTable(int boardId);

	void update(BoardMaster item);

	BoardMaster item(int boardId);

	void delete(int boardId);

	void deleteTable(int boardId);

}
