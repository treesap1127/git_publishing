package kr.ac.kopo.movie_project.service;

import java.util.List;

import kr.ac.kopo.movie_project.model.Faq;

public interface ServiceCenterservice {

	void FaqAdd(Faq item);

	Faq item(int faqId);

	void faqupdate(Faq item);

	List<Faq> list();

	void delete(int faqId);

}
