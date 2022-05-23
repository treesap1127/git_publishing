package kr.ac.kopo.movie_project.dao;

import java.util.List;

import kr.ac.kopo.movie_project.model.Board;
import kr.ac.kopo.movie_project.util.Pager;

public interface ServiceCenterDao {

	List<Board> list(Pager pager, Long boardId);

	void add(Board item);

	void update(Board item);

	int total(Pager pager);

	Board item(int boardId, int articleId);

	void delete(int boardId, int articleId);

	

}
