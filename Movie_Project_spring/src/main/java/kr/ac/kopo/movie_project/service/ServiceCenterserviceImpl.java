package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.movie_project.dao.ServiceCenterDao;
import kr.ac.kopo.movie_project.model.Board;
@Service
public class ServiceCenterserviceImpl implements ServiceCenterservice {
	@Autowired
	ServiceCenterDao dao;
	@Override
	public List<Board> list() {
		
		return dao.list();
	}
	@Override
	public void add(Board item) {
		dao.add(item);
		
	}
	@Override
	public Board item(int articleId) {
		
		return dao.item(articleId);
	}
	@Override
	public void update(Board item) {
		dao.update(item);
		
	}
	@Override
	public void delete(int articleId) {
		dao.delete(articleId);
		
	}

}
