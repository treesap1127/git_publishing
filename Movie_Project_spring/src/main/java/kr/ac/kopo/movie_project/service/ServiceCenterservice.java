package kr.ac.kopo.movie_project.service;

import java.util.List;

import kr.ac.kopo.movie_project.model.Board;
import kr.ac.kopo.movie_project.util.Pager;

public interface ServiceCenterservice {

	List<Board> list(Pager pager, Long boardId);

	void add(Board item);

	void update(Board item);

	void delete(int boardId,int articleId);

	Board item(int boardId, int articleId);

}
