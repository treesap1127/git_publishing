package kr.ac.kopo.movie_project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieImage;
@Repository
public class ImageDaoImpl implements ImageDao {
	@Autowired
	SqlSession sql;
	@Override
	public void imageadd(MovieImage movieimage) {
		sql.insert("image.add", movieimage);
	}
	@Override
	public void delete(Movie item) {
		sql.delete("image.delete",item);
		
	}
	@Override
	public void th_delete(String theaterName) {
		sql.delete("image.th_delete",theaterName);
		
	}
	@Override
	public void ci_delete(String cinemaCode) {
		sql.delete("image.ci_delete",cinemaCode);
		
	}

}
