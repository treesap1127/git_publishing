package kr.ac.kopo.movie_project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.Notice;
@Repository
public class NoticeDaoImpl implements NoticeDao {
@Autowired
SqlSession sql;
	@Override
	public List<Notice> list() {
		return sql.selectList("Notice.list");
	}

	@Override
	public void add(Notice item) {
		sql.insert("Notice.add", item);

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
	public void update(Notice item) {
		sql.update("Notice.update",item);

	}

}
