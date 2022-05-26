package kr.ac.kopo.movie_project.service;

import java.util.List;

import kr.ac.kopo.movie_project.model.Board;
import kr.ac.kopo.movie_project.util.Pager;
import kr.ac.kopo.movie_project.util.PagerBoardId;

public interface ServiceCenterservice {

	List<Board> list(PagerBoardId pager, Long boardId);

	void add(Board item);

	void update(Board item);

	Board item(int boardId, int articleId);

	void delete(Long boardId, Long articleId);

}
