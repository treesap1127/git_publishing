package kr.ac.kopo.movie_project.service;

import java.util.List;

import kr.ac.kopo.movie_project.model.BoardMaster;

public interface BoardService {

	List<BoardMaster> list();

	BoardMaster item(int boardId);

	void delete(int boardId);

	void update(BoardMaster item);

	void BoardTableadd(BoardMaster item);

	int boardid();




	

}
