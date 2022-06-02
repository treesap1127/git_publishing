package kr.ac.kopo.movie_project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.Faq;
@Repository
public class ServiceCenterDaoImpl implements ServiceCenterDao {
	@Autowired
	SqlSession sql;
	

	@Override
	public List<Faq> list() {
		
		return sql.selectList("Faq.list");
	}

	@Override
	public void FaqAdd(Faq item) {
		sql.insert("Faq.add", item);
		
	}

	@Override
	public Faq item(int faqId) {
		
		return sql.selectOne("Faq.item",faqId);
	}

	@Override
	public void update(Faq item) {
		sql.update("Faq.update", item);
		
	}

	@Override
	public void delete(int faqId) {
		sql.delete("Faq.delete", faqId);
		
	}
	@Override
	public List<Faq> list1() {
		return sql.selectList("Faq.list1");
	}
	@Override
	public List<Faq> list2() {
		return sql.selectList("Faq.list2");
	}
	@Override
	public List<Faq> list3() {
		return sql.selectList("Faq.list3");
	}

}