package kr.ac.kopo.movie_project.dao;

import java.util.List;

import kr.ac.kopo.movie_project.model.Notice;

public interface NoticeDao {

	List<Notice> list();

	void add(Notice item);

	Notice item(int articleId);

	void delete(int articleId);

	void update(Notice item);

}
