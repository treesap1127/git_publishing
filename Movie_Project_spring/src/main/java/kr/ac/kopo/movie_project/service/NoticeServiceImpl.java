package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.movie_project.dao.NoticeDao;
import kr.ac.kopo.movie_project.model.Notice;
import kr.ac.kopo.movie_project.util.Pager;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeDao dao;
	@Override
	public List<Notice> list(Pager pager) {
		return dao.list(pager);
	}

	@Override
	public String add(Notice item) {
		return dao.add(item);

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
	public String update(Notice item) {
		return dao.update(item);

	}

	@Override
	public List<Notice> notice() {
		return dao.notice();
	}

}
