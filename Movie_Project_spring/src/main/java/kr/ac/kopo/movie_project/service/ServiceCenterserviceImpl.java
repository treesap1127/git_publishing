package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.movie_project.dao.ServiceCenterDao;
import kr.ac.kopo.movie_project.model.Faq;
@Service
public class ServiceCenterserviceImpl implements ServiceCenterservice {
	@Autowired
	ServiceCenterDao dao;

	@Override
	public List<Faq> list() {
		
		return dao.list();
	}


	@Override
	public void FaqAdd(Faq item) {
		dao.FaqAdd(item);
		
	}

	@Override
	public Faq item(int faqId) {
		
		return dao.item(faqId);
	}


	@Override
	public void faqupdate(Faq item) {
		dao.update(item);
		
	}


	@Override
	public void delete(int faqId) {
		dao.delete(faqId);
		
	}

}
