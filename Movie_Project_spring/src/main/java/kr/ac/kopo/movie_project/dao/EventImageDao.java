package kr.ac.kopo.movie_project.dao;

import kr.ac.kopo.movie_project.model.EventImage;

public interface EventImageDao {

	void add(EventImage image);

	boolean delete(int eventId);

}
