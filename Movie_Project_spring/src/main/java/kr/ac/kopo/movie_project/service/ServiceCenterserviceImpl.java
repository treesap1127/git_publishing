package kr.ac.kopo.movie_project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.movie_project.dao.ServiceCenterDao;
import kr.ac.kopo.movie_project.dao.boardImageDao;
import kr.ac.kopo.movie_project.model.Board;
import kr.ac.kopo.movie_project.model.BoardImage;
import kr.ac.kopo.movie_project.util.PagerBoardId;
@Service
public class ServiceCenterserviceImpl implements ServiceCenterservice {
	@Autowired
	ServiceCenterDao dao;
	@Autowired
	boardImageDao boardImageDao;
	@Override
	public List<Board> list(PagerBoardId pager,Long boardId) {
		pager.setBoardId(boardId);
		int total = dao.total(pager);
		pager.setTotal(total);
		return dao.list(pager);
	}

	
	@Override
	public void add(Board item) {
		dao.add(item);
		
		if(item.getImages() != null) {
			for (BoardImage image : item.getImages()) {
				image.setBoardCode(item.getArticleId());
				
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






}
