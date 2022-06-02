package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.movie_project.dao.ServiceCenterDao;
import kr.ac.kopo.movie_project.dao.boardImageDao;
import kr.ac.kopo.movie_project.model.Board;
import kr.ac.kopo.movie_project.model.BoardImage;
import kr.ac.kopo.movie_project.model.Faq;
import kr.ac.kopo.movie_project.util.PagerBoardId;
@Service
public class ServiceCenterserviceImpl implements ServiceCenterservice {
	@Autowired
	ServiceCenterDao dao;
	@Autowired
	boardImageDao boardImageDao;
	@Override
	public List<Board> list(PagerBoardId pager) {
		int total = dao.total(pager);
		pager.setTotal(total);
		return dao.list(pager);
	}

	
	@Override
	@Transactional
	public void add(Board item) {
		
		dao.add(item);
		int articleId=dao.maxitem(item);
		
		 item.setArticleId(articleId);
		
		if(item.getImages() != null) {
			
			for (BoardImage image : item.getImages()) {
				image.setArticleId(item.getArticleId());
				image.setBoardId(item.getBoardId());
				System.out.println("사이"+image.getArticleId()+"사이"+image.getBoardId());
				
				boardImageDao.add(image);
				  
			}
		} 
	}

	@Override
	public void update(Board item) {
		dao.update(item);
		
	}


	@Override
	public Board item(int boardId, int articleId) {
	
		return dao.item(boardId, articleId);
	}


	@Override
	public void delete(Long boardId, Long articleId) {
		dao.delete(boardId, articleId);
	}


	
	@Override
	public boolean deleteImage(int code) {
		
		return boardImageDao.delete(code);
	}


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
