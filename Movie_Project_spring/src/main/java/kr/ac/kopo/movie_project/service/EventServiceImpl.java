package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.movie_project.dao.EventDao;
import kr.ac.kopo.movie_project.dao.EventImageDao;
import kr.ac.kopo.movie_project.model.Event;
import kr.ac.kopo.movie_project.model.EventImage;
import kr.ac.kopo.movie_project.util.Pager;
@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDao dao;
	
	@Autowired
	EventImageDao eventImageDao; 
	
	@Override
	public List<Event> continue_Event(Pager pager) {
		int total = dao.total(pager);
		pager.setTotal(total);
		return dao.continue_Event(pager);
	}

	@Override
	public List<Event> end_Event(Pager pager) {
		
		return dao.end_Event(pager);
	}

	@Override
	@Transactional
	public void NoticeEventAdd(Event item) {
		
		dao.NoticeEventAdd(item);
		
		if(item.getImages() != null) {
			for(EventImage image : item.getImages()) {
				image.setEventId( item.getEventId() );
				
				eventImageDao.add(image);
			}
		}	
		
	}

	@Override
	public void delete(int eventId) {
		dao.delete(eventId);
		
	}

	@Override
	@Transactional
	public void NoticeEventUpdate(Event item) {
		dao.NoticeEventUpdate(item);
		
		if(item.getImages() != null) {
			for(EventImage image : item.getImages()) {
				image.setEventId( item.getEventId() );
				
				eventImageDao.add(image);
			}
		}
		
	}

	@Override
	public Event item(int eventId) {
		
		return dao.item(eventId);
	}

	@Override
	public void viewcnt(Event item) {
		dao.viewcnt(item);
		
	}
	
	
	@Transactional
	@Override
	public void deleteList(List<Integer> list) {
		for(Integer eventId : list) 
			dao.delete(eventId);		
	}

	@Override
	public boolean deleteImage(int eventId) {		
		return eventImageDao.delete(eventId);
	}

	
	

}
