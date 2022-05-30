package kr.ac.kopo.movie_project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.BoardImage;
@Repository
public class boardImageDaoImpl implements boardImageDao {
@Autowired
SqlSession sql;
	@Override
	public void add(BoardImage image) {
		sql.insert("boardimage.add",image);

	}

	@Override
	public boolean delete(int code) {
		if(sql.delete("boardimage.delete",code)>0)
			return true;
		else
			return false;
	}
}
