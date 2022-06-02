package kr.ac.kopo.movie_project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.Faq;
import kr.ac.kopo.movie_project.model.Notice;
import kr.ac.kopo.movie_project.util.Pager;
@Repository
public class NoticeDaoImpl implements NoticeDao {
@Autowired
SqlSession sql;
	@Override
	public List<Notice> list(Pager pager) {
		return sql.selectList("Notice.list",pager);
		
	}

	@Override
	public String add(Notice item) {
		try {
			sql.insert("Notice.add", item);
		} catch (Exception e) {
			return "false";
		}
		return "true";
	}

	@Override
	public Notice item(int articleId) {
		return sql.selectOne("Notice.item", articleId);
	}

	@Override
	public void delete(int articleId) {
		sql.delete("Notice.delete",articleId);

	}

	@Override
	public String update(Notice item) {
		try {
		sql.update("Notice.update",item);
		} catch (Exception e) {
			return "false";
		}
		return "true";
	}

	@Override
	public List<Notice> notice() {
		return sql.selectList("Notice.notice");
	}

	@Override
	public List<Faq> faq() {
		return sql.selectList("Notice.faq");
	}


}
