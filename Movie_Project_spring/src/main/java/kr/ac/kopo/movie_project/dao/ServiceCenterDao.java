package kr.ac.kopo.movie_project.dao;

import java.util.List;

import kr.ac.kopo.movie_project.model.Faq;
import kr.ac.kopo.movie_project.model.MovieAdmin;

public interface ServiceCenterDao {

	void FaqAdd(Faq item);

	Faq item(int faqId);

	void update(Faq item);

	List<Faq> list();

	void delete(int faqId);

	List<Faq> list1();

	List<Faq> list2();

	List<Faq> list3();

	String adminAdd(MovieAdmin item);

	

}
