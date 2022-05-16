package kr.ac.kopo.movie_project.dao;

import java.util.List;

import kr.ac.kopo.movie_project.model.Board;
import kr.ac.kopo.movie_project.util.Pager;

public interface ServiceCenterDao {

	List<Board> list(Pager pager);

	void add(Board item);

	Board item(int articleId);

	void update(Board item);

	void delete(int articleId);

	int total(Pager pager);

	

}
