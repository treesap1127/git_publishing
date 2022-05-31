package kr.ac.kopo.movie_project.dao;

import java.util.List;

import kr.ac.kopo.movie_project.model.Board;
import kr.ac.kopo.movie_project.util.Pager;
import kr.ac.kopo.movie_project.util.PagerBoardId;

public interface ServiceCenterDao {

	List<Board> list(PagerBoardId pager);

	void add(Board item);

	void update(Board item);

	int total(PagerBoardId pager);

	Board item(int boardId, int articleId);

	void delete(Long boardId, Long articleId);

	int maxitem(Board item);

	

}
