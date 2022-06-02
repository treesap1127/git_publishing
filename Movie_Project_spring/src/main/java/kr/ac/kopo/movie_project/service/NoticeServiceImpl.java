package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.movie_project.dao.NoticeDao;
import kr.ac.kopo.movie_project.model.Notice;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeDao dao;
	@Override
	public List<Notice> list() {
		
		return dao.list();
	}

	@Override
	public void add(Notice item) {
		dao.add(item);

	}

	@Override
	public Notice item(int articleId) {
		return dao.item(articleId);
	}

	@Override
	public void delete(int articleId) {
		dao.delete(articleId);

	}

	@Override
	public void update(Notice item) {
		dao.update(item);

	}

}
